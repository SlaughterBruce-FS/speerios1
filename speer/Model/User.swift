//
//  User.swift
//  speer
//
//  Created by J C on 1/2/24.
//

import Foundation

struct User: Codable, Identifiable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    let name: String?
    let company: String?
    let blog: String
    let location, email, hireable, bio: String?
    let twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt, updatedAt: Date
}
