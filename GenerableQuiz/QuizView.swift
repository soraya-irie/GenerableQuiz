import SwiftUI

struct QuizView: View {
    @Environment(QuizGenerator.self) private var generator

    private var quizStack: some View {
        VStack(spacing: 16) {
            ForEach(quiz.questions, id: \.description) { question in
                Text(question)
            }
        }
        .navigationTitle("Sample Topic")
        .padding()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)

                quizStack
            }
        }
    }
}

#Preview {
    QuizView()
        .environment(QuizGenerator(topic: "Marin Life"))
}
