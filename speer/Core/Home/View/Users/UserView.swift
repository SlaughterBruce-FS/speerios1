//
//  UserView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        //scroll view
        ScrollView{
            // loop through all users that are found
        ForEach(0...15, id: \.self) { user in
        // display user cell
                UserCellView()
            }
            
        }
    }
}

#Preview {
    UserView()
}
