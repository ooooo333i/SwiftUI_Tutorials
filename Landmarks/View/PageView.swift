//
//  PageView.swift
//  Landmarks
//
//  Created by ooooo333i on 7/3/24.
//

import SwiftUI

struct PageView<Page: View> : View {
    var pages: [Page]
    @State private var currentPage = 0
    var body: some View {
        ZStack(alignment : .bottomTrailing){
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
            
            
        }
        .aspectRatio(3 / 2 , contentMode: .fit)
    }
}

#Preview {
    PageView(pages:ModelData().feature.map{FeatureCard(landmark: $0) })
}
