/*
 
 NASIR MAHMOOD
 
 Comment:
 Work in combination with  Fetch<Command> Classes that comply this protocol
 
 */

import Foundation

protocol Command {
    
    associatedtype ResultType
    var completionHandler: ([ResultType]) -> Void { get set }

}
