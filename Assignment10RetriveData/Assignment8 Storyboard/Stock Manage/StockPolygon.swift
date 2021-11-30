//
//  StockPolygon.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/29/21.
//

import Foundation

struct StockResults:Decodable{
    var result:Stocks
}

struct Stocks:Decodable{
    var Stocks:[StockDetail]
}

struct StockDetail:Decodable{
    var name:String
}
struct DataInfo: Decodable{
    var iso:String
}
