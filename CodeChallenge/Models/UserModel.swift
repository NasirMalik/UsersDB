/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL OBJECT
 Made with Realm and Object MApper to automap objects to RealmDatabase.
 
 */

import Foundation
import RealmSwift
import ObjectMapper

fileprivate struct JSONConstants {
    
    static let kID       = "id"
    static let kName     = "name"
    static let kUsername = "username"
    static let kEmail    = "email"
    static let kPhone    = "phone"
    static let kWebsite  = "website"
    static let kAddress  = "address"
    
}

class UserModel: Object, Mappable {
    
    var id =  RealmOptional<Int>()
    dynamic var name      =  ""
    dynamic var username  =  ""
    dynamic var email     =  ""
    dynamic var phone     =  ""
    dynamic var website   =  ""
    dynamic var address : AddressModel?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func completeAddress() -> String {
        return "\((address?.street)!) \((address?.suite)!) \((address?.city)!) \((address?.zipcode)!)"
    }
}

//MARK: Mapper EXtension
extension UserModel
{
    func mapping(map: Map) {
        id.value <- map[JSONConstants.kID]
        name     <- map[JSONConstants.kName]
        username <- map[JSONConstants.kUsername]
        email    <- map[JSONConstants.kEmail]
        phone    <- map[JSONConstants.kPhone]
        website  <- map[JSONConstants.kWebsite]
        address  <- map[JSONConstants.kAddress]
    }

}
