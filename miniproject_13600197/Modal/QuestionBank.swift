//
//  QuestionBank.swift
//  miniproject_13600197
//
//  Created by songsuay on 11/8/18.
//  Copyright © 2018 ICTSUIM. All rights reserved.
//

import Foundation
class QuestionBank{
    
    var list = [Question] ()
    
    init() {
        let item = Question (text: "สวัสดีคะ",correctAnswer:false)
        list.append(item)
        list.append(Question(text: "คุณรับประทานข้าวหรือยังคะ", correctAnswer: true))
        list.append(Question(text: "ขอบคุณค่ะ", correctAnswer: true))
        list.append(Question(text: "คุณทำข้อสอบได้ไหมค่ะ", correctAnswer: false))
        list.append(Question(text: "ฉันชอบคุณค่ะ", correctAnswer: true))
        list.append(Question(text: "ขอบคุณนะคะ", correctAnswer: true))
        list.append(Question(text: "ว่าอย่างไรนะค่ะ", correctAnswer: false))
        list.append(Question(text: "ขอทางหน่อยค่ะ", correctAnswer: true))
        list.append(Question(text: "ไปไหนกันคะ", correctAnswer: true))
        list.append(Question(text: "พี่ค่ะมาทางนี้หน่อยค่ะ", correctAnswer: false))
        list.append(Question(text: "ไม่เข้าใจใช่ไหมคะ", correctAnswer: true))
        list.append(Question(text: "กลับก่อนนะคะ", correctAnswer: true))
        list.append(Question(text: "ทางนี้ใช่ไหมค่ะ", correctAnswer: false))
        list.append(Question(text: "คิดถึงนะคะ", correctAnswer: true))
        list.append(Question(text: "สบายดีไหมค่ะ", correctAnswer: false))
        list.append(Question(text: "เชิญค่ะ", correctAnswer: true))
        list.append(Question(text: "รับทราบคะ", correctAnswer: false))
        list.append(Question(text: "ได้ยินไหมคะ", correctAnswer: true))
        list.append(Question(text: "เริ่ดมากค่ะ", correctAnswer: true))
        list.append(Question(text: "มันทำไมหรอค่ะ", correctAnswer: false))
        list.append(Question(text: "อ๋อค่ะ", correctAnswer: true))
        list.append(Question(text: "สะดวกค่ะ", correctAnswer: true))
        list.append(Question(text: "คุยได้คะ", correctAnswer: false))
        list.append(Question(text: "หนูเป็นนักศึกษาคะ", correctAnswer: false))
        list.append(Question(text: "แน่นอนค่ะ", correctAnswer: true))
        list.append(Question(text: "ของชิ้นนี้ราคาเท่าไหร่ค่ะ", correctAnswer: false))
        list.append(Question(text: "สุดยอดเลยค่ะ", correctAnswer: true))
        list.append(Question(text: "เข้าใจตรงกันนะค่ะ", correctAnswer: false))
        list.append(Question(text: "อะไรค่ะ", correctAnswer: false))
        list.append(Question(text: "ยินดีที่ได้รู้จักค่ะ", correctAnswer: true))
    }
}

