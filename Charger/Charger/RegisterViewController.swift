//
//  ViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 29.06.2022.
//

import UIKit
import Lottie
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet var ViewUI: UIView!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var introTextWhite: UILabel!
    @IBOutlet weak var introTextGray: UILabel!
   
    @IBOutlet weak var EmailInput: UITextField!
    
   
    @IBOutlet weak var pageLabel: UILabel!
    override func viewDidLoad() {
        ıntroPageColors()
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()

       
    }
    
    func ıntroPageColors(){
        introTextWhite.textColor = Theme.textColor
        introTextGray.textColor = Theme.grayColor
        ViewUI.backgroundColor = Theme.backgroundColor
        EmailInput.backgroundColor = Theme.backgroundColor
        pageLabel.textColor = Theme.textColor
       
       
       
    
    
    }

}

