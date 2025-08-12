import Foundation

final class EruditeViewModel: ObservableObject {
    
    @Published var selectedOption: Option?
    @Published var isCompletedTest = false
    
    @Published private(set) var currentQuestion: EasterEggQuizQuestion = .q1
    
    private(set) var currentScore = 0
    
    func checkAnswer(with value: String) {
        if value == currentQuestion.correctAnswer {
            currentScore += 1
        }
        
        selectedOption = nil 
        turnQuestion()
    }
    
    func retryGame() {
        selectedOption = nil
        isCompletedTest = false
        currentQuestion = .q1
        currentScore = 0
    }
    
    private func turnQuestion() {
        switch currentQuestion {
            case .q1:
                currentQuestion = .q2
            case .q2:
                currentQuestion = .q3
            case .q3:
                currentQuestion = .q4
            case .q4:
                currentQuestion = .q5
            case .q5:
                currentQuestion = .q6
            case .q6:
                currentQuestion = .q7
            case .q7:
                currentQuestion = .q8
            case .q8:
                currentQuestion = .q9
            case .q9:
                currentQuestion = .q10
            case .q10:
                isCompletedTest = true
        }
    }
}
