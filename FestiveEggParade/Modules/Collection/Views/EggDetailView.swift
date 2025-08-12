import SwiftUI

struct EggDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: CollectionViewModel
        
    var egg: EggModel
    
    @State private var isShowEditView = false
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack(spacing: 0) {
                navigationSection
                
                VStack(spacing: 26) {
                    image
                    
                    VStack(spacing: 16) {
                        Text(egg.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.rammetto(with: 25))
                            .foregroundStyle(LinearGradient.baseGradient)
                            .multilineTextAlignment(.leading)
                        
                        VStack(spacing: 7) {
                            Text("DATE")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.rammetto(with: 14))
                                .foregroundStyle(.basePink)
                            
                            Text(egg.date.formatted(.dateTime.year().month(.twoDigits).day()))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.rammetto(with: 16))
                                .foregroundStyle(.baseWhite)
                        }
                        
                        VStack(spacing: 7) {
                            Text("SOURCE")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.rammetto(with: 14))
                                .foregroundStyle(.basePink)
                            
                            Text(egg.source)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.rammetto(with: 16))
                                .foregroundStyle(.baseWhite)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 35)
            
            NavigationLink(isActive: $isShowEditView) {
                AddEggCollectionView(rawModel: RawEggModel(from: egg)) { rawModel in
                    viewModel.save(rawModel)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        dismiss()
                    }
                }
            } label: {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var navigationSection: some View {
        HStack {
            BackButton()
            
            Spacer()
            
            HStack(spacing: 8) {
                Button {
                    isShowEditView.toggle()
                } label: {
                    Image(.Images.editButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 57, height: 47)
                }
                
                Button {
                    viewModel.remove(egg)
                    dismiss()
                } label: {
                    Image(.Images.removeButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 57, height: 47)
                }
            }
        }
    }
    
    private var image: some View {
        Image(uiImage: egg.image)
            .resizable()
            .scaledToFill()
            .frame(width: 165, height: 165)
            .clipped()
            .cornerRadius(25)
    }
}

#Preview {
    EggDetailView(
        viewModel: CollectionViewModel(),
        egg: EggModel(from: RawEggModel())
    )
}
