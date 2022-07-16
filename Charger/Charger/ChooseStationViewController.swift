//
//  ChooseStationViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 14.07.2022.
//

import UIKit
import SwiftUI

class ChooseStationViewController: UIViewController {

    @IBOutlet weak var StationImage1: UIImageView!
    
    @IBOutlet weak var StationImage2: UIImageView!
    
    @IBOutlet weak var StationImage3: UIImageView!
    @IBOutlet weak var StationStack3: UIStackView!
    @IBOutlet weak var StationStack2: UIStackView!
    @IBOutlet weak var StationStack1: UIStackView!
   
    @IBOutlet var Background: UIView!
    
    @IBOutlet weak var ProvinceLabel2: UILabel!
    
    @IBOutlet weak var ProvinceLabel1: UILabel!
    
    @IBOutlet weak var ProvinceLabel3: UILabel!
    
    @IBOutlet weak var DistanceLabel1: UILabel!
    
    @IBOutlet weak var DistanceLabel2: UILabel!
    
  
    @IBOutlet weak var DistanceLabel3: UILabel!
    
    
    @IBOutlet weak var NumberOfSockets1: UILabel!
    
    @IBOutlet weak var NumberOfSockets2: UILabel!
    
    @IBOutlet weak var NumberOfSockets3: UILabel!
    
    
    var ProvinceLabels = [UILabel]()
    var DistanceLabels = [UILabel]()
    var NumberOfSocketsLabels = [UILabel]()
    var StationImages = [UIImageView]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        StaionViewUpdate()
        StationViewDisplay()
        StationTypeImage()

        // Do any additional setup after loading the view.
    }
    
    
    func StationViewDisplay(){
        
        Background.backgroundColor = Theme.backgroundColor
        for i in 0...2 {
            ProvinceLabels[i].textColor = Theme.textColor
            DistanceLabels[i].textColor = Theme.textColor
            NumberOfSocketsLabels[i].textColor = Theme.textColor
            ProvinceLabels[i].text = ApiManager.APIInstance.StationNames[i]
            DistanceLabels[i].text = String(ApiManager.APIInstance.StationDistance[i])
            NumberOfSocketsLabels[i].text = String(ApiManager.APIInstance.StationSocketCount[i])
         }
    
        
    }
  func StaionViewUpdate(){
      
      ProvinceLabels.append(ProvinceLabel1)
      ProvinceLabels.append(ProvinceLabel2)
      ProvinceLabels.append(ProvinceLabel3)
      
      DistanceLabels.append(DistanceLabel1)
      DistanceLabels.append(DistanceLabel2)
      DistanceLabels.append(DistanceLabel3)
      
      NumberOfSocketsLabels.append(NumberOfSockets1)
      NumberOfSocketsLabels.append(NumberOfSockets2)
      NumberOfSocketsLabels.append(NumberOfSockets3)
      
      StationImages.append(StationImage1)
      StationImages.append(StationImage2)
      StationImages.append(StationImage3)


      print(ProvinceLabels.count)

   
        
    }
    
    func StationTypeImage(){
        
        for i in 0...2{
            if(ApiManager.APIInstance.StationSocketType[i] == "AC"){
                StationImages[i].image = UIImage(named: "AC")
            }
            else if (ApiManager.APIInstance.StationSocketType[i] == "DC"){
                StationImages[i].image = UIImage(named: "DC")
            }
            else{
                StationImages[i].image = UIImage(named: "AC-DC")
            }
        }
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
