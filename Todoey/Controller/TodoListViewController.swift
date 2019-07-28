//
//  ViewController.swift
//  Todoey
//
//  Created by Peter Raad on 7/25/19.
//  Copyright © 2019 Peter Raad. All rights reserved.
//

import UIKit


class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //since were using a class object we access the title of it
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //ternary operator ==>
        //value = condition ? valueiftrue : valueiffalse
        
        cell.accessoryType = item.isDone ? .checkmark : .none
        
       
        return cell
    }
    
    //when we specify a certain row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when you select that row it will check it off
        //this line here replaces the commented if statement out
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
//        if itemArray[indexPath.row].isDone == false {
//            itemArray[indexPath.row].isDone = true
//        } else {
//            itemArray[indexPath.row].isDone = false
//        }
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.reloadData()

        //stops the animation once it is selected
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what will happen once the user clicks the add item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            //RELOADS THE DATA AFTER ENTERING NEW DATA
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

