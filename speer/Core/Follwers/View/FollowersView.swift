//
//  FollowersView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI
import Kingfisher

struct FollowersView: View {
    let followerUrl: String

    
    @StateObject private var viewmodel = FollowersViewModel()
    var body: some View {
        //scroll view
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(viewmodel.followers) { follower in
                        VStack{
                           //naviaget to profile
                            NavigationLink {
                                Profile(userId: follower.login)
                            } label: {
                                HStack(alignment: .center){
                                    // image

                                    KFImage(URL(string: follower.avatarURL))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    
                                    // info/ user name
                                    VStack{
                                        Text(follower.login)
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
                    
                    Button {
                        viewmodel.loadMoreFollowers(followerUrl: followerUrl)
                    } label: {
                        Text("load more")
                    }
            
                }
              
                            
            
                
            }
            .onAppear{
                print("FollowersView appeared")

                viewmodel.fetchFollowers(followerUrl: followerUrl)
            }
            .navigationTitle("Followers")
        }
        
    }
}

#Preview {
    FollowersView(followerUrl: "https://api.github.com/users/xianjimli/followers" )
}
