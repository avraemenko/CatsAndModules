//
//  DataFetcher.swift
//  Networking
//
//  Created by Kate Avramenko on 25.06.2022.
//

import Foundation

public class DataFetcher : ObservableObject{
    
    @Published public var cats = [Cat]()
    var page = 0
//    var animal : String {
//        let value = Bundle.main.object(forInfoDictionaryKey: "api_type") as! String
//        switch value {
//        case "DOGS":
//            return "dog"
//        case "CATS":
//            return "cat"
//        default:
//            return ""
//        }
//    }
//
    public init(limit : Int, page : Int){
        fetchData(limit: limit, page: page)
    }
    
    public func fetchMoreData(){
        self.page += 1
        fetchData(limit: 7, page: page)
    }
    
    public func isLast(cat : Cat) -> Bool {
        if self.cats.last?.id == cat.id {
            return true
        }
        return false
    }
    
    func fetchData(limit : Int, page : Int){
        let urlSession = URLSession(configuration: .default)
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=\(limit)&page=\(page)&order=DESC")!
        let _ = urlSession.dataTask(with: url) {data, response, error in
            DispatchQueue.global(qos: .userInitiated).async {
                guard let data = data,
                      let fetchedCat = try? JSONDecoder().decode([Cat].self, from: data) else { return }
                DispatchQueue.main.async {
                    self.cats += fetchedCat
                }
            }
        }.resume()
    }
}
