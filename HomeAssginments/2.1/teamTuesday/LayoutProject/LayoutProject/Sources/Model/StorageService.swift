//
//  StorageService.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import Foundation
import UIKit

//Protocol for class StorageService
protocol StorageServiceProtocol {
    associatedtype MusiciansType: GroupProtocol
    associatedtype AlbumsType
    func getBand()-> Band <MusiciansType, AlbumsType>
}

//Protocol for change type from generic to explicit type "String" in StorageServiceProtocol??
protocol SpecificBandProtocol {
    func getBand()-> Band <String, String>
}

//Extention for StorageService for using SpecificBandProtocol ??
extension StorageService: SpecificBandProtocol where MusiciansType == String, AlbumsType == String{

}

class StorageService<MusiciansType: GroupProtocol, AlbumsType>: StorageServiceProtocol{
    private var band: [Band<MusiciansType, AlbumsType>] = []
    init(band:[Band<MusiciansType, AlbumsType>]){
    self.band = band
    }
    func getBand()-> Band<MusiciansType, AlbumsType>{
        return band.randomElement()!
        
    }
} 
 
