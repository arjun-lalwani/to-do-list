//
//  SecondViewController.swift
//  To Do List
//
//  Created by Arjun Lalwani on 12/10/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func addButton(_ sender: AnyObject) {
        
        // when user adds item, save to permanent storage
        
        let itemsObjects = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        // NS Array is an immutable array
        // checking if itemsObjec is a Mutable Array
        // if it is, storing the Mutable Array in tempItems
        // tempItems cast itemsObject as an array of Strings
        if let tempItems = itemsObjects as? [String] {
            
            // items points to tempItems
            items = tempItems
            
           // adding text from text field to mutable array
           // tempItems.addObjects(from: [itemTextField.text])
            items.append(itemTextField.text!)
            
        } else {
            
            // if no items are found in UserDefaults, creating single string 
            // in a new array. this usually happens when 0 items are listed
            // on the to do list. Thus, it creates a 'new' list with the first 
            // item being entered by the user.
            items = [itemTextField.text!]
            
        }
        
        // stores user defaults
        UserDefaults.standard.set(items, forKey: "items")
        
        // resetting text field, allowing user to quickly add multiple items
        itemTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

