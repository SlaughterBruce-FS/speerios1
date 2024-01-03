//
//  SearchView.swift
//  speer
//
//  Created by J C on 1/2/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    @State private var userTotal = 0
    
    var body: some View {
        NavigationStack{
            // users
            
            // if searchtext is empty display nothing
            if(searchText == ""){
                
            }
            // if the user count is 0 it will display user not found
            else if (userTotal == 0){
                Text("No User Found")
            } 
            // display users 
            else {
                UserView()
            }
            
            
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { oldValue, newValue in
            viewModel.fetchUsers(searchText: newValue)
        }
    }
}

#Preview {
    SearchView()
}
