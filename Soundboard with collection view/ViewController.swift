//
//  ViewController.swift
//  Soundboard with collection view
//
//  Created by Alexander Niehaus on 3/31/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    
    lazy var sounds : [Sounds] =
//        [Sounds(statement: "A"), Sounds(statement: "B"), Sounds(statement: "C"), Sounds(statement: "D")]
                            [Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")),
                            Sounds(statement: "B", file: Bundle.main.url(forResource: "B", withExtension: "aifc")),
                            Sounds(statement: "C", file: Bundle.main.url(forResource: "C", withExtension: "aifc")),
                            Sounds(statement: "D", file: Bundle.main.url(forResource: "D", withExtension: "aifc"))]

    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func playSound(_ sender: Any) {
        let urlA = Bundle.main.url(forResource: "A", withExtension: "aifc")
        
        guard urlA != nil else {
            return
        }

        do{
            audioPlayer = try AVAudioPlayer(contentsOf: urlA!)
            audioPlayer?.play()
            print("audio is playing")
        } catch {
            print("error")
        }
        
        //1
//        let buttonPosition: CGPoint = sender.location(in: self.collectionView)
//        guard let indexPath = self.collectionView?.indexPathForItem(at: buttonPosition) else { return }
//
//        print ("doubleTap on cell at: ", indexPath)
        
        
        //2
        //let cell = self.collectionView.cellForItem(at: indexPath)
        // now you have the cell and have access to the button

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.width - 40) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        }
    
    let sender : Any? = nil
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        func cellTapped(selectedIndex: IndexPath) {
//            let cellSelected = Int(selectedIndex)
//            print("Selected cell named: \(sounds[selectedIndex].statement)")
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soundCell", for: indexPath) as! CollectionViewCell
        let Soundz = sounds[indexPath.item]
        cell.cellLabel.text = Soundz.statement
        
        return cell
    }

}

