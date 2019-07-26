//
//  ViewController.swift
//  Todoey
//
//  Created by Peter Raad on 7/25/19.
//  Copyright © 2019 Peter Raad. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy eggs", "Destroy demogorgon"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //when we specify a certain row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when you select that row it will check it off
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        //stops the animation once it is selected
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


}
