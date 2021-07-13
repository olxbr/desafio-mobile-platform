//
//  ApiClient.swift
//  desafio
//
//  Created by Victor Valfre on 12/07/21.
//

import Alamofire
import Promises

protocol ApiClient { }

extension ApiClient {
  
    public static func performRequestAsync<T: Decodable>(route: URLRequestConvertible,
                                                            decoder: JSONDecoder = JSONDecoder()) -> Promise<T> {
           return Promise<T> { fulfill, reject in
               AF.request(route)
                   .validate(statusCode: 200..<300)
                   .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                       let result = response.result.mapError( { error -> ErrorResponse in
                        
                        guard let data = response.data else {
                            return ErrorResponse(code: response.response?.statusCode ?? 0,  stackTrace: error.errorDescription ?? "Generic error")
                            }
                            
                            let decoder = JSONDecoder()
                            guard let customError = try? decoder.decode(ErrorResponse.self, from: data) else {
                                return ErrorResponse(code: response.response?.statusCode ?? 0,  stackTrace: error.errorDescription ?? "Generic error")
                                }
                            
                            return customError
                        })
                        
                       switch result {
                       case .success(let data):
                           fulfill(data)
                       case .failure(let error):
                           reject(error)
                       }
               }
           }
       }
       
       public static func performRequestAsync(route: URLRequestConvertible) -> Promise<Void> {
           return Promise<Void> { fulfill, reject in
               AF.request(route)
                   .validate(statusCode: 200..<300)
                   .response { (response: DataResponse<Data?, AFError>) in
                       let result = response.result.mapError( { error -> ErrorResponse in
                        guard let data = response.data else {
                          return ErrorResponse(code: response.response?.statusCode ?? 0,  stackTrace: error.errorDescription ?? "Generic error")
                          }
                          
                          let decoder = JSONDecoder()
                          guard let customError = try? decoder.decode(ErrorResponse.self, from: data) else {
                              return ErrorResponse(code: response.response?.statusCode ?? 0,  stackTrace: error.errorDescription ?? "Generic error")
                          }
                          
                          return customError
                      })
                      
                       switch result {
                       case .success:
                           fulfill(Void())
                       case .failure(let error):
                           reject(error)
                       }
                       
               }
           }
       }
}
