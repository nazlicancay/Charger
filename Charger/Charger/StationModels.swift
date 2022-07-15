//
//  StaitonModel.swift
//  Charger
//
//  Created by Nazlıcan Çay on 15.07.2022.
//

import Foundation

struct Station : Decodable {
    
    var occupiedSocketCount : Int?
    var sockets : [sokets]?
    var id : Int?
    var socketCount : Int?
    var services : [String]
    var stationCode : String?
    var distanceInKM : Double?
    var stationName : String?
    var geoLocation : GeoLocation?
}

struct sokets : Decodable {
    
    var soketID : Int?
    var soketType : String?
    var chargeType : String?
    var power : Int?
    var powerUnit : String?
    var socketNumber : Int?
    var geoLocation : GeoLocation?
    var services : String?
}

struct GeoLocation : Decodable {
    var longitude : Double?
    var latitude : Double?
    var province : String?
    var address : String?
}
