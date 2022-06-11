//
//  TableButtonViewController.swift
//  PhoneDle
//
//  Created by Jin younkyum on 2022/06/06.
//

import UIKit

class TableButtonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewItems = ["apple", "bowling", "carrot", "dodgeball", "earth", "fishing", "hug", "iPhone", "judge", "kids", "love", "monkey", "ninja", "orange", "phonDLE", "queue", "reusable", "sad", "tiger", "utility", "volume", "wolf", "yellow", "zest"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    

}

extension TableButtonViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = tableViewItems[indexPath.row]
        return cell
    }
}

extension TableButtonViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableViewItems[indexPath.row])
        if tableViewItems[indexPath.row] == "phonDLE" {
            complete(main: self)
        }
    }
}
