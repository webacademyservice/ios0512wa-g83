//
//  PetSelectionViewController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 27/12/2020.
//

import UIKit

class PetSelectionViewController: UIViewController {

    // MARK: Embedded Types
    private typealias DataSource = UITableViewDiffableDataSource<Int, Pet>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Pet>

    // MARK: Outlets
    @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!

    // MARK: Public variables

    lazy var petService: StorageServiceProtocol = {
        return DependencyManager.shared.storageService
    }()

    lazy var notificationCenter: NotificationCenter = .default

    // MARK: Private variables
    private var tokens: [AnyObject] = []

    private lazy var dataSource: DataSource = {
        return DataSource(tableView: tableView) { (tableView, indexPath, pet) -> UITableViewCell? in

            let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)

            cell.textLabel?.text = pet.name
            cell.imageView?.image = pet.image

            return cell
        }
    }()

    // MARK: Dynamic properties
    private var pets: [Pet] {
        set {
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(newValue, toSection: 0)
            dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
        get {
            dataSource.snapshot().itemIdentifiers(inSection: 0)
        }
    }

    // MARK: Overrides

    deinit {
        tokens.forEach{ notificationCenter.removeObserver($0) }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .allEvents)
        tableView.refreshControl = refreshControl

        tableView.dataSource = dataSource

        refresh(self)

        subscribe()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard
            let destination = segue.destination as? PetDetailsViewController
        else { return }

        guard
            let selection = tableView.indexPathForSelectedRow else { return }

        let pet = pets[selection.row]

        destination.currentPet = pet
    }

    // MARK: Actions
    
    // Подключен к строке поиска и кнопке
    @IBAction func search(_ sender: Any) {
        guard let query = searchField.text, query.count > 0 else {
            pets = petService.allPets
            return
        }

        pets = petService.search(for: query)
    }

    @IBAction func refresh(_ : Any) {
        tableView.refreshControl?.beginRefreshing()
        self.pets = []
        petService.loadPets { [weak self] result in
            self?.pets = (try? result.get()) ?? []
            self?.tableView.refreshControl?.endRefreshing()
        }
    }

    // MARK: Private functions
    private func subscribe() {

        // Подписаться на изменения клавиатуры
        let keyboardToken = notificationCenter.addObserver(
            forName: UITextField.keyboardWillChangeFrameNotification,
            object: nil,
            queue: .main
        ) { [weak self] (notifcation) in
            guard
                let self = self,
                let info = notifcation.userInfo,
                let frame = info[UITextField.keyboardFrameEndUserInfoKey] as? CGRect,
                let duration = info[UITextField.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else {
                assertionFailure("Notification info is incorrect")
                return
            }

            // Установить начальное состояние таблицы
            self.bottonConstraint.constant = 0
            self.view.layoutIfNeeded()

            // Расчитать прересечение таблицы с клавиатурой
            let viewFrame = self.view.convert(self.tableView.frame, to: nil)
            let intersection = (viewFrame).intersection(frame)

            // Сдавинуть таблицу на высоту пересечения
            self.bottonConstraint.constant = intersection.height

            // Обновить лейаут с анимацией заданой длительности
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        tokens.append(keyboardToken)

        // Подписаться на изменение состояния аппки
        let appStateToken = notificationCenter.addObserver(
            forName: UIApplication.willResignActiveNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.reset()
        }

        tokens.append(appStateToken)
    }

    private func reset() {
        // Сбросить строку поиска
        searchField.text = nil
        // Загрузить всех петов
        pets = petService.allPets
    }

}

// MARK: Старый дата сорс, оставлен для сравнения с Diffable
//extension PetSelectionViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return pets.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)
//
//        let pet = pets[indexPath.row]
//
//        cell.textLabel?.text = pet.name
//        cell.imageView?.image = pet.image
//
//        return cell
//    }
//}
