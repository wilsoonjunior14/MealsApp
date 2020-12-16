//
//  NewItemViewController.swift
//  Meal
//
//  Created by Wilson on 15/12/20.
//

import UIKit


class NewItemViewController : UIViewController{
    
    @IBOutlet
    var itemTextField: UITextField!
    
    @IBOutlet
    var calloriesTextField: UITextField!
    
    var delegate: ViewController! = nil
    
    init(delegate: ViewController) {
        self.delegate = delegate
        super.init(nibName: "NewItemView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print ("screen loaded")
    }
    
    @IBAction
    func addNewItem(){
        let name = self.itemTextField.text
        let callories = Double(self.calloriesTextField.text!)
        
        let item = Item(name: name!, callories: callories!)
        
        self.delegate.addItem(item: item)
        
        if let navigator = navigationController{
            navigator.popViewController(animated: true)
        }
    }
    
}
