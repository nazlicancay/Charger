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
    
    
    override func viewDidLoad() {
        RegisterPageColors()
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()

       
    }
   
    
    func RegisterPageColors(){
        EmailInput.attributedPlaceholder = NSAttributedString(string: "Email adresi giriniz",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        introTextWhite.textColor = Theme.textColor
        introTextGray.textColor = Theme.grayColor
        ViewUI.backgroundColor = Theme.backgroundColor
        EmailInput.backgroundColor = Theme.backgroundColor
        
       
    
    }
    
    @IBAction func Register(_ sender: UIButton) {
        Register()
    }
    func Register(){
        guard let email = EmailInput.text else {return }
        let register = login(email: email, deviceUDID: 2)
        ApiManager.APIInstance.callingRegisterAPI(register: register){(isSuccess) in
            if isSuccess {
                debugPrint("register succeesfully")
                
            }
            else{
                debugPrint(" cant register ")

                
            }
            
        }
            }
        }
    



