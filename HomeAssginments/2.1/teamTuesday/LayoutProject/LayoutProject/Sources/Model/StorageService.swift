//
//  StorageService.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//
//Protocol for class StorageService
import Foundation
import UIKit

protocol StorageServiceProtocol {
    associatedtype MusiciansType: GroupProtocol
    associatedtype AlbumsType
    func getBand()-> Band <MusiciansType, AlbumsType>
}
protocol SpecificBandProtocol {
    func getBand()-> Band <String, String>
}

//Extention for protocol StorageService
extension StorageService: SpecificBandProtocol where MusiciansType == String, AlbumsType == String{

}

////Extention for protocol SpecificBandProtocol
//extension SpecificBandProtocol: StorageService where MusiciansType == String, AlbumsType == String{
//
//}

class StorageService<MusiciansType: GroupProtocol, AlbumsType>: StorageServiceProtocol{
    private var band: [Band<MusiciansType, AlbumsType>] = []
    init(band:[Band<MusiciansType, AlbumsType>]){
    self.band = band
    }
    func getBand()-> Band<MusiciansType, AlbumsType>{
        return band.randomElement()!
        
    }
} 
 
let ss: SpecificBandProtocol = StorageService(band: [])
