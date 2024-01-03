//
//  SearchViewModel.swift
//  speer
//
//  Created by J C on 1/2/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var items = [Item]()
    
    init(searchText: String = "") {
        fetchUsers(searchText: searchText)
    }
    
    func fetchUsers(searchText: String) {
        guard let url = URL(string: "https://api.github.com/search/users?q=\(searchText)") else {
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
                let searchResultData = try JSONDecoder().decode(SearchResponse.self, from: data)
                print(" check here \(searchResultData)")
                DispatchQueue.main.async {
                    // decode data based on items
                    self?.items = searchResultData.items
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
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        session.resume()
    }
    
}
