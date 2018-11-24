//
//  Question.swift
//  miniproject_13600197
//
//  Created by songsuay on 11/8/18.
//  Copyright © 2018 ICTSUIM. All rights reserved.
//

import Foundation

class Question{
    let answer : Bool
    let questionText : String
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}

