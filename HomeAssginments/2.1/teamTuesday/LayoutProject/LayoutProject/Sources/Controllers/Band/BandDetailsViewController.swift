//
//  BandDetailsViewController.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import UIKit

class BandDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var nameSubTitleLabel: UILabel!
    
    @IBOutlet weak var countrySubTitleLabel: UILabel!
    
    @IBOutlet weak var musicianSubTitleLabel: UILabel!
    
    @IBOutlet weak var albumsSubTitleLabel: UILabel!
    
    @IBOutlet weak var descriptionSubTitleLabel: UILabel!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    var bandService: SpecificBandProtocol!
    
    //MARK:Ovverridies
    
    override func viewDidLoad(){ super.viewDidLoad()
        
        bandService = StorageService(band:
                                        [Band(bandName: "The Beatles",
                                              country: "United Kingdom",
                                              musicians: [
                                                "John Lennon",
                                                "Paul McCartney",
                                                "George Harrison",
                                                "Ringo Starr"
                                              ],
                                              allBandAlbums: [
                                                "With the Beatles",
                                                "Beatles 65",
                                                "Help!",
                                                "Magical Mystery Tour"
                                              ],
                                              description: "The Beatles were an English rock band formed in Liverpool in 1960. The group, whose best-known line-up comprised John Lennon, Paul McCartney, George Harrison and Ringo Starr, are regarded as the most influential band of all time.",
                                              img: UIImage(named: "imgBeatles")),
                                         Band(bandName: "Guns and Roses",
                                              country: "United States",
                                              musicians:[
                                                "Axl Rose",
                                                "Duff McKagane",
                                                "Slash"
                                              ] ,
                                              allBandAlbums:[
                                                "Appetite for Destruction",
                                                "G N' R Lies",
                                                "Use Your Illusion",
                                                "The Spaghetti Incident?"
                                              ],
                                              description: "Guns N' Roses, often abbreviated as GNR, is an American hard rock band from Los Angeles, California, formed in 1985.",
                                              img: UIImage(named: "GunsandRoses")),
                                         Band(bandName: "Scorpions",
                                              country: "Germany",
                                              musicians:[
                                                "Rudolf Schenker",
                                                "Klaus Meine",
                                                "Matthias Jabs"
                                              ] ,
                                              allBandAlbums:[
                                                "Lonesome Crow",
                                                "In Trance",
                                                "Animal Magnetism",
                                                "Blackout"
                                              ],
                                              description: "Scorpions are a German heavy metal band formed in 1965 in Hanover by Rudolf Schenker. Since the band's inception, its musical style has ranged from hard rock to heavy metal",
                                              img: UIImage(named: "Scorpions"))
])
    }
    
    // MARK: Action
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        let band = bandService.showNextBand()
        self.setBandInfo(band: band)
    }
    

    @IBAction func greenButtonTapped(_ sender: Any) {
        let band = bandService.showPrevBand()
        self.setBandInfo(band: band)
    }
    
    
    // MARK: Custom private functions
    
    private func setBandInfo(band: Band<String, String>) {
        topTitleLabel.text = band.bandName
        
        nameSubTitleLabel.text = band.bandName
        
        countrySubTitleLabel.text = band.country
        
        musicianSubTitleLabel.text = "\(band.musicians.count) in a group"
        
        albumsSubTitleLabel.text = "\(band.allBandAlbums.count) albums"
        
        descriptionSubTitleLabel.text = band.description
        
        imageView.image = band.img
    }


}
