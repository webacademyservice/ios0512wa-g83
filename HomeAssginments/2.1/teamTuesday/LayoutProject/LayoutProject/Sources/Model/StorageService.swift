//
//  StorageService.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//
//Protocol for class StorageService
protocol StorageServiceProtocol {
    associatedtype MusiciansType: GroupProtocol
    associatedtype AlbumsType
    func getBand()-> Band <MusiciansType, AlbumsType>
}

//Extention for protocol StorageServiceProtocol
extension StorageServiceProtocol where MusiciansType == String, AlbumsType == String{
}
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
 
