//
//  StorageService.swift
//  LayoutProject
//  Created by Maryna Snigurska on 18/12/2020.
//


import UIKit

//Protocol for class StorageService
protocol StorageServiceProtocol {
    associatedtype MusiciansType: GroupProtocol
    associatedtype AlbumsType
    func showNextBand()-> Band <MusiciansType, AlbumsType>
    func showPrevBand()-> Band <MusiciansType, AlbumsType>
}


//Protocol for change type from generic to explicit type "String" in StorageServiceProtocol??
protocol SpecificBandProtocol {
    func showNextBand()-> Band <String, String>
    func showPrevBand()-> Band <String, String>
}

//Extention for StorageService for using SpecificBandProtocol ??
extension StorageService: SpecificBandProtocol where MusiciansType == String, AlbumsType == String{

}

class StorageService<MusiciansType: GroupProtocol, AlbumsType>: StorageServiceProtocol{
    private var band: [Band<MusiciansType, AlbumsType>] = []
    init(band:[Band<MusiciansType, AlbumsType>]){
    self.band = band
    }
    var currentIndex:Int = 0
    func showNextBand()-> Band<MusiciansType, AlbumsType>{
        currentIndex = (currentIndex + 1) % band.count
        return band[currentIndex]
    }
    func showPrevBand()-> Band<MusiciansType, AlbumsType>{
        currentIndex = (currentIndex - 1) % band.count
        if currentIndex == -1 {
            currentIndex = band.count - 1
        }
        return band[currentIndex]
    }
} 
 
