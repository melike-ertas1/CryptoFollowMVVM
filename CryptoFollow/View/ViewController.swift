//
//  ViewController.swift
//  CryptoFollow
//
//  Created by melike ertaş on 13.12.2021.
//

import UIKit

class ViewController: UIViewController {
//    kaynak: nomics.com API
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        SetUI()
      
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url, completion: { (cryptos) in
            if let cryptos = cryptos{
            
                self.cryptoListViewModel = CryptoListViewModel(crList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    func SetUI(){
        if #available(iOS 13.0, *) {
                    let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = UIColor.init(red: 48.0/255.0, green: 176.0/255.0, blue: 199.0/255.0, alpha: 1.0)
                    UIApplication.shared.keyWindow?.addSubview(statusBar)
                } else {
//                     UIApplication.shared.statusBarView?.backgroundColor = UIColor.init(red: 237.0/255.0, green: 85.0/255.0, blue: 61.0/255.0, alpha: 1.0)
                }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.currencyText.text = cryptoViewModel.name
        cell.priceText.text = cryptoViewModel.price
        
        return cell
    }
  
}


