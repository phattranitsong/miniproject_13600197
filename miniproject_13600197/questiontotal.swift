//
//  questiontotal.swift
//  miniproject_13600197
//
//  Created by songsuay on 11/8/18.
//  Copyright © 2018 ICTSUIM. All rights reserved.
//

import Foundation
class questiontotal{
    
    var list = [question] ()
    
    init() {
        let item = question (text: "สองสวยมั้ย",correctAnswer:true)
        
        list.append(item)
        //index = 1
        list.append(question(text: "สองขยันมั้ย", correctAnswer: false))
        //index = 2
        list.append(question(text: "สองชอบกินข้าวเช้ามั้ย", correctAnswer: false))
        //index = 3
        list.append(question(text: "สองชอบกินเค้กใช่มั้ย", correctAnswer: true))
        //index = 4
        list.append(question(text: "สองไม่มีตังใช่มั้ย", correctAnswer: true))
    }
}
