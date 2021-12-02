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
    init(){
  
    let resourceString="https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2020-10-14?adjusted=true&apiKey=RjWcUvluVIp0EB6v7B9Z87cPOT5XwZjs"
       
        guard let resourceURL = URL(string: resourceString) else{fatalError()}
        self.resourceURL=resourceURL
    }
    func getStocks (completion: @escaping(Result<[resultsDetail],StockError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){
            data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let StockResponse = try decoder.decode(StocksResult.self, from: jsonData)
               
                let StockDetails = StockResponse.results
                completion(.success(StockDetails))
            }catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
        
        
    }
}
