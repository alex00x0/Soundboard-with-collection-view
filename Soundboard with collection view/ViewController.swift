//
//  ViewController.swift
//  Soundboard with collection view
//
//  Created by Alexander Niehaus on 3/31/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sounds : [Sounds] = [Sounds(statement: "A"), Sounds(statement: "B"), Sounds(statement: "C"), Sounds(statement: "D")]
//                            [Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")!),
//                            Sounds(statement: "B", file: Bundle.main.url(forResource: "B", withExtension: "aifc")!),
//                            Sounds(statement: "C", file: Bundle.main.url(forResource: "C", withExtension: "aifc")!),
//                            Sounds(statement: "D", file: Bundle.main.url(forResource: "D", withExtension: "aifc")!)]
//
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.width - 40) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        print(sounds)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soundCell", for: indexPath) as! CollectionViewCell
        let Soundz = sounds[indexPath.item]
        
        cell.cellLabel.text = Soundz.statement
        
        return cell
    }
    
    
}

