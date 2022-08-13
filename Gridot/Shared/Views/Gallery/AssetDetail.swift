//
//  AssetDetail.swift
//  Gridot
//
//  Created by 박찬울 on 2022/07/29.
//

import SwiftUI

struct AssetDetail: View {
    @EnvironmentObject var modelData: ModelData
    var asset: Asset
    var assetIndex: Int {
        modelData.assets.firstIndex(where: { $0.id == asset.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: asset.locationCoordinate)
                .ignoresSafeArea()
                .frame(height: 300)
            
            CircleImage(image: asset.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(asset.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.assets[assetIndex].isFavorite)
                }
                
                HStack {
                    Text(asset.park)
                        .font(.subheadline)
                    Spacer()
                    Text(asset.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(asset.name)")
                    .font(.title2)
                Text(asset.description)
            }
            .padding()
        }
        .navigationTitle(asset.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        AssetDetail(asset: ModelData().assets[0])
            .environmentObject(ModelData())
    }
}
