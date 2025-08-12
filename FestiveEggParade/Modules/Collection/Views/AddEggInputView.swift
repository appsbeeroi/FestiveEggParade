import SwiftUI

struct AddEggInputView: View {
    
    let type: AddEggInputType
    
    @Binding var isShowDatePicker: Bool
    @Binding var text: String?
    @Binding var selectedDate: Date?
    
    @FocusState.Binding var isFocused: Bool
    
    @State var currentText = ""
    
    init(
        type: AddEggInputType,
        isShowDatePicker: Binding<Bool> = .constant(false),
        text: Binding<String?> = .constant(""),
        selectedDate: Binding<Date?> = .constant(Date()),
        isFocused: FocusState<Bool>.Binding,
    ) {
        self.type = type
        self._isShowDatePicker = isShowDatePicker
        self._text = text
        self._selectedDate = selectedDate
        self._isFocused = isFocused
    }
    
    var body: some View {
        HStack {
            if type == .date {
                let hasDate = selectedDate != nil
                let dateText = selectedDate?.formatted(.dateTime.year().month(.twoDigits).day()) ?? ""
              
                Text(hasDate ? dateText : type.placeholder)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.rammetto(with: 16))
                    .foregroundStyle(.baseWhite.opacity(hasDate ? 1 : 0.5))
            } else {
                HStack {
                    ZStack {
                        Text(text == nil ? type.placeholder : currentText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.rammetto(with: 16))
                            .foregroundStyle(.baseWhite.opacity(text == nil ? 0.5 : 1))

                        TextField("", text: $currentText)
                            .opacity(0.1)
                            .font(.rammetto(with: 16))
                            .focused($isFocused)
                    }
                    
                    if currentText != "" {
                        Button {
                            currentText = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                }
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 15)
        .background(.baseRed)
        .cornerRadius(18)
        .onAppear {
            if let text {
                currentText = text
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.baseLightRed, lineWidth: 1)
        }
        .onTapGesture {
            if type == .date {
                isFocused = false
                isShowDatePicker.toggle()
            }
        }
        .onChange(of: currentText) { currentText in
            text = currentText == "" ? nil : currentText
        }
    }
}
