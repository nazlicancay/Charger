//
//  ProfilePageViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 4.07.2022.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var ID: UILabel!
    
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var ProfileBadge: UIImageView!
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet weak var UserInfoStack: UIStackView!
    @IBOutlet var ProfilePageBakgraund: UIView!
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        ProfilePageView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(_ sender: Any) {
        ApiManager.APIInstance.Logout()
        logOutView()
       
        
    }
    func ProfilePageView(){
        ProfilePageBakgraund.backgroundColor = Theme.backgroundColor
        LogoutButton.setImage(UIImage(named: "Logout Button"), for: .normal)
        Email.textColor = Theme.textColor
        ID.textColor = Theme.textColor
        Email.text = (ApiManager.APIInstance.UserInfo[0]) as? String
        ID.text = (ApiManager.APIInstance.UserInfo[2] ) as? String
       
        
    }
    
    func logOutView(){
        let alert = UIAlertController(title: "çıkış yap", message: "uygulamadan cıkış yapmak üzeresiniz", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            self.Email.text = " "
            self.ID.text = " "
            
        }
        alert.addAction(action)
        present(alert , animated: true)
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
