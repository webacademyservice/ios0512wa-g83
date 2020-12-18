//
//  StorageService.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import Foundation
class StorageService<MusiciansType: GroupProtocol, AlbumsType>{
    private var band: [Band<MusiciansType, AlbumsType>] = []

    init(band:[Band<MusiciansType, AlbumsType>]){
    self.band = band
    }
    
    func getBand()-> Band<MusiciansType, AlbumsType>{
        return band.randomElement()!
        
    }
} 
 
