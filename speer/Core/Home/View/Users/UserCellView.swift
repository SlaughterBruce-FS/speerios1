//
//  UserCellView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    let user: Item
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        //navigationstack
        NavigationStack{
            VStack{
                NavigationLink{
                    Profile()
                } label: {
                    HStack(alignment: .center){
                        // image
                  
                        KFImage(URL(string: user.avatarURL))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                       
                        
                        // info/ user name
                        VStack{
                            Text(user.login)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                        }
                        Spacer()
                       
                    }
                }
                .padding(.horizontal)
                Divider()
               
            }
            .tint(.black)
            .padding(.bottom, 8)
        }
       
    }
}

//#Preview {
//    UserCellView(user: User)
//}
