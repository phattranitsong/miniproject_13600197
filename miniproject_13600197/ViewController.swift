//
//  ViewController.swift
//  miniproject_13600197
//
//  Created by songsuay on 11/7/18.
//  Copyright © 2018 ICTSUIM. All rights reserved.
//
import AVFoundation
import UIKit
//question
let allQuestion = QuestionBank()
var pickedAnswer : Bool = false
var questionNumber : Int = 0
var score : Int = 0
var correctCount : Int = 0
var wrongCount : Int = 0
var showname : String  = " "
//timer
var timer = Timer()
var limitTime = 20
var checkStatusToPlay = false
// play sound
 let FilesName = ["note1","note2"]
class ViewController: UIViewController ,AVAudioPlayerDelegate {

 var audioplayer: AVAudioPlayer!
  
    @IBOutlet weak var scorelb: UILabel!
    @IBOutlet weak var processlb: UILabel!
    @IBOutlet weak var processBar: UIView!
    @IBOutlet weak var imgshow: UIImageView!
    @IBOutlet weak var questionlb: UILabel!
    @IBOutlet weak var counttimer: UILabel!
    @IBOutlet weak var inputname: UITextField!
    @IBAction func clicktoplaybtn(_ sender: UIButton) {
        
        
        if inputname.text?.isEmpty ?? true {
            timer = Timer.scheduledTimer(timeInterval: 00, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: false)
            
            let alertName = UIAlertController(title: "ยังเล่นไม่ได้ค่ะ", message: "ต้องใส่ชื่อก่อนเริ่มเล่นนะคะ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction( title: "ตกลง", style: .default, handler:{
                UIAlertAction in self.startOver()
                
            })
            alertName.addAction(restartAction)
            
            present(alertName,animated: true,completion: nil)
            
            checkStatusToPlay = false
            limitTime = 20
            counttimer.text = "Timer: \(limitTime)"
            
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
            
            checkStatusToPlay = true
        }
    }
        
    
    
    override func viewDidLoad() {
        updateUI()
        questionlb.text = allQuestion.list[questionNumber].questionText
        limitTime = 20
        self.becomeFirstResponder()
        
        super.viewDidLoad()
    }
    @IBAction func answerPressed(_ sender: AnyObject) {
        if limitTime > 0 {
                if sender.tag == 1{
                    print(true)
                    pickedAnswer = true
                    
                }else if sender.tag == 2 {
                    print("picked false")
                    pickedAnswer = false
                }
                checkAnswer()
                questionNumber = questionNumber+1
                nextQuestion()
                updateUI()
        }else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
            
            checkStatusToPlay = true
        }
    }
    
    func checkAnswer(){
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer{
            print("ถูกต้องค่ะ")
            score = score + 1
            correctCount = correctCount + 1
            ProgressHUD.showSuccess("ถูกต้องค่ะ")
            imgshow.image = UIImage(named:"1")
            playSound("note1")
            
            
        } else  {
            print("ผิดค่ะ!")
            wrongCount = wrongCount + 1
            ProgressHUD.showError("ผิดค่ะ")
            imgshow.image = UIImage(named:"2")
            playSound("note2")
        }
        
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        correctCount = 0
        wrongCount = 0
        limitTime = 20
        counttimer.text = "⏱️Timer: \(limitTime)"
        imgshow.image = nil
        updateUI()
    }
    func nextQuestion(){
        showname =  inputname.text!
        if questionNumber <= 29 {
            questionlb.text = allQuestion.list[questionNumber].questionText
        }else{
            print("end of question")
            limitTime = 0
            let alert = UIAlertController(title: "ว้า แย่จัง", message: "หมดเวลาแล้ว \(showname) คะแนนของ  คือ \(score)", preferredStyle: .alert)
            
            let restartAction = UIAlertAction( title: "เล่นใหม่อีกครั้ง", style: .default, handler:{
                UIAlertAction in self.startOver()
               
            })
            
            alert.addAction(restartAction)
            
            present(alert,animated: true,completion: nil)
            
        }
        
    }
    func updateUI(){

       processBar.frame.size.width = (view.frame.size.width / 30) * CGFloat(questionNumber)
       processlb.text = String(questionNumber) + "/30"
       scorelb.text = "คะแนน :" + String (score)
        nextQuestion()
    }
    
    @objc func processTimer() {
        if limitTime == 0 {
            timer.invalidate()
            checkStatusToPlay = false
            let alert = UIAlertController(title: "ว้า แย่จัง", message: "หมดเวลาแล้ว คะแนนของ \(showname) คือ \(score)", preferredStyle: .alert)
            
            let restartAction = UIAlertAction( title: "เล่นใหม่อีกครั้ง", style: .default, handler:{
                UIAlertAction in self.startOver()
                
            })
            
            alert.addAction(restartAction)
            
            present(alert,animated: true,completion: nil)
            
        }else if limitTime > 0 {
            limitTime -= 1
            counttimer.text = "⏱️Timer: \(limitTime)"
        }
    }
    func playSound(_ playThis : String){
        let soundURL = Bundle.main.url(forResource: playThis, withExtension: "mp3")
        audioplayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioplayer.play()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("shakeๆๆๆๆ")
            
            questionNumber = questionNumber+1
            nextQuestion()
            updateUI()
            
        }
    }
}//end class
