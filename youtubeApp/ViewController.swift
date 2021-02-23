//
//  ViewController.swift
//  youtubeApp
//
//  Created by KYUNGTAE KIM on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

