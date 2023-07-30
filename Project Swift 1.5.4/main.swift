//
//  main.swift
//  Project Swift 1.5.4
//
//  Created by Khristina Valevskaia on 22.05.2022.

import Foundation

struct Question {

    private var question: String
    private var param1: Int
    private var param2: Int


    init (question: String, param1: Int, param2: Int) {

        self.question = question
        self.param1 = param1
        self.param2 = param2

    }

    mutating func setQuestion(_ question: String) {

        self.question = question
    }

    func getQuestion() -> String {

        return self.question
    }

    mutating func setParam1(_ param1: Int) {

        self.param1 = param1
    }

    func  getParam1() -> Int {

        return self.param1
    }

    mutating func setParam2(_ param2: Int) {

        self.param2 = param2
    }

    func getParam2() -> Int {

        return self.param2
    }
}

struct Survey {

    var myQuestionsmyParams: [Question] = []

    var totalScore: [Int] = []

    mutating func runTest () {

        totalScore.removeAll()

        for yourInput in myQuestionsmyParams {

            print(yourInput.getQuestion())
            guard let input = readLine(),
                  let myinput = Int(input) else {

                  print("Invalid input ")
                  exit(1)
                  }

            let wrong = "You are wrong! "
            let right = "You are right! "
            let result = "Your score + "

            if myinput < yourInput.getParam1() || myinput > yourInput.getParam2() {

                 let score = 0
                 print(result, score)
                 print(wrong)

            } else if myinput != 0 {

                 let score = 1
                 print(result, score)
                 print(right)
                 totalScore.append(score)

            } else {

                 print("Invalid input")

                 exit(2)
            }
        }
    }

    func printResult () {

        var finalScore = 0
        for Final in totalScore {

        finalScore += Final
        }

        switch finalScore {

            case 0...2:

            print("Your result is not too good. \(finalScore). Before you get a dog, you should learn a lot. ")

            case 3...4:

            print("Your result is pretty good. \(finalScore). A little more knowledge, and you will become a great owner for a dog! ")

            case 5...6:

            print("Your result is excellent! \(finalScore). You know a lot about dogs and are ready to become a responsible owner! ")

            default:

            print("Error. Take the test again")
        }
    }

    mutating func addQuestion(quest: Question) {

        myQuestionsmyParams.append(quest)
    }

}

var startSurvey = Survey()

var newData1 = Question(question: "At what age (months) is it best to take a puppy home?", param1: 2, param2: 5)

startSurvey.addQuestion(quest: newData1)

newData1.setQuestion("How long do dogs live? ")
newData1.setParam1(10)
newData1.setParam2(15)

startSurvey.addQuestion(quest: newData1)

newData1.setQuestion("At what time in morning should take a dog for a walk? ")
newData1.setParam1(6)
newData1.setParam2(8)

startSurvey.addQuestion(quest: newData1)

newData1.setQuestion("How many minutes need to walk with a dog in total per day? ")
newData1.setParam1(90)
newData1.setParam2(360)

startSurvey.addQuestion(quest: newData1)

newData1.setQuestion("Up to how many months of age does the dog grow? ")
newData1.setParam1(30)
newData1.setParam2(36)

startSurvey.addQuestion(quest: newData1)

newData1.setQuestion("From how old acceptable take a dog for a child? ")
newData1.setParam1(12)
newData1.setParam2(15)

startSurvey.addQuestion(quest: newData1)

startSurvey.runTest()

startSurvey.printResult()


