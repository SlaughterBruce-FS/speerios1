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
     let name, company: String?
     let blog: String?
     let location, email, bio: String?
     let twitterUsername: String?
     let publicRepos, publicGists, followers, following: Int
//     let createdAt, updatedAt: String?
    

     enum CodingKeys: String, CodingKey {
         case login, id
         case nodeID = "node_id"
         case avatarURL = "avatar_url"
         case gravatarID = "gravatar_id"
         case url
         case htmlURL = "html_url"
         case followersURL = "followers_url"
         case followingURL = "following_url"
         case gistsURL = "gists_url"
         case starredURL = "starred_url"
         case subscriptionsURL = "subscriptions_url"
         case organizationsURL = "organizations_url"
         case reposURL = "repos_url"
         case eventsURL = "events_url"
         case receivedEventsURL = "received_events_url"
         case type
         case siteAdmin = "site_admin"
         case name, company, blog, location, email,  bio
         case twitterUsername = "twitter_username"
         case publicRepos = "public_repos"
         case publicGists = "public_gists"
         case followers, following
//         case createdAt = "created_at"
//         case updatedAt = "updated_at"
     }
    
    
 }

public class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

