//
//  BeerService.swift
//  test_ios
//
//  Created by Danila on 03.11.2023.
//
import Foundation

final class BeerService {
    let decoder = JSONDecoder()
    let session: URLSession = {
        let sessionConfiguation = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguation)
        return session
        
    }()
    func fetchBeer(complitionHandler: @escaping ([BeerDTO]) -> Void){
        let url: URL = URL(string: "https://api.punkapi.com/v2/beers")!
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let beerData = try! decoder.decode([BeerDTO].self, from: data)
            complitionHandler(beerData)
            
        }).resume()
        
        
    }
    
}
