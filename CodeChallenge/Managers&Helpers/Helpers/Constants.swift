/*
 
 NASIR MAHMOOD
 
 Comment:
 Constants
 All the constants will be here
 
 */

import Foundation

let basicURL = "https://jsonplaceholder.typicode.com/"

// Add all general error messages here
struct ErrorMessage {

}

// All Segue Names
struct SegueNames {
    static let usersToPostsSegue    = "UserVCtoPostVCSegue"
}

// Realm Environments
struct RealmInMemoryEnvironments {
    static let TEST                 = "test"
    static let APPLICATION          = "Users"
    
}

// Viewcontroller Titles
struct ViewControllerTitles {
    static let Users                = "Users List"
    static let Posts                = "Posts List"

}

// Cell Identifiers
struct CellIdentifiers {
    static let Users                = "UsersTableViewCustomCell"
    static let Posts                =  "PostsTableViewCustomCell"
    
}

// API Endpoints
enum APIEndPointType: String {
    case users                      = "users"
    case posts                      = "posts?userId="
    
}

// Errors Struct
enum DataError: Error {
    case missing(String)
    case invalid(String, Any)
}








