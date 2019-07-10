//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var author = ""
    // allowing you to have a variable that refers to the other class
    var data = AviatrixData()
    var currentLocation = "St. Louis"
    // there needs to be a value for location b/c plane has to start somewhere (above)
    var distanceTraveled = 0 //miles
    var maxFuel = 5000 //gallons
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4 //m/g
    var fuelCost = 0.0

    init (userName : String){
        author = userName
    }
    var running = false
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        //the object above is from the AviatrixData class
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        fuelLevel = 5000.0
        return gallonsNeeded
        //EVERY TIME YOU RETURN, YOU NEED TO DO THE ARROW THING AND SPECIFY DATATYE ON FIRST LINE
    }
    
    func flyTo(destination : String) {
        // the += adds the old value to the new value
        distanceTraveled += distanceTo(currentLocation: currentLocation, target: destination)
        //create a fuelSpent variable that calculates how much fuel you have used
        let fuelSpent = Double(distanceTraveled) / milesPerGallon
        //update fuelLevel fased on fuelSpent
        fuelLevel -= fuelSpent
        //or fuelLevel -= fuelSpent
        //you want the currentLocation to update to the destination that the user inputs (below)
        currentLocation = destination
    }
    
    func distanceTo(currentLocation : String, target : String) -> Int{
        // using the data variable (equal to aviatrixdata() that we created above
        // exclamation is used to unwrap data, and tells the program that there is data on the other side for sure (you do no need to do this when computer recognizes itb
        return data.knownDistances [currentLocation]![target]!
        //the data above goes into the st. louis dictionary key, and goes into phoenix, and then key for phoenix
    }
    
    func knownDestinations() -> [String] {
        // the syntaz above is always used when you have a return statement because you need to specify the data type
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
    
    
}
