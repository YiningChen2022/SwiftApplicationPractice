//
//  StockPolygon.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/29/21.
//

import Foundation



struct Stocks:Decodable{
    var Stocks:[GroupResult]
}



struct GroupResult: Decodable{
    var T:String
    var c:Double
}
