//
//  ProfilePageViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 4.07.2022.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var ID: UILabel!
    
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet var ProfilePageBakgraund: UIView!
    override func viewDidLoad() {
        ProfilePageView()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func ProfilePageView(){
        ProfilePageBakgraund.backgroundColor = Theme.backgroundColor
       
        
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
