//
//  ImageLoading.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 30/01/2021.
//

import Foundation

protocol ImageLoading {
    func fetchImage(
        url: URL,
        callback: @escaping ((Result<Image, Error>)  -> ())
    )

}


extension NetworkController: ImageLoading { }
