//
//  YoutubeUtility.swift
//  ReeachA
//
//  Created by osanai on 2019/03/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class YoutubeUtility: NSObject {
    
    enum ThumbnailType {
        case normal
        case type1
        case type2
        case type3
        case mq
        case hq
        case hq0
        case sd
        case maxres
    }
    
    static func thumbnail(id: String, type: ThumbnailType) -> URL {
        switch type {
        case .normal:
            return URL(string: "https://i.ytimg.com/vi/\(id)/default.jpg")!
        case .type1:
            return URL(string: "https://i.ytimg.com/vi/\(id)/1.jpg")!
        case .type2:
            return URL(string: "https://i.ytimg.com/vi/\(id)/2.jpg")!
        case .type3:
            return URL(string: "https://i.ytimg.com/vi/\(id)/3.jpg")!
        case .mq:
            return URL(string: "https://i.ytimg.com/vi/\(id)/mqdefault.jpg")!
        case .hq:
            return URL(string: "https://i.ytimg.com/vi/\(id)/hqdefault.jpg")!
        case .hq0:
            return URL(string: "https://i.ytimg.com/vi/\(id)/0.jpg")!
        case .sd:
            return URL(string: "https://i.ytimg.com/vi/\(id)/sddefault.jpg")!
        case .maxres:
            return URL(string: "https://i.ytimg.com/vi/\(id)/maxresdefault.jpg")!
        }
    }
}
