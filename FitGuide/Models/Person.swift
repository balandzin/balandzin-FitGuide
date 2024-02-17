//
//  Person.swift
//  FitGuide
//
//  Created by Антон Баландин on 17.01.24.
//

struct Person {
    
    enum TypeOfGender {
        case man
        case woman
    }
    
    let name: String
    let weight: Double
    let height: Double
    let gender: TypeOfGender
    let bodyMassIndex: Double
    
    
    static func getProgram() -> [Exercises]{
        let dataStore = DataStore.shared
        
        var exercises: [Exercises] = []
        
        let day1 = Exercises(
            day: "Day 1",
            exercises1: dataStore.cardio.randomElement() ?? "",
            exercises2: dataStore.backFirstExercise.randomElement() ?? "",
            exercises3: dataStore.backSecondExercise.randomElement() ?? "",
            exercises4: dataStore.tricepsFirstExercise.randomElement() ?? "",
            exercises5: dataStore.tricepsSecondExercise.randomElement() ?? "",
            exercises6: dataStore.hitch.randomElement() ?? ""
        )
        
        let day2 = Exercises(
            day: "Day 2",
            exercises1: dataStore.cardio.randomElement() ?? "",
            exercises2: dataStore.breastFirstExercise.randomElement() ?? "",
            exercises3: dataStore.breastSecondExercise.randomElement() ?? "",
            exercises4: dataStore.bicepsFirstExercise.randomElement() ?? "",
            exercises5: dataStore.bicepsSecondExercise.randomElement() ?? "",
            exercises6: dataStore.hitch.randomElement() ?? ""

        )
        
        let day3 = Exercises(
            day: "Day 3",
            exercises1: dataStore.cardio.randomElement() ?? "",
            exercises2: dataStore.legsFirstExercise.randomElement() ?? "",
            exercises3: dataStore.legsSecondExercise.randomElement() ?? "",
            exercises4: dataStore.shouldersFirstExercise.randomElement() ?? "",
            exercises5: dataStore.shouldersSecondExercise.randomElement() ?? "",
            exercises6: dataStore.hitch.randomElement() ?? ""

        )
        
        exercises.append(day1)
        exercises.append(day2)
        exercises.append(day3)
        
        return exercises
    }
}

struct Exercises {
    let day: String
    let exercises1: String
    let exercises2: String
    let exercises3: String
    let exercises4: String
    let exercises5: String
    let exercises6: String
}
