import Foundation

class QuizViewModel {
    
    private (set) var defaults = SettingsViewController().defaults
    static let shared = QuizViewModel()
    
    private let quiz = Quiz()
    
    private (set) var currentNumber = 0
    private (set) var score = 0
    
    //Calculated properties
    var questions : [Question] {
        return quiz.questions
    }
    
    var current : Question {
        return quiz.questions[currentNumber]
    }
    
    var isLast : Bool {
        return currentNumber == quiz.questions.count - 1
    }
    
    var isFirst : Bool {
        return currentNumber == 0
    }
    
    var count : Int {
        return quiz.questions.count
    }
    
    //Methods
    private init() {
        
    }
    
    func reset() {
        currentNumber = 0
        score = 0
    }
    
    func checkAnswer(_ choice: Int) -> Bool {
        
        if choice == quiz.correct {
            score += 1
            return true
        }
        
        return false
    }
    
    func next() {
        if currentNumber < quiz.questions.count - 1 {
            currentNumber+=1
        }
    }
    
    func previous() {
        if currentNumber > 0 {
            currentNumber-=1
        }
    }
    
    func add(_ question: Question) {
        quiz.add(question)
    }
    
    func remove(_ number : Int) {
        quiz.remove(number)
    }
}
