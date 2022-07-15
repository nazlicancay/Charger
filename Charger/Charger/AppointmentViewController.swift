//
//  AppointmentViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 4.07.2022.
//

import UIKit

class AppointmentViewController: UIViewController {

    @IBOutlet weak var CreateAppointmentButton: UIButton!
    
    @IBOutlet weak var ProfileButton: UIButton!
  
    
    @IBOutlet var AppointmentPageView: UIView!
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppointmentView()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func CrateAppointment(_ sender: Any) {
        
        ApiManager.APIInstance.GetStationInfo()
    }
    func AppointmentView(){
        CreateAppointmentButton.setImage(UIImage(named: "CreateAppointment"), for: .normal)
        
        ProfileButton.setImage(UIImage(named: "Users"), for: .normal)
        
        AppointmentPageView.backgroundColor = Theme.backgroundColor
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
