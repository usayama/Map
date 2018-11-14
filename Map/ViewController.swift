//
//  ViewController.swift
//  Map
//
//  Created by Yusuke Nakane on 2018/11/14.
//  Copyright © 2018 usayama. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テキストフィールドのデリゲート通知先を設定
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
}

