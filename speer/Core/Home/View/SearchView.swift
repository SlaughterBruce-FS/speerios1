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
    
    var body: some View {
        NavigationStack{
            
            
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
