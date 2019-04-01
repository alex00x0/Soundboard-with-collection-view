//
//  ViewController.swift
//  Soundboard with collection view
//
//  Created by Alexander Niehaus on 3/31/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

struct Sounds{
    var statement : String
    var file : String
}


import UIKit
import AVFoundation


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var avPlayer:AVAudioPlayer!
    
    lazy var sounds : [Sounds] = [
        Sounds(statement: "A", file: "A"),
        Sounds(statement: "B", file: "B"),
        Sounds(statement: "C", file: "C"),
        Sounds(statement: "D", file: "D")
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.width - 40) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soundCell", for: indexPath) as! CollectionViewCell
        let Soundz = sounds[indexPath.item]
        cell.cellLabel.text = Soundz.statement
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fileName = sounds[(indexPath as NSIndexPath).item].file
        let audioPlayer: AVAudioPlayer?
        let url = URL(
            fileURLWithPath: Bundle.main.path(
                forResource: fileName,
                ofType: "aifc")!)
        
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            if let sound = audioPlayer {
                avPlayer = sound
                avPlayer.prepareToPlay()
                avPlayer.play()
            }
        } catch {
            print ("Could not create audio player.")
        }
        
    }
}

