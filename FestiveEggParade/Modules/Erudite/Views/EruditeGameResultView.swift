import SwiftUI

struct EruditeGameResultView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let correctAnswers: Int

    @Binding var isActiveNavigation: Bool
    
    let retryAction: () -> Void
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack(spacing: 20) {
                correctAnswersSection
                image
                rateSection
                buttonsSection
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 45)
            .padding(.horizontal, 35)
        }
        .navigationBarBackButtonHidden()
    }
    
    private var correctAnswersSection: some View {
        HStack {
            Text("PAST RESULT")
                .strokeText(fontSize: 14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(LinearGradient.baseGradient)
            
            Text("\(correctAnswers)/10")
                .strokeText(fontSize: 14)
                .foregroundStyle(LinearGradient.baseGradient)
        }
        .frame(height: 65)
        .padding(.horizontal, 12)
        .background(.baseRed)
        .cornerRadius(20)
    }
    
    private var image: some View {
        Image(.Images.goldEgg)
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
    }
    
    private var rateSection: some View {
        VStack(spacing: 14) {
            Text("\(correctAnswers)/10")
                .strokeText(fontSize: 55)
                .foregroundStyle(LinearGradient.baseGradient)
            
            let result = EasterEggQuizQuestion.defineResult(by: correctAnswers)
            
            HStack(spacing: 0) {
                Text(result.title)
                    .strokeText(fontSize: 30)
                    .foregroundStyle(LinearGradient.baseGradient)
                    .multilineTextAlignment(.center)
                
                Text(result.icon)
                    .font(.system(size: 30))
            }
        }
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 7) {
            Button {
                retryAction()
                dismiss()
            } label: {
                Image(.Images.retryButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 93, height: 77)
            }
            
            Button {
                isActiveNavigation = false
            } label: {
                Image(.Images.exitButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 93, height: 77)
            }
        }
    }
}

#Preview {
    EruditeGameResultView(correctAnswers: 3, isActiveNavigation: .constant(false)) {}
}
