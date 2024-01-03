//
//  UserCellView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        VStack{
            HStack(alignment: .center){
                // image
                Image("meg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                // info
                VStack{
                    Text("Thee Stallion")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                }
                Spacer()
               
            }
            .padding(.horizontal)
            Divider()
           
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    UserCellView()
}
