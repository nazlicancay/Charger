//
//  ChooseCityViewController.swift
//  Charger
//
//  Created by Nazlıcan Çay on 7.07.2022.
//

import UIKit
import SwiftUI

class ChooseCityViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    

    @IBOutlet weak var Background: UIView!
    @IBOutlet var chooseCityBackground: TableViewCell!
    @IBOutlet weak var TableView: UITableView!
    var CityNamesDisplay = [String]()
    
    var CityCells = [TableViewCell]()
    let searchController = UISearchController()
    
    var filteredCityNames = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()


    }
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All" , "Ankara" , "İzmir" , "İstanbul"]
        
        searchController.searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchController.isActive){
            return filteredCityNames.count
        }
        return 81
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CityTableCellId") as! TableViewCell
            
            
            tableViewCell.cityNameLabel.textColor = Theme.textColor
            chooseCityBackground.backgroundColor = Theme.backgroundColor
            Background.backgroundColor = Theme.backgroundColor

            var cityname = tableViewCell
            
            if(searchController.isActive){
                
                cityname.cityNameLabel.text = filteredCityNames[indexPath.row]
            }
            else{
                cityname.cityNameLabel.text = ApiManager.APIInstance.CityNames[indexPath.row]
            }
            

            return tableViewCell
        }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText , scopeButton: scopeButton)
        
    }
    func filterForSearchTextAndScopeButton(searchText : String , scopeButton : String = "All"){
        filteredCityNames = ApiManager.APIInstance.CityNames.filter{
            city in
            let scopeMatch = (scopeButton == "All" || city.lowercased().contains(scopeButton.lowercased()))
            
            if(searchController.searchBar.text != "")
            {
                let searcbarTextMatch = city.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searcbarTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            self.performSegue(withIdentifier: "ChooseStation", sender: self)
            ApiManager.APIInstance.GetStationInfo()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if(segue.identifier == "ChooseStation")
            {
                let indexPath = self.TableView.indexPathForSelectedRow!
                
                let tableViewDetail = segue.destination as? ChooseStationViewController
                
                self.TableView.deselectRow(at: indexPath, animated: true)
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


