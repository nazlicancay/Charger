//
//  RegisterModel.swift
//  Charger
//
//  Created by Nazlıcan Çay on 2.07.2022.
//

import SwiftUI

struct login: Encodable {
    let email : String
    let  deviceUDID : Int

}
struct Response : Codable{
    let result : Profile
    let status : Int
}

struct Profile : Codable {
    var email: String
    var token : String
    var deviceUDID : Int
    
    func Getprofile() {
        print("email: \(email), deviceUDID: \(deviceUDID)" )
    }
}
