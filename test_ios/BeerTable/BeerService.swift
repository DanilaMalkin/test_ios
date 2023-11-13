//
//  BeerService.swift
//  test_ios
//
//  Created by Danila on 03.11.2023.
//
import Foundation



protocol BeerServicing: AnyObject{
    func fetchBeer(complitionHandler: @escaping([BeerDTO]) -> Void)
}


final class BeerService {
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    }
    let session: URLSession = {
        let sessionConfiguation = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguation)
        return session
        
    }()

//MARK: - BeerServicing

extension BeerService : BeerServicing{
    func fetchBeer(complitionHandler: @escaping ([BeerDTO]) -> Void){
        let url: URL = URL(string: "https://api.punkapi.com/v2/beers")!
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            
            let beerData = try! self.decoder.decode([BeerDTO].self, from: data)
            complitionHandler(beerData)
            
        }).resume()
        
        
    }
}
    

