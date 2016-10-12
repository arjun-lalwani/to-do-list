//
//  FirstViewController.swift
//  To Do List
//
//  Created by Arjun Lalwani on 12/10/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items: [String] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // this function tells the view what to do when the first view is reloaded again
    // after visiting the second view
    override func viewDidAppear(_ animated: Bool) {
        // getting data stored in user defaults
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData() // reloads data
    }
    
    func tableView (_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                    forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            // also save this data to user Defaults
            // after removing item from array
            UserDefaults.standard.set(items, forKey: "items")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return items.count
        
    }
    

    // text displayed in each row
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        /* alternate way to do optional downcast, rather than force downcast
         
         if let tempLabel = items[indexPath.row] as? String { 
         
            cellLabel = tempLable
         
         }
 
        cell.textLabel?.text = cellLabel 
         
        */
        
        // as! is a force downcast, where you are sure that the user has entered a String
        // cell.textLabel?.text = (items[indexPath.row] as! String)
        
        // what does textLabel? do?
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
        
    }
    
    



}

