//
//  UserView.swift
//  speer
//
//  Created by J C on 1/3/24.
//

import SwiftUI

struct UserView: View {
    let items: [Item]
    var body: some View {
        //scroll view
        ScrollView{
            // loop through all users that are found
            ForEach(items) { user in
        // display user cell
                UserCellView(user: user)
            }
            
        }
    }
}

#Preview {
    UserView(items: [Item(login: "test", id: 3, nodeID: "test", avatarURL: "test", gravatarID: "test", url: "test", htmlURL: "test", followersURL: "test", followingURL: "test", gistsURL: "test", starredURL: "test", subscriptionsURL: "test", organizationsURL: "test", reposURL: "test", eventsURL: "test", receivedEventsURL: "test", type: .user, siteAdmin: false, score: 2)])
}
