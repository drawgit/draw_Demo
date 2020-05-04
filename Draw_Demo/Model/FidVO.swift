//
//  FidVO.swift
//  Draw_Demo
//
//  Created by 이성근 on 04/05/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation

struct FidVO : Codable {
    struct FidList : Codable {
        let no : Int
        let img : String
        let category : String
        let title : String
        let goodColor : String
        let goodNo : String
        let price : String
        let goodText : String
    }
    let fid : FidList
}
