//
//  Fid.swift
//  Draw_Demo
//
//  Created by 이성근 on 24/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//


// 사용안할예정 곧 삭제얘정
import Foundation

struct Fid : Codable {
    var no : Int
    var img : String
    var category : String
    var title : String
    var goodColor : String
    var goodNo : String
    var price : String
    var goodText : String

}


//    static var dummyFid : [Fid] = {

//    static var fidList : [Fid] = Fid.dummyFid

//    static var dummyFid : [Fid] = [
//        Fid(no: 0, img: "adidas", category: "Lunch", title: "adidas EZ-Boost", goodColor: "Black", goodNo: "AD-12", price: "KRW : 199,000", goodText: "Nike returns the Nike Air Zoom Spiridon Cage 2 from 2003, offering the Steven Smith-designed silhouette now as a silver and red version. Originally only intended as a running shoe for the Japanese market, the lightweight sneaker is semi-inspired by the Zoom Citizen and was reworked by Smith for a wider audience after the Japanese crowed and Nike internally loved it. Highlighted by the “cage” around the Zoom cushioning, nodding to the midsole of the retro sneaker, this metallic shimmering trainer…"),
//           Fid(no: 1, img: "yeez", category: "lunch", title: "NIKE Air Max 100", goodColor: "white", goodNo: "AD-13", price: "KRW : 210,000", goodText: "현재 이 리스트는 테스트 중입니다."),
//             Fid(no: 2, img: "", category: "New", title: "PUMA", goodColor: "orange", goodNo: "AD-13", price: "KRW : 100000", goodText: "현재 이 리스트는 테스트 중입니다."),
//             Fid(no: 3, img: "", category: "lunch", title: "MUSINSA", goodColor: "puple", goodNo: "AD-14", price: "KRW : 100000", goodText: "현재 이 리스트는 테스트 중입니다."),
//             Fid(no: 4, img: "", category: "New", title: "KEBERNOT", goodColor: "neworange", goodNo: "AD-52", price: "KRW : 100000", goodText: "현재 이 리스트는 테스트 중입니다.")
//
//    ]

