//
//  Meal.swift
//  Meal
//
//  Created by Wilson on 06/12/20.
//
class Meal{
    
    let name: String
    let happiness: Int
    var items = Array<Item>()
    
    init(name: String, happiness: Int){
        self.name = name
        self.happiness = happiness
    }
    
    func getCallories() -> Double {
        var total = 0.0
        for item in self.items{
            total += item.callories
        }
        return total
    }
    
}
