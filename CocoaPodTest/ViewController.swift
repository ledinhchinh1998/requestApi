//
//  ViewController.swift
//  CocoaPodTest
//
//  Created by Chinh le on 5/29/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview : UITableView!
    
    var data: [DataModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        requestAPI()
    }
    
    func requestAPI() {
        AF.request(Containts.getMenu, method: .get).responseJSON { (response) in
            if let value = response.value as? [String: Any] {
                if let userModel = UserModel(JSON: value) {
                    if let data = userModel.data {
                        self.data = data
                        self.tableview.reloadData()
                    }
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else {
            return UITableViewCell()
        }
        
        let user = data?[indexPath.row]
        if let url = URL(string: user?.img ?? "") {
            let data = try? Data(contentsOf: url)
            cell.img.image = UIImage(data: data ?? Data())
        }
        cell.name.text = data?[indexPath.row].name
        cell.detail.text = data?[indexPath.row].detail
        return cell
    }
    
    
}

