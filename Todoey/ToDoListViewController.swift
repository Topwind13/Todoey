//
//  ViewController.swift
//  Todoey
//
//  Created by TOP on 19/5/2561 BE.
//  Copyright © 2561 TOPP Pongsakorn. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray : [String] = ["Eating", "Coding", "Testing"]
    var textField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    //MAKR: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    //MARK: - TableView Deligate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    //MARK: -Add item
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add a new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user click add item in action alert
            if let textField = self.textField.text {
                self.itemArray.append(textField)
            } else {
                self.itemArray.append("Emtry")
            }
            
            self.tableView.reloadData()
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            
            self.textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

