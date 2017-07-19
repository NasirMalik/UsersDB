/*
 
 NASIR MAHMOOD
 
 Comment:
 Work in combination with  Network manager and Response to handle types of data
 Network
 
 */
import Foundation
import Alamofire
import AlamofireObjectMapper


class FetchUser : Command {
    
    var completionHandler: ([UserModel]) -> Void
    
    required init(completionHandler: @escaping ([UserModel])->Void) {
        self.completionHandler = completionHandler
    }
    
    public func execute(_ endpoint : APIEndPointType) {
            NetworkManager.sharedInstance.request("\(basicURL)\(endpoint.rawValue)", method: .get, parameters: nil).responseArray { (response: DataResponse<[UserModel]>) in
                if let userResponse = response.result.value, userResponse.count > 0 {
                    self.completionHandler(DataManager.sharedInstance.saveUsersDataToRealm(userResponse))
                }
        }
    }
}
