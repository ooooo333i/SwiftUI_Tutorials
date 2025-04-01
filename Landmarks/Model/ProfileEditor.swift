//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by ooooo333i on 7/3/24.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dataRange : ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Username")
                Spacer()
                TextField("Username",text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            Toggle(isOn : $profile.prefersNotification){
                Text("Enable Notifications")
            }
            Picker("Seasonal Photo",selection: $profile.seasonablePhoto){
                ForEach(Profile.Season.allCases){ season in
                    Text(season.rawValue).tag(season)
                }
            }
            DatePicker(selection: $profile.goalDate,in: dataRange,displayedComponents: .date){
                Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
