import Foundation
import Alamofire

extension RequestToPersonalAccount {
    func changeUserData(user:User, completionHandler: @escaping (DataResponse<StaticAPIResult>) -> Void) {
        let requestModel = ChangeData(baseUrl: baseUrl, user:user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}

struct ChangeData: RequestRouter {
    let baseUrl: URL
    static let method: HTTPMethod = .post
    static let path: String = APPURL.wayToChangeUserDataAPI
    
    var user: User
    var parameters: Parameters? {
        return [
            "id": user.id,
            "username": user.username,
            "password": user.password,
            "email" : user.email,
            "gender": user.gender,
            "creditCard" : user.creditCard,
            "bio" : user.bio
        ]
    }
}
