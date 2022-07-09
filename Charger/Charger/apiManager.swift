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
        var registerUrl = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces"
        
        let headers: HTTPHeaders = [
            "token": "QVyFKjsCUpZtzJKfa_c4WB-8ECKndsCt",
            "Accept": "*/*"
        ]
        
        let params = ["userID": 58]
        
        AF.request(registerUrl, method: .get, parameters: params, encoding: URLEncoding.default, headers:headers).response{ response in //debugPrint(response)
            switch response.result {
                
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: [])
                   
                    if response.response?.statusCode == 200{
                        
                        print(json)
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
    
    func ApiCall(completion:@escaping (_ data:Data?,_ error:Error?)->Void) {

       let url = URL(string: "ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces?userID=" + "\(UserInfo[2])")!

       var request = URLRequest(url: url)
       request.allHTTPHeaderFields = [
                "content-type": "application/json",
                "token": "\(UserInfo[1])",
                "cache-control": "no-cache",
                ]
    //// you can write "Bearer" if you are requesting url as a user from server like its only use for you
    ////if not only for you but for a group of users or for an app you shold only wirte the token string


    URLSession.shared.dataTask(with: request) { (data, response, error) in
      guard error == nil else { return completion(nil,error) }

      guard let data = data, let response = response else { return }
      let yourdata = data
      completion(data,nil)
      print(data,response)
      // handle data
    }.resume()


    }
    
    func Deneme (){
        if let url = URL(string: "https://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces?userID=" + "\(UserInfo[2])") {
            var request = URLRequest(url: url)
            request.addValue("\(UserInfo[2])", forHTTPHeaderField: "token")
            request.httpMethod = "GET"
            let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                //handle response here
                print("------------------------")
                print(response)
            }
            dataTask.resume()
        }
        
    }
}
