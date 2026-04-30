import SwiftUI
import FoundationModels

struct AnswerView: View {
    var displayAnswer: Answer.PartiallyGenerated

    var body: some View {
        Button {

        } label: {
            Text(displayAnswer.text ?? "Generating...")
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    AnswerView(displayAnswer: Answer.correctAnswer.asPartiallyGenerated())
}
