//
//  Stockrequest.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/29/21.
//

import Foundation

struct StockRequest{
    enum StockError:Error{
        case noDataAvailable
        case cannotProcessData
    }
    let resourceURL: URL
    let API_KEY="RjWcUvluVIp0EB6v7B9Z87cPOT5XwZjs"
    init(stockCode:String){
        let date = Date()
        let format = DateFormatter()
        format.dateFormat="yyyy"
        let currentYear=format.string(from: date)
        
        let resourceString="https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/day/2020-06-01/2020-06-17?apiKey=\(API_KEY)&Stock=\(stockCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else{fatalError()}
        self.resourceURL=resourceURL
    }
    func getStocks (completion: @escaping(Result<[StockDetail],StockError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){
            data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let StockResponse = try decoder.decode(StockResults.self, from: jsonData)
                let StockDetails = StockResponse.result.Stocks
                completion(.success(StockDetails))
            }catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
        
        
    }
}
