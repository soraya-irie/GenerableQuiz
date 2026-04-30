import SwiftUI

struct QuizView: View {
    @State var quiz: Quiz

    private var quizStack: some View {
        Text("Quiz Stack")
    }

    var body: some View {
        quizStack
    }
}

#Preview {
    var sampleQuiz: Quiz {
        Quiz(questions: [
            "Question 1",
            "Question 2",
            "Question 3"
        ])
    }

    QuizView(quiz: sampleQuiz)
}
