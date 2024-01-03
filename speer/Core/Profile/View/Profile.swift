//
//  Profile.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI
import Kingfisher

struct Profile: View {
    let id: String
    @StateObject var viewModel: ProfileViewModel
    
    init(userId: String) {
        self.id = userId
        self._viewModel = StateObject(wrappedValue: ProfileViewModel())
    }
    
    var body: some View {
        let path = viewModel.user
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading){
                    HStack{
                        
                        
                        
                        if let imageUrl = path?.avatarURL {
                            KFImage(URL(string: imageUrl))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack(alignment:.leading){
                            Text(path?.login ?? "user")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            
                            Text(path?.name ?? "no name found")
                        }
                       Spacer()
                    }
                    
                    if let description = path?.bio{
                        Text(description)
                    }
                    
                    HStack{
                        //folowers
                        Button{
                            print("followers")
                        } label: {
                            HStack{
                                Text(String(path?.followers ?? 0))
                                    .fontWeight(.bold)
                                Text("Followers")
                                    
                            }
                            .padding(8)
                            .frame(width: 150)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            
                            
                        }
                        
                        Spacer()
                        
                        // folowing
                        Button{
                            print("following")
                        } label: {
                            HStack{
                                Text(String(path?.following ?? 0))
                                    .fontWeight(.bold)
                                Text("Following")
                            }
                            
                        }
                        .padding(8)
                        .frame(width: 150)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    .tint(.black)
                    .font(.subheadline)
                    .padding(.vertical)
                    
                }
                .padding(.horizontal)
                .onAppear{
                    viewModel.fetchUser(userId: id)
            }
            }
        }
        .navigationTitle(viewModel.user?.login ?? "user")
    }
}

#Preview {
    Profile(userId: "xianjimli")
}
