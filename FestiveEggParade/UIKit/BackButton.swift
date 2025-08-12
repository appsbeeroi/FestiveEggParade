import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(.Images.backButton)
                .resizable()
                .scaledToFit()
                .frame(width: 57, height: 47)
        }
    }
}

#Preview {
    BackButton()
}
