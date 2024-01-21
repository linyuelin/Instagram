//
//  Models.swift
//  Instagram
//
//  Created by dreaMTank on 2024/01/16.
//


import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let  bio: String
    let name: (first: String , last: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}
struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}

//ユーザーの投稿
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL //ビデオ　か　フォト
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers:[String]
    let owner: User
    
}

struct PostLike {
    let username: String
    let postIdentifier: String
}
struct CommentLike {
    let username: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
