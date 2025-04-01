//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by ooooo333i on 6/30/24.
//

import SwiftUI


@main//The @main attribute identifies the app’s entry point.
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category : "LandmarkNear")
        #endif
    }
}

