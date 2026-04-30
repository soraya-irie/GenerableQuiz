import SwiftUI
import FoundationModels

struct UnavailableView: View {
    let reason: SystemLanguageModel.Availability.UnavailableReason

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UnavailableView(reason: .appleIntelligenceNotEnabled)
}
