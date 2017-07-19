/*
 
 NASIR MAHMOOD
 
 Comment:
 Work in combination with  Network manager and Response to handle types of data
 Network
 
 */
import Foundation
import Alamofire
import AlamofireObjectMapper


class FetchPosts : Command {
    
    var completionHandler: ([PostModel]) -> Void
    
    required init(completionHandler: @escaping ([PostModel])->Void) {
        self.completionHandler = completionHandler
    }
    
    public func execute(_ endpoint : APIEndPointType, userID: NSInteger?) {
        
        guard userID != nil else {
            return
        }
        
        NetworkManager.sharedInstance.request("\(basicURL)\(endpoint.rawValue)\((userID)!)", method: .get, parameters: nil).responseArray { (response: DataResponse<[PostModel]>) in
                if let postResponse = response.result.value, postResponse.count > 0 {
                    self.completionHandler(postResponse)
                }
        }
    }
}
