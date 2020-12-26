//
//  TableViewController.swift
//  Meal
//
//  Created by Wilson on 07/12/20.
//

import UIKit

class TableViewController: UITableViewController {
 
    var meals = [
        Meal(name: "Meal 1", happiness: 2),
        Meal(name: "Meal 2", happiness: 3),
        Meal(name: "Meal 3", happiness: 4)
    ]
    
    @objc func showDetails(gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let cell = gesture.view as! UITableViewCell
            
            let indexPath = self.tableView.indexPath(for: cell)
            
            let meal = self.meals[indexPath!.row]
            
            print (" Meal pressed: \(meal.name) \(meal.happiness) ")
        }
    }
    
    override func viewDidLoad() {
        print("table view loaded")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        
        // add gesture recognizer
        let longPress = UILongPressGestureRecognizer(target: self, action:#selector(showDetails(gesture:)))
        cell.addGestureRecognizer(longPress)
        
        cell.textLabel?.text = meal.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    func addMeal(meal: Meal){
        self.meals.append(meal)
        tableView.reloadData()
    }
    
}
