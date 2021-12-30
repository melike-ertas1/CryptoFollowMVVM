//
//  WebService.swift
//  CryptoFollow
//
//  Created by melike ertaş on 13.12.2021.
//

import Foundation

class WebService {

    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurreny]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
               let cryptoList = try? JSONDecoder().decode([CryptoCurreny].self, from: data)
                if let cryptoList = cryptoList{
                    completion(cryptoList)
                }
            }
        }.resume()        
    }
}
