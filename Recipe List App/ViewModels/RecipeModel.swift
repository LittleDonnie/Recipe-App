//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
    }
    
    static func getPortion( ingredient: Ingredient, recipeServings:Int, targetServings:Int ) -> String {
        
        var portion = ""
        var numberator = ingredient.num ?? 1
        var denomanator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            numberator *= targetServings
          //  numberator *= recipeServings
          denomanator *= recipeServings
            
            // Get signel serving size by mulipling denomerator by number of serving
            
            let divisor = Rational.greatestCommonDivisor(numberator, denomanator)
            
            numberator /= divisor
            denomanator /= divisor
            
            
            
            // Get target serving size my mulp numerator by number of targat servings
            if numberator >= denomanator {
                wholePortions = numberator/denomanator
                numberator = numberator % denomanator
                
                portion += String(wholePortions)
            }
            //Reduce fraction by greatest common divisor
            
            // Get whole portionj if numerator > denomerator
            
            
            
            if var unit = ingredient.unit {
            
            
                if (wholePortions > 1 ) {

                    if unit.suffix(2) == "ch" {
                        unit  += "es"
                    }
                    else {
                        
                        if unit.suffix(1) == "f" {
                            unit = String(unit.dropLast())
                            unit += "ves"
                        }
                        
                        else{
                            unit += "s"
                        }
                    }
                }
            
            }
            
            //express remainer as a fraction
            
            
            if numberator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += " \(numberator)/\(denomanator)"
                }
            
            
            if let unit = ingredient.unit{
            return ( " " + portion + unit)
            }
        }
        
        return(portion)

    }
}
