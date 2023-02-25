

import Alamofire
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping(Result<T,ErrorTypes>) -> Void){
        
        AF.request(url, method: method).responseData { response in
            switch response.result{
            case .success(let data):
                DispatchQueue.main.async {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                }

            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.generalError))
                print("KEKE")
            }
            
        }
        
        
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping(Result<T,ErrorTypes>) -> Void){
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }catch{
            completion(.failure(.invalidData))
        }
    }
    
}
