//
//  ProgramViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 17.01.24.
//

import UIKit

final class ProgramViewController: UITableViewController{
    
    var person: Person!
    var program: [Exercises]!

    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension ProgramViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercise", for: indexPath)
        var content = cell.defaultContentConfiguration()

        if indexPath.row == 0 {
            content.text = program[indexPath.section].exercises1
            content.image = UIImage(systemName: "figure.run")
        } else if indexPath.row == 1 {
            content.text = program[indexPath.section].exercises2
            content.image = UIImage(systemName: "dumbbell")
        } else if indexPath.row == 2 {
            content.text = program[indexPath.section].exercises3
            content.image = UIImage(systemName: "dumbbell.fill")
        } else if indexPath.row == 3 {
            content.text = program[indexPath.section].exercises4
            content.image = UIImage(systemName: "dumbbell")
        } else if indexPath.row == 4 {
            content.text = program[indexPath.section].exercises5
            content.image = UIImage(systemName: "dumbbell.fill")
        } else if indexPath.row == 5 {
            content.text = program[indexPath.section].exercises6
            content.image = UIImage(systemName: "figure.cooldown")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        program[section].day
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
