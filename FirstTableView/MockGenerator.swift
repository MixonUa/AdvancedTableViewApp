//
//  MockGenerator.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 17.01.2022.
//

import Foundation

struct MockGenerator {
    static func generateRandomCities() -> [City] {
        var citiesArray = [City]()
        let paris = City(country: "France", name: "Paris", image: #imageLiteral(resourceName: "Paris"))
        citiesArray.append(paris)
        let barcelona = City(country: "Spain", name: "Barcelona", image: #imageLiteral(resourceName: "Barcelona"))
        citiesArray.append(barcelona)
        let dusseldorf = City(country: "Germany", name: "Dusseldorf", image: #imageLiteral(resourceName: "Dusseldorf"))
        citiesArray.append(dusseldorf)
        let venice = City(country: "Italy", name: "Venice", image: #imageLiteral(resourceName: "Venice"))
        citiesArray.append(venice)
        let milano = City(country: "Italy", name: "Milano", image: #imageLiteral(resourceName: "Milano"))
        citiesArray.append(milano)
        let roma = City(country: "Italy", name: "Roma", image: #imageLiteral(resourceName: "Roma"))
        citiesArray.append(roma)
        
        return citiesArray
    }
}
