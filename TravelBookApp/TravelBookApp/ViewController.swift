//
//  ViewController.swift
//  TravelBookApp
//
//  Created by Zeynep Sinoğlu on 4.06.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var images = [ImageEntity]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // sayfa her görüntülendiğinde data yenilensin
    override func viewDidAppear(_ animated: Bool) {
        loadData()
        tableView.reloadData()
        
    }
    func loadData(){
        images = DatabaseHelper.sharedInstance.fetchImage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let row = images[indexPath.row]
        cell.shortDesc.text = row.shortdescription
        cell.title.text = row.title
        
        if let data = row.image{
            cell.img.image = UIImage(data: data)
        }else{
            cell.img.image = nil
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let row = images[indexPath.row]
            images.remove(at: indexPath.row)
            DatabaseHelper.sharedInstance.deleteData(title: row.title!)
            self.tableView.reloadData()
        }
        
    }
}
