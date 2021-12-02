//
//  StockPolygon.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/29/21.
//

import Foundation



struct StocksResult:Decodable{
    var results:[resultsDetail]
}



struct resultsDetail: Decodable{
    var T:String
    var c:Double
}
