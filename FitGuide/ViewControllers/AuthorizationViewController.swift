//
//  ViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 25.12.23.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var bodyMassIndexLabel: UILabel!
    @IBOutlet var idealBodyMassIndexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.done,
            target: self,
            action: #selector(self.doneClicked)
        )
        
        toolBar.setItems(([flexibleSpace, doneButton]), animated: false)
        
        weightTextField.inputAccessoryView = toolBar
        heightTextField.inputAccessoryView = toolBar
    }
    
    @IBAction func showBMIAction() {
        if nameTextField.text == "" || weightTextField.text == "" || heightTextField.text == "" {
            showAlert(message: "Введите корректные данные пользователя")
        } else {
            bodyMassIndexLabel.text = """
            \(nameTextField.text ?? ""),  ваш индекс массы тела:
            \(getBodyMassIndex().0) - \(getBodyMassIndex().1)
            """
            
            if genderSegmentedControl.selectedSegmentIndex == 0 {
                idealBodyMassIndexLabel.text = "Идеальный индекс массы тела для мужчины равен 23"
            } else {
                idealBodyMassIndexLabel.text = "Идеальный индекс массы тела для женщины равен 21.5"
            }
        }
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    
    private func getBodyMassIndex() -> (Double, String) {
        var conclusion = ""
        let heigh = Double(heightTextField.text ?? "1") ?? 1
        let weight = Double(weightTextField.text ?? "0") ?? 0
        
        
        let bodyMassIndex = weight / (heigh * heigh / 10000)
        let roundedIndex = round(bodyMassIndex * 10)/10
        
        switch bodyMassIndex {
        case ..<16: conclusion = "Выраженный дефицит массы тела"
        case 16..<18.5: conclusion = "Недостаточная масса тела (дефицит)"
        case 18.5..<25: conclusion = "Норма"
        case 25..<30: conclusion = "Избыточная масса тела (состояние, предшествующее ожирению)"
        case 30..<35: conclusion = "Ожирение 1-й степени"
        case 35..<40: conclusion = "Ожирение 2-й степени"
        default:
            conclusion = "Ожирение 3-й степени"
        }
        
        return (roundedIndex, conclusion)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nameTextField.text == "" || weightTextField.text == "" || heightTextField.text == "" {
            showAlert(message: "Введите корректные данные пользователя")
        } else {
            let heigh = Double(heightTextField.text ?? "1") ?? 1
            let weight = Double(weightTextField.text ?? "0") ?? 0
            
            let gender = if genderSegmentedControl.selectedSegmentIndex == 0 {
                Person.TypeOfGender.man
            } else {
                Person.TypeOfGender.woman
            }
            
            let person = Person(
                name: nameTextField.text ?? "",
                weight: weight,
                height: heigh,
                gender: gender,
                bodyMassIndex: getBodyMassIndex().0
            )
            
            let program = Person.getProgram()
            
            guard let navigationVC = segue.destination as? UINavigationController else {return}
            let programVC = navigationVC.topViewController as? ProgramViewController
            programVC?.person = person
            programVC?.program = program
        }
    }
}
