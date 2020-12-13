//
//  ViewController.swift
//  Meal
//
//  Created by Wilson on 06/12/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet
    var nameField: UITextField!
    
    @IBOutlet
    var happinessField: UITextField!
    
    var delegate: TableViewController?
    
    @IBOutlet
    var tableView: UITableView!
    
    var selected = Array<Item>()
    
    var items = [
        Item(name: "Item 01", callories: 1.0),
        Item(name: "Item 02", callories: 2.0)
    ]
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func add(){
        if (self.nameField == nil || self.happinessField == nil){
            return
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        
        if (happiness == nil){
            return
        }
        
        let mealObj = Meal(name: name!, happiness: happiness!)
        
        print("Add button clicked... \(mealObj.name) \(mealObj.happiness) ")
        print("Items...-> \(self.selected)")
        
        if (self.delegate == nil){
            return 
        }
        
        mealObj.items = self.selected
        self.delegate!.addMeal(meal: mealObj)
        self.selected = Array<Item>()
        
        if let navigation = self.navigationController{
            navigation.popToRootViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if (cell == nil){
            return
        }
        
        if (cell?.accessoryType == .checkmark){
            cell?.accessoryType = .none
            self.selected = self.selected.filter({ (Item) -> Bool in
                return Item.name != self.items[indexPath.row].name
            })
        }else{
            cell?.accessoryType = .checkmark
            self.selected.append(self.items[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = self.items[row]
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }

}

