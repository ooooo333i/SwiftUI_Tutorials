//
//  CategoryHome.swift
//  Landmarks
//
//  Created by ooooo333i on 7/2/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView{
            List{
                PageView(pages: modelData.feature.map { FeatureCard(landmark: $0)})
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(),id : \.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar{
                Button{
                    showingProfile.toggle()
                }label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        }detail:{
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
