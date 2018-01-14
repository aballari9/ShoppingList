//
//  ViewController.swift
//  ShoppingList
//
//  Created by Akhila Ballari on 10/3/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var listTableView: UITableView!
    
    var listItems: [(listItemName: String, checked: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listTableView.delegate = self
        listTableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Add an item", message: "Type in item you want to add", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Apples"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            let textField = alert.textFields!.first!
            
            if textField.text != "" {
                self.listItems.append((listItemName: textField.text!, checked: false))
            }
            
            self.listTableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(submit)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath) as! ListItemCell
        cell.decorate(listItem: listItems[indexPath.row].listItemName, check: listItems[indexPath.row].checked)
        
        return cell
    }
    
}

