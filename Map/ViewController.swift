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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        // 入力された文字を取り出す
        if let searchKey = textField.text {
            // 入力された文字をデバッグエリアに表示
            print(searchKey)
            
            // CLGeocoderインスタンスを取得
            let geocoder = CLGeocoder()
            
            // 入力された文字から位置情報を取得
            geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks, error) in
                // 位置情報が存在する場合は取り出す
                if let unwrapPlacemarks = placemarks {
                    // 1件目の情報を取り出す
                    if let firstPlacemark = unwrapPlacemarks.first {
                        // 位置情報を取り出す
                        if let location = firstPlacemark.location {
                            // 位置情報から緯度経度を取り出す
                            let targetCoodinate = location.coordinate
                            // コンソールに緯度経度を出力
                            print(targetCoodinate)
                            // MKPointAnnotationインスタンスを取得し、ピンを生成
                            let pin = MKPointAnnotation()
                            // ピンを置く場所の緯度経度を設定
                            pin.coordinate = targetCoodinate
                            // ピンのタイトルを設定
                            pin.title = searchKey
                            // ピンを地図に置く
                            self.dispMap.addAnnotation(pin)
                            // 緯度経度を中心にして半径500mwの範囲を表示
                            self.dispMap.region = MKCoordinateRegion(center: targetCoodinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
                }
            })
        }
        
        // デフォルト操作を行うのでTrueを返す
        return true
    }
    @IBAction func changeMapButton(_ sender: UIButton) {
        
    }
}

