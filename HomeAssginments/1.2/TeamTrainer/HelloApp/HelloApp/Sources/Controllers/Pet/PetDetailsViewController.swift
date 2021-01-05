//
//  PetDetailsViewController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import UIKit

class PetDetailsViewController: UIViewController {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var currentPet: Pet?

    var petService: StorageServiceProtocol!

    // MARK: Overrides
    override func viewDidLoad() {
        petService = StorageService()
        petService.loadPets()
        collectionView.allowsMultipleSelection = false

        super.viewDidLoad()
        if let currentPet = currentPet {
            updateUI(for: currentPet)
        } else {
            refresh()
        }
    }

    // MARK: Action

    @IBAction func buttonTapped(_ sender: UIButton) {

        guard let container = self.imageView.superview else { return }

        // подготовка - трансофрмация перпективы
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = 1.0 / 500.0;

        // Запуск анимации
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseIn]
        ) {
            // Анимация:  Матрицу перепективы повернуть на 90 градусов относительно оси Y: (0,1,0)
            container.layer.transform = CATransform3DRotate(perspectiveTransform, .pi / 2, 0, 1, 0)
        } completion: { _ in
            // Блок выполнятется когда анимация закончится.

            // Кода анимация закончится - карта станет на ребро - обновить карту
            self.refresh()

            // Карта повернута на 90 градусов - если повернуть еще на 90 - окажется перевернута на 180
            // Если задать поворот до 0 - карта повернется в обратную сторону
            // Соотвевенно надо вначале без анимации повернуть карту на 270 градусов, а потом довернуть до 360 (0)

            // Подготовка: повернуть карту до 90 градусов, но в обратную сторону (ось (0,-1, 0)
            container.layer.transform = CATransform3DRotate(perspectiveTransform, .pi / 2, 0, -1, 0)

            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut]) {
                // Анимация - вернуть в исходное состояние
                container.layer.transform = CATransform3DIdentity
            }
        }

    }

    // MARK: Custom private functions

    fileprivate func updateUI(for pet: Pet) {
        topTitleLabel.text = pet.name
        imageView.image = pet.image ?? #imageLiteral(resourceName: "default")
        subTitleLabel.text = pet.shortDescription

        collectionView.reloadData()
    }

    fileprivate func refresh() {
        let pet = petService.getPet()
        currentPet = pet

        updateUI(for: pet)
    }
}

// MARK: CollectionView DataSource
extension PetDetailsViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        guard let pet = currentPet else { return 0 }

        return pet.tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // ! не зыбываем добавить ReuseIndetifier в StoryBoard !
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell", for: indexPath)

        guard let tag = currentPet?.tags[indexPath.item] else { return cell}

        let petTagCell = cell as? PetTagCollectionViewCell

        petTagCell?.tagLabel.text = tag

        return cell
    }

}

extension PetDetailsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let tag = currentPet?.tags[indexPath.item] else { return }
        print("tag selected \(tag)")

        view.backgroundColor = (indexPath.item % 2 == 0) ? .systemRed : .systemGreen

    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        if collectionView.indexPathsForSelectedItems?.count == 0 {
            view.backgroundColor = .white
        }
    }
}

