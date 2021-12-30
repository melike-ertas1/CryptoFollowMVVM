//
//  CryptoViewModel.swift
//  CryptoFollow
//
//  Created by melike ertaş on 14.12.2021.
//

import Foundation

struct CryptoListViewModel {
    var crList: [CryptoCurreny]
}

extension CryptoListViewModel{
    func numberOfRowsInSection() -> Int{
        return self.crList.count
    }
    
    func cryptoAtIndex (_ index:Int) -> CryptoViewModel {
        let crypto = self.crList[index]
        return CryptoViewModel(cr: crypto)
    }
}

struct CryptoViewModel{
    let cr : CryptoCurreny
    
    var name : String{
        return self.cr.currency
    }
    var price: String {
        return self.cr.price
    }
}
