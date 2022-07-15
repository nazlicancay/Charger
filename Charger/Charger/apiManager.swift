//
//  apiManager.swift
//  Charger
//
//  Created by Nazlıcan Çay on 2.07.2022.
//

import Foundation
import Alamofire
import SwiftUI


let registerUrl = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login"

class ApiManager{
    static let APIInstance = ApiManager()

    var UserInfo = [String]()
    var CityNames = [String]()
    var UserLatitude = String()
    var UserLongitude = String()

    

    func callingRegisterAPI(register : login , completionHandler : @escaping (Bool)->()){
        
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(registerUrl, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers:headers).response{ response in //debugPrint(response)
            switch response.result {
                
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: [])
                   
                    if response.response?.statusCode == 200{
                        self.UserInfo  =  self.GetProfile(data: data!)
                        completionHandler(true)
                    }
                    else{
                        completionHandler(false)
                    }
                    print(json)
                   
                }catch{
                    completionHandler(false)

                }
                
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)

                
                
            }
            
        }

    }

    
    func GetProfile(data  : Data ) -> (Array<String> ){
        /// creating an array to store user infos
        /// [0] -> email
        /// [1] -> token
        /// [2] -> UserId
        let DecodedData = try! JSONDecoder().decode(Profile.self, from: data)
        var datas = [String]()
        let token = DecodedData.token
        let email = DecodedData.email
        let UserId = DecodedData.userID
        datas.append(email)
        datas.append(token)
        datas.append(String (UserId))
        return datas

       
    }
    
    func getCityNames(){
        let registerUrl = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces"
        
        let headers: HTTPHeaders = [
            "token": UserInfo[1],
            "Accept": "*/*"
        ]
        
        let params = ["userID": UserInfo[2]]
        
        AF.request(registerUrl, method: .get, parameters: params, encoding: URLEncoding.default, headers:headers).response{ [self] response in //debugPrint(response)
            switch response.result {
                
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: [])
                   
                    if response.response?.statusCode == 200{
                        
                        if let swiftArray = json as! NSArray as? [String] {
                            self.CityNames = swiftArray
                            
                            //print(self.CityNames.count)
                        }
                    }
                    else{
                       
                        print("ELSE")
                    }
                   
                }catch{
                    print("CATCH")

                }
                
            case .failure(let err):
                print(err.localizedDescription)
                print("CATCH")

                
                
            }
           
            
        }
}
    
    func Logout(){
        let Url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/logout"
        var loginUrl = URL(string: Url)!
        let headers: HTTPHeaders = [
            "token": UserInfo[1],
            "Accept": "*/*"
        ]
        let params = ["/": UserInfo[2]]
        loginUrl.appendPathComponent("\(UserInfo[2])")
        print(loginUrl)

        AF.request(loginUrl, method: .post, parameters: params, encoding: URLEncoding.default, headers:headers).response{ [self] response in //debugPrint(response)
            switch response.result {
                
            case .success(let data):
                
                do{
                   
                    if response.response?.statusCode == 200{
                       
                      print("logout")
                    }
                    else{
                        print(response.response?.statusCode as Any)
                        print("ELSE")
                    }
                   
                }catch{
                    print("CATCH")

                }
                
            case .failure(let err):
                print(err.localizedDescription)
                print("CATCH")

                
                
            }

           
            
        }
        
        
        
    }
    
    func GetStationInfo(){
        let registerUrl = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/stations"
        
        let headers: HTTPHeaders = [
            "token": UserInfo[1],
            "Accept": "*/*"
        ]
        
        let params = [
            "userID": UserInfo[2],
            "userLatitude" : UserLatitude,
            "userLongitude" : UserLongitude
        ]
        
        print(registerUrl)
        AF.request(registerUrl, method: .get, parameters: params, encoding: URLEncoding.default, headers:headers).response{ [self] response in //debugPrint(response)
            switch response.result {
                
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: [])
                   
                    if response.response?.statusCode == 200{
                        
                       print(json)
                        GetStationInfo(data: data!)
                        
                    }
                    else{
                       
                        print("ELSE")
                    }
                   
                }catch{
                    print("CATCH")

                }
                
            case .failure(let err):
                print(err.localizedDescription)
                print("CATCH")

                
                
            }
           
            
        }
        
        
    }
    
    func GetStationInfo(data  : Data ){

            let DecodedData = try! JSONDecoder().decode([station].self, from: data)
            print(station.self)

           
        }
 
   
}
