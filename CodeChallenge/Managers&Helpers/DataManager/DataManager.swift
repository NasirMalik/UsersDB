import Foundation
import RealmSwift
import Alamofire
import ObjectMapper

class DataManager {
    
    static let sharedInstance = DataManager()
    
    func saveUsersDataToRealm(_ usersArray : [UserModel]) -> [UserModel] {
        
        let realm = RealmProvider.realm()
        do {
            try realm?.write {
                for user in usersArray{
                    realm?.add(user, update: true)
                }
            }
        } catch  {
            return [UserModel]()
        }
        
        return usersArray
    }
    
    func fetchUsersData(_ endPoint: APIEndPointType, _ completion: @escaping (_ results: [UserModel]?, _ error: DataError?) -> Void){
        
        if let realm = RealmProvider.realm(){
            let users = (realm.objects(UserModel.self).toArray())
            if !users.isEmpty {
                completion(users, nil)
            }
            else{
                FetchUser() {(usersArray : [UserModel]) in
                    completion(usersArray, nil)
                    }.execute(endPoint)
            }
        }
        else{
            print("error")
        }
    }
    
    func fetchPostsData(_ endPoint: APIEndPointType, userID: NSInteger?, _ completion: @escaping (_ results: [PostModel]?, _ error: DataError?) -> Void){
        
        if  let userIdLoc = userID{
                FetchPosts() {(postsArray : [PostModel]) in
                    completion(postsArray, nil)
                    }.execute(endPoint, userID: userIdLoc)
        }
        else{
            print("error")
        }
    }
}
