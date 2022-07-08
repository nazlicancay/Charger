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
    

    func jsonToString(json: AnyObject){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString ?? "defaultvalue")
        } catch let myJSONError {
            print(myJSONError)
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
        print("----------------")
        print(UserInfo[2])
        let id : Int? = Int(UserInfo[2])
        let CityApi = URL(string: "ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces?userID=" + "\(id)")
        if let unwrappedURL = CityApi {
            var request = URLRequest(url: unwrappedURL)
            request.addValue("\(UserInfo[1])", forHTTPHeaderField: "token")
            let defaultSession =  URLSession(configuration: .default)
            let dataTask = defaultSession.dataTask(with: request){(data: Data? , responds :URLResponse? ,error :Error?) in
                      
                      if(error != nil){
                          print(error)
                          return
                      }
                      
                      do{
                          let json = try JSONDecoder().decode(CityResponse.self, from: data!)
                          print(json.CityResponse.count)
                      }
                      catch {
                          print(error)
                          return
                      }
                          
                  }
                  dataTask.resume()
    }
    
   

}
}
