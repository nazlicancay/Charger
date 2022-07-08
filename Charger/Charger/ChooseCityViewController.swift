//
//  ChooseCityViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 7.07.2022.
//

import UIKit

class ChooseCityViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var Background: UIView!
    @IBOutlet var chooseCityBackground: TableViewCell!
    @IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        ApiManager.APIInstance.getCityNames()

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 81
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CityTableCellId") as! TableViewCell
            
           

            tableViewCell.cityNameLabel.text = "deneme"
            tableViewCell.cityNameLabel.textColor = Theme.textColor
            chooseCityBackground.backgroundColor = Theme.backgroundColor
            Background.backgroundColor = Theme.backgroundColor
            
            return tableViewCell
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
