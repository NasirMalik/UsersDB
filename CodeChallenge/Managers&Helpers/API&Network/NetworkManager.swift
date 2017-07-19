/*
 
 NASIR MAHMOOD
 
 Comment:
 Shared Network Manager  
 Network layer to work on top of Alamofire
 
 */

import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    var alamoManager : SessionManager!
    
    init() {
        let configuration = URLSessionConfiguration.default
        var headers : [AnyHashable : Any] = Alamofire.SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json, application/x-www-form-urlencoded, */*", forKey: "Accept")
        headers.updateValue("application/json", forKey: "Content-Type")
        configuration.httpAdditionalHeaders = headers
        alamoManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    open func request(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest
    {
            return alamoManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    
    
}
