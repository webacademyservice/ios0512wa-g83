//
//  ViewController.swift
//  FireNotes
//
//  Created by Mykhailo Vorontsov on 24/01/2021.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

}

class ViewController: UIViewController {

    var notes: [Note] = []

    @IBOutlet weak var collectionView: UICollectionView!

    lazy var dateFormatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().addStateDidChangeListener { [weak self] _, _ in
            self?.reload()
        }

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddNoteViewController else {
            return
        }

        destination.callback = { [weak self, weak destination] in
            self?.addNote(text: $0, isPublic: $1)
            destination?.dismiss(animated: true, completion: nil)
        }

    }

    //MARK: private functions

    private func addNote(text: String, isPublic: Bool) {

        guard let user = Auth.auth().currentUser else { return }

        let note = Note(note: text, date: Date(), authorID: user.uid, isPublic: isPublic)

        do {
            _ = try Firestore.firestore().collection("notes").addDocument(from: note)
            self.reload()
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }

    private func reload() {
        guard
            let user = Auth.auth().currentUser,
            isViewLoaded
        else { return }

        Firestore.firestore().collection("notes").getDocuments { [weak self] (snapshot, error) in


            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard
                let self = self,
                let snapshot = snapshot
            else { return }

            let notes = snapshot.documents
                .compactMap{
                    return try? $0.data(as: Note.self)
                }
                .filter {
                    return $0.authorID == user.uid || $0.isPublic
                }


            self.notes = notes
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }

    }



}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard
            indexPath.item < notes.count,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as? NoteCollectionViewCell

        else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "AddCell", for: indexPath)
        }

        let note = notes[indexPath.item]
        cell.noteLabel.text = note.note
        cell.dateLabel.text = dateFormatter.string(from: note.date)

        return cell
    }


}
