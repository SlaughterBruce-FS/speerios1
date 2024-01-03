//
//  ProfileViewModel.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading = true
    
   
  
    
    func fetchUser(userId: String) {
        
        
        guard let url = URL(string: "https://api.github.com/users/\(userId)") else {
            print("DEBUG: PROFILE Invalid URL")
            return
        }
    
        print("url is \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
        
        
        // Start API call
        let session = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Check for error
            if let error = error {
                print("DEBUG: PROFILE  Error \(error.localizedDescription)")
                return
            }
            
            // Get the URL response
            if let httpResponse = response as? HTTPURLResponse {
                print("DEBUG: PROFILE  Response code \(httpResponse.statusCode)")
            }
            
            // If the data is downloaded, set data, else return
            guard let data = data else { return }
            
            // Check data response
            print("DEBUG: PROFILE  Check data \(data)")
            
            // Parse data
            do {
                let userDetails = try JSONDecoder().decode(User.self, from: data)
             
                DispatchQueue.main.async {
                    // decode data based on items
                    self?.user = userDetails
                    self?.isLoading = false
                }
            } // debug errors
            catch let DecodingError.dataCorrupted(context) {
                print("PROFILE  Data corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("PROFILE  Key '\(key)' not found: \(context.debugDescription)")
                print("PROFILE  codingPath: \(context.codingPath)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("PROFILE  Value '\(value)' not found: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch let DecodingError.typeMismatch(type, context)  {
                print("PROFILE  Type '\(type)' mismatch: \(context.debugDescription)")
                print("PROFILE  codingPath: \(context.codingPath)")
            }
            catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        session.resume()
    }
    
}
