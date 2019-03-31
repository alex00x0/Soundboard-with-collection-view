//
//  ViewController.swift
//  Soundboard with collection view
//
//  Created by Alexander Niehaus on 3/31/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var sounds : [Sounds] = Sounds(statement: "A", file: <#T##URL#>)

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

