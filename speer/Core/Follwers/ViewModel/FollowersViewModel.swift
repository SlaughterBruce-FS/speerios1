//
//  FollowersViewModel.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import Foundation

class FollowersViewModel: ObservableObject {
    @Published var followers = Followers()
    @Published var isLoading = true
    @Published var page = 1
    
    
    init() {
    }
    
    func fetchFollowers(followerUrl: String) {
        guard let url = URL(string: "\(followerUrl)?per_page=40&page=\(page)") else {
            print("DEBUG: Invalid URL")
            return
        }
    
        print("url is \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Start API call
        let session = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Check for error
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            // Get the URL response
            if let httpResponse = response as? HTTPURLResponse {
                print("DEBUG: Response code \(httpResponse.statusCode)")
            }
            
            // If the data is downloaded, set data, else return
            guard let data = data else { return }
            
            // Check data response
            print("DEBUG: Check data \(data)")
            
            // Parse data
            do {
                let searchResultData = try JSONDecoder().decode(Followers.self, from: data)
                print(" check here \(searchResultData)")
                DispatchQueue.main.async {
                    // decode data based on items
                    self?.followers.append(contentsOf: searchResultData)
                    self?.isLoading = false
                }
            } // debug errors
            catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            }
            catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        session.resume()
    }
    
    func loadMoreFollowers(followerUrl: String) {
          page += 1
          fetchFollowers(followerUrl: followerUrl)
      }
}

