//
//  apiManager.swift
//  Charger
//
//  Created by Nazlıcan Çay on 2.07.2022.
//

import Foundation
import Alamofire


let registerUrl = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login"
class ApiManager{
    static let APIInstance = ApiManager()
    
    func callingRegisterAPI(register : login , completionHandler : @escaping (Bool)->()){
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(registerUrl, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers:headers).response{ response in debugPrint(response)
            switch response.result {
                
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!)
                    if response.response?.statusCode == 200{
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
    
}
