import SwiftUI

struct StumbView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "multiply")
                .font(.system(size: 140, weight: .bold))
                .foregroundStyle(.red)
            
            Text("There's nothing here yet..")
                .strokeText(fontSize: 20)
                .foregroundStyle(LinearGradient.baseGradient)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    StumbView()
}
