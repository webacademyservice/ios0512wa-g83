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

    var petService: StorageServiceProtocol!

    // MARK: Overrides
    override func viewDidLoad() {
        petService = StorageService()
        petService.loadPets()

        super.viewDidLoad()
        refresh()
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

    fileprivate func refresh() {
        let pet = petService.getPet()
        topTitleLabel.text = pet.name
        imageView.image = pet.image ?? #imageLiteral(resourceName: "default")
        subTitleLabel.text = pet.shortDescription
    }
}
