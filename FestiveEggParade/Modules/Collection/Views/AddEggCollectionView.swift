import SwiftUI

struct AddEggCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var rawModel: RawEggModel
    
    let saveAction: (RawEggModel) -> Void
    
    @State private var currentDate = Date()
    
    @State private var isShowImagePicker = false
    @State private var isShowDatePicker = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    navigationSection
                    
                    VStack(spacing: 12) {
                        image
                            .padding(.top, 50)
                        
                        inputSection
                        marksSection
                        
                        Spacer()
                        
                        doneButton
                    }
                    .padding(.horizontal, 35)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 28)
                
            }
            
            VStack {
                if isShowDatePicker {
                    VStack {
                        HStack {
                            Button("Close") {
                                isShowDatePicker = false
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        
                        DatePicker("", selection: $currentDate, displayedComponents: [.date])
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                    }
                    .frame(maxWidth: .infinity)
                    .background(.baseWhite)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .animation(.default, value: isShowDatePicker)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Button("Done") {
                        isFocused = false
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .sheet(isPresented: $isShowImagePicker) {
            ImagePicker(selectedImage: $rawModel.image)
        }
        .onChange(of: currentDate) { currentDate in
            rawModel.date = currentDate
        }
    }
    
    private var navigationSection: some View {
        HStack(spacing: 20) {
            BackButton()
            
            Text("ADD THE EGG")
                .strokeText(fontSize: 30)
                .foregroundStyle(LinearGradient.baseGradient)
        }
    }
    
    @ViewBuilder
    private var image: some View {
        if let image = rawModel.image {
            Button {
                isShowImagePicker.toggle()
            } label: {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 165, height: 165)
                    .clipped()
                    .cornerRadius(25)
                    .overlay {
                        Image(systemName: "photo.fill")
                            .font(.system(size: 65))
                            .cornerRadius(25)
                            .foregroundStyle(.baseWhite.opacity(0.4))
                    }
            }
        } else {
            Button {
                isShowImagePicker.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Image(systemName: "photo.fill")
                        .font(.system(size: 65))
                        .cornerRadius(25)
                        .foregroundStyle(.baseWhite)
                }
                .frame(width: 165, height: 165)
            }
        }
    }
    
    private var inputSection: some View {
        VStack(spacing: 12) {
            AddEggInputView(type: .title, text: $rawModel.title, isFocused: $isFocused)
            
            AddEggInputView(
                type: .date,
                isShowDatePicker: $isShowDatePicker,
                selectedDate: $rawModel.date,
                isFocused: $isFocused
            )
            
            AddEggInputView(type: .source, text: $rawModel.source, isFocused: $isFocused)
        }
    }
    
    private var marksSection: some View {
        VStack(spacing: 7) {
            Text("Marks")
                .strokeText(fontSize: 14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(LinearGradient.baseGradient)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(spacing: 7), count: 2),
                alignment: .leading,
                spacing: 7) {
                    ForEach(EggMark.allCases) { mark in
                        AddEggMarkCellVIew(mark: mark, selectedMark: $rawModel.mark)
                    }
                }
        }
    }
    
    private var doneButton: some View {
        Button {
            saveAction(rawModel)
            dismiss()
        } label: {
            Image(rawModel.isAvailable ? .Images.doneButton : .Images.doneInactiveButton)
                .resizable()
                .scaledToFit()
                .frame(width: 156, height: 72)
        }
    }
}

#Preview {
    AddEggCollectionView(rawModel: RawEggModel()) { _ in }
}
