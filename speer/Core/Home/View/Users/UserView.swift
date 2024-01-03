//
//  UserView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ScrollView{
        ForEach(0...15, id: \.self) { user in
        
                UserCellView()
            }
            
        }
    }
}

#Preview {
    UserView()
}
