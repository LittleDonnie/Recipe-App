//
//  recipeHilights.swift
//  Recipe List App
//
//  Created by Monty Montgomery on 6/25/21.
//

import SwiftUI

struct recipeHilights: View {
    
    var allHilights = ""
  
    init(hilights:[String]){
        for index in 0..<hilights.count {
            if index == hilights.count - 1{
                allHilights += hilights[index]
            }
            else{
                allHilights += hilights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHilights)
    }
}

struct recipeHilights_Previews: PreviewProvider {
    static var previews: some View {
        recipeHilights(hilights: ["test", "test2", "test3"])
            .font(Font.custom("Avenir", size: 15))
    }
}
