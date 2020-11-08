//
//  Threads.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation

// MARK: - Threads
struct Threads: Codable {
    let threads: [Thread]
}

// MARK: - Thread
struct Thread: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable {
    let no: Int
    let now: String
    let name: Name?
    let com: String?
    let filename: String?
    let ext: EXT?
    let w, h, tnW, tnH: Int?
    let tim: Int?
    let time: Int
    let md5: String?
    let fsize: Int?
    let resto: Int
    let bumplimit, imagelimit: Int?
    let semanticURL: String?
    let replies, images, omittedPosts, omittedImages: Int?
    let sub, trip: String?
    
    enum CodingKeys: String, CodingKey {
        case no, now, name, com, filename, ext, w, h
        case tnW = "tn_w"
        case tnH = "tn_h"
        case tim, time, md5, fsize, resto, bumplimit, imagelimit
        case semanticURL = "semantic_url"
        case replies, images
        case omittedPosts = "omitted_posts"
        case omittedImages = "omitted_images"
        case sub, trip
    }
}

enum EXT: String, Codable {
    case jpg = ".jpg"
    case pdf = ".pdf"
    case png = ".png"
}

enum Name: String, Codable {
    case anonymous = "Anonymous"
    case help = "help"
    case j = "J."
    case qMatlock = "Q@Matlock"
}
