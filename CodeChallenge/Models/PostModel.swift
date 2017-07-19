/*
 
 NASIR MAHMOOD
 
 Comment:
 MODEL OBJECT
 Made with Realm and Object MApper to automap objects to RealmDatabase.
 
 */

import Foundation
import RealmSwift
import ObjectMapper

fileprivate struct JSONPostConstants {
    
    static let kUserId   = "userId"
    static let kID       = "id"
    static let kTitle    = "title"
    static let kBody     = "body"
}

class PostModel: Object, Mappable {
    
    var userId          =  RealmOptional<Int>()
    var id              =  RealmOptional<Int>()
    
    dynamic var title    =  ""
    dynamic var body     =  ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
}

//MARK: Mapper EXtension
extension PostModel
{
    func mapping(map: Map) {
        
        userId.value  <- map[JSONPostConstants.kUserId]
        id.value      <- map[JSONPostConstants.kID]
        title         <- map[JSONPostConstants.kTitle]
        body          <- map[JSONPostConstants.kBody]
    }

}
