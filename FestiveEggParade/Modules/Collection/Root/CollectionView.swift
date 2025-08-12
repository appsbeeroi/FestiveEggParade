import SwiftUI

struct CollectionView: View {
    
    @StateObject private var viewModel = CollectionViewModel()
    
    @Binding var isShowTabBar: Bool
    
    @State private var isShowAddEggView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.Images.background)
                    .expandToFill()
                
                VStack(spacing: 0) {
                    navigationSection
                    collectionSection
                    
                    Spacer()
                    
                    addEggSection
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 28)
                
                NavigationLink(isActive: $isShowAddEggView) {
                    AddEggCollectionView(rawModel: RawEggModel()) { rawModel in
                        viewModel.save(rawModel)
                    }
                } label: {
                    EmptyView()
                }
            }
            .onAppear {
                isShowTabBar = true
                viewModel.loadEggs()
            }
        }
    }
    
    private var navigationSection: some View {
        VStack(spacing: 0) {
            Text("MY")
                .strokeText(fontSize: 30)
                .foregroundStyle(.baseWhite)
            
            Text("Collection")
                .strokeText(fontSize: 30)
                .foregroundStyle(.baseYellow)
                .offset(y: -20)
        }
    }
    
    @ViewBuilder
    private var collectionSection: some View {
        if viewModel.eggs.isEmpty {
            StumbView()
        } else {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(viewModel.eggs) { egg in
                        NavigationLink {
                            EggDetailView(viewModel: viewModel, egg: egg)
                                .onAppear {
                                    isShowTabBar = false 
                                }
                        } label: {
                            EggCollectionCellView(model: egg)
                        }
                    }
                }
                .padding(.horizontal, 35)
            }
        }
    }
    
    private var addEggSection: some View {
        Button {
            isShowTabBar = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isShowAddEggView.toggle()
            }
        } label: {
            Image(.Images.addButton)
                .resizable()
                .scaledToFit()
                .frame(width: 156, height: 72)
        }
        .padding(.bottom, 130)
    }
}

#Preview {
    CollectionView(isShowTabBar: .constant(false))
}

