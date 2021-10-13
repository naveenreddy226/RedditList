//
//  FeedModel.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import Foundation

struct FeedResponse: Decodable {
    let data: DataResponse
}

struct DataResponse: Decodable {
    let children: [Children]
}

struct Children: Decodable {
    let data: ChildrenData
}

struct ChildrenData: Decodable {
    var title: String
    let thumbnail: String
    let num_comments: Int
    let score: Int
    let thumbnail_height: Int?
    let thumbnail_width: Int?
}
