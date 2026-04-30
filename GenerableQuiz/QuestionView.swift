import SwiftUI
import FoundationModels

struct QuestionView: View {
    var question: Question.PartiallyGenerated

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QuestionView(question: Question.sample.asPartiallyGenerated())
}
