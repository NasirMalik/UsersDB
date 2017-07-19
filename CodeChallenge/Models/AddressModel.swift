/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL OBJECT
 Made with Realm and Object MApper to automap objects to RealmDatabase.
 
 */

import Foundation
import RealmSwift
import ObjectMapper

fileprivate struct JSONAddressConstants {
    
    static let kStreet   = "street"
    static let kSuite    = "suite"
    static let kCity     = "city"
    static let kZipCode  = "zipcode"
    static let kGeo      = "geo"
    static let kLat      = "lat"
    static let kLon      = "lng"
}

class AddressModel: Object, Mappable {
    
    dynamic var street =  ""
    dynamic var suite =  ""
    dynamic var city =  ""
    dynamic var zipcode =  ""
    dynamic var geo : GeoModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
}

//MARK: Mapper EXtension
extension AddressModel
{
    func mapping(map: Map) {
        
        street  <- map[JSONAddressConstants.kStreet]
        suite   <- map[JSONAddressConstants.kSuite]
        city    <- map[JSONAddressConstants.kCity]
        zipcode <- map[JSONAddressConstants.kZipCode]
        geo     <- map[JSONAddressConstants.kGeo]

    }

}

class GeoModel: Object, Mappable {
    
    var lat =  RealmOptional<Double>()
    var lng =  RealmOptional<Double>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
}

//MARK: Mapper EXtension
extension GeoModel
{
    func mapping(map: Map) {
        lat.value  <- map[JSONAddressConstants.kLat]
        lng.value   <- map[JSONAddressConstants.kLon]
    }
    
}
