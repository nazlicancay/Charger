//
//  ViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 29.06.2022.
//

import UIKit
import Lottie
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet var ViewUI: UIView!
    
    @IBOutlet weak var introTextGray: UILabel!
    @IBOutlet weak var EmailInput: UITextField!
    
    private var locationManager:CLLocationManager?
    
    
    override func viewDidLoad() {
        RegisterPageColors()
        super.viewDidLoad()
       getUserLocation()
        UIViewController()
        

       
    }
    
    
    
   
    func getUserLocation() {
        
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self

        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            ApiManager.APIInstance.UserLatitude = (String (location.coordinate.latitude))
            ApiManager.APIInstance.UserLongitude = (String(location.coordinate.longitude))
            
           
            
        }
    }
    
    func RegisterPageColors(){
        EmailInput.attributedPlaceholder = NSAttributedString(string: "Email adresi giriniz",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
      
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
                ApiManager.APIInstance.getCityNames()
                
            }
            else{
                debugPrint(" cant register ")

                
            }

            
        }
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    



