//
//  Boards.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation

// MARK: - Boards
struct Boards: Codable {
    let boards: [Board]
    let trollFlags: TrollFlags
    
    enum CodingKeys: String, CodingKey {
        case boards
        case trollFlags = "troll_flags"
    }
}

// MARK: - Board
struct Board: Codable {
    let board, title: String
    let wsBoard, perPage, pages, maxFilesize: Int
    let maxWebmFilesize, maxCommentChars, maxWebmDuration, bumpLimit: Int
    let imageLimit: Int
    let cooldowns: Cooldowns
    let metaDescription: String
    let isArchived, spoilers, customSpoilers, forcedAnon: Int?
    let userIDS, countryFlags, codeTags, webmAudio: Int?
    let minImageWidth, minImageHeight, oekaki, sjisTags: Int?
    let textOnly, requireSubject, trollFlags, mathTags: Int?
    
    enum CodingKeys: String, CodingKey {
        case board, title
        case wsBoard = "ws_board"
        case perPage = "per_page"
        case pages
        case maxFilesize = "max_filesize"
        case maxWebmFilesize = "max_webm_filesize"
        case maxCommentChars = "max_comment_chars"
        case maxWebmDuration = "max_webm_duration"
        case bumpLimit = "bump_limit"
        case imageLimit = "image_limit"
        case cooldowns
        case metaDescription = "meta_description"
        case isArchived = "is_archived"
        case spoilers
        case customSpoilers = "custom_spoilers"
        case forcedAnon = "forced_anon"
        case userIDS = "user_ids"
        case countryFlags = "country_flags"
        case codeTags = "code_tags"
        case webmAudio = "webm_audio"
        case minImageWidth = "min_image_width"
        case minImageHeight = "min_image_height"
        case oekaki
        case sjisTags = "sjis_tags"
        case textOnly = "text_only"
        case requireSubject = "require_subject"
        case trollFlags = "troll_flags"
        case mathTags = "math_tags"
    }
}

// MARK: - Cooldowns
struct Cooldowns: Codable {
    let threads, replies, images: Int
}

// MARK: - TrollFlags
struct TrollFlags: Codable {
    let ac, an, bl, cf: String
    let cm, ct, dm, eu: String
    let fc, gn, gy, jh: String
    let kn, mf, nb, nz: String
    let pc, pr, re, tm: String
    let tr, un, wp: String
    
    enum CodingKeys: String, CodingKey {
        case ac = "AC"
        case an = "AN"
        case bl = "BL"
        case cf = "CF"
        case cm = "CM"
        case ct = "CT"
        case dm = "DM"
        case eu = "EU"
        case fc = "FC"
        case gn = "GN"
        case gy = "GY"
        case jh = "JH"
        case kn = "KN"
        case mf = "MF"
        case nb = "NB"
        case nz = "NZ"
        case pc = "PC"
        case pr = "PR"
        case re = "RE"
        case tm = "TM"
        case tr = "TR"
        case un = "UN"
        case wp = "WP"
    }
}
