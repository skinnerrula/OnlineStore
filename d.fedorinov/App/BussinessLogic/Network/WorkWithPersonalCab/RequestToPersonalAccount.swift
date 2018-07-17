import Foundation
import Alamofire

protocol RequestsToPersonalAccountFactory {
    func login(
        username: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>)
        -> Void)
    
    func logOut(
        id: Int,
        completionHandler: @escaping (DataResponse<StaticAPIResult>)
        -> Void)
    
    func registration(
        user: User,
        completionHandler: @escaping (DataResponse<StaticAPIResult>)
        -> Void)
    
    func changeUserData(
        user:User,
        completionHandler: @escaping (DataResponse<StaticAPIResult>)
        -> Void)
}

class RequestToPersonalAccount: AbstractRequestFactory, RequestsToPersonalAccountFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: SessionManager
    var queue: DispatchQueue?
    let baseUrl = URL(string: APPURL.baseUrlToAPI)!
    
    init (errorParser: AbstractErrorParser,
          sessionManager: SessionManager,
          queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}





