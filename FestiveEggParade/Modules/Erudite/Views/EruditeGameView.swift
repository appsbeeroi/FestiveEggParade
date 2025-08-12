import SwiftUI

struct EruditeGameView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = EruditeViewModel()
    
    @Binding var isActiveNavigation: Bool
        
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack {
                navigationSection
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        image
                        questionText
                        answerSection
                    }
                    
                    doneButton
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 35)
            .animation(.default, value: viewModel.currentQuestion)
            
            NavigationLink(isActive: $viewModel.isCompletedTest) {
                EruditeGameResultView(correctAnswers: viewModel.currentScore, isActiveNavigation: $isActiveNavigation) {
                    viewModel.retryGame()
                }
            } label: {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var navigationSection: some View {
        ZStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(.Images.closeButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 57, height: 47)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("\(viewModel.currentQuestion.index)/10")
                .font(.rammetto(with: 35))
                .foregroundStyle(LinearGradient.baseGradient)
        }
    }
    
    private var image: some View {
        Image(viewModel.currentQuestion.image)
            .resizable()
            .scaledToFill()
            .frame(width: 233, height: 168)
            .clipped()
    }
    
    private var questionText: some View {
        Text(viewModel.currentQuestion.text)
            .font(.rammetto(with: 25))
            .foregroundStyle(LinearGradient.baseGradient)
            .multilineTextAlignment(.center)
    }
    
    private var answerSection: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.currentQuestion.options) { option in
                EruditeAnswerCellView(option: option, selectedOption: $viewModel.selectedOption)
            }
        }
    }
    
    private var doneButton: some View {
        Button {
            guard let value = viewModel.selectedOption?.letter else { return }
            viewModel.checkAnswer(with: value)
        } label: {
            Image(viewModel.selectedOption == nil ? .Images.doneInactiveButton : .Images.doneButton)
                .resizable()
                .scaledToFit()
                .frame(width: 156, height: 72)
                .disabled(viewModel.selectedOption == nil)
        }
        .padding(.top, 20)
    }
}

#Preview {
    EruditeGameView(isActiveNavigation: .constant(false))
}


