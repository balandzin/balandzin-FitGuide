//
//  AboutAppViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 18.01.24.
//

import UIKit

final class AboutAppViewController: UIViewController {

    @IBOutlet var aboutAppLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutAppLabel.text = """
            Добро пожаловать в наше приложение по составлению программы тренировок в тренажерном зале! Мы рады приветствовать тебя в нашем фитнес-мире, где ты сможешь создать идеальную программу тренировок, а также получить максимальные результаты.
            
            Приложение разработано с учетом потребностей как начинающих спортсменов, так и опытных тренирующихся. Мы предлагаем удобный и интуитивно понятный интерфейс, который позволит тебе легко составить программу тренировок, подходящую именно тебе.
            Мы поможем вам пользователю составить корректную программу тренировок в соответствии с текущим сотоянием тела и антропометрическими параметрами. Тренировки предусматривают различные цели (набор мышечной массы, сжигагние излишнего подкожного жира)
            
            Программа предусматривает трехдневный режим тернировок, которые генерируются в случайном порядке, что сделает ваш путь к идеальному телу разнообразным и интересным
            
            Команда разработчиков предлагает вам тренировочную программу по сплиту следующей схемы:
            
                 ДЕНЬ 1: Спина + Трицепс
                 ДЕНЬ 2: ОТДЫХ
                 ДЕНЬ 3: Грудь + Бицепс
                 ДЕНЬ 4: ОТДЫХ
                 ДЕНЬ 5: Ноги + Плечи
                 ДЕНЬ 6: ОТДЫХ
                 ДЕНЬ 7: ОТДЫХ
            
            В свою очередь, пользователь может корректировать ее в соответствии со своими пожеланиями
            
            Так что не теряй время и приступай к тренировкам уже сегодня! Дарим тебе возможность преобразить свое тело и достичь желаемых результатов. Успехов и приятных тренировок!
            
            
            Разработчики:
            Баландин Антон
            АЛЕКСАНДР
            """
    }
}