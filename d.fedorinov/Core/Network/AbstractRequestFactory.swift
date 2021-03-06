import Foundation
import Alamofire

// Фабрика пораждающая осонвые конфигурационные данные для запроса и отправляющая эти данные в новый тип запроса из Аламофаера, подерживающий технологию Codable
protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(
        reques: URLRequestConvertible,
        completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest
}
extension AbstractRequestFactory {
    @discardableResult
    public func request <T: Decodable>(
        reques: URLRequestConvertible,
        completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(reques).responseCodable(errorParser: errorParser,
                                                              queue: queue,
                                                              completionHandler: completionHandler)
    }
}
