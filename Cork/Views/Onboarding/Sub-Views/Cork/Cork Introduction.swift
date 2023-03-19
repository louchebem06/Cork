//
//  Cork Introduction.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

struct CorkIntroduction: View {
    var body: some View {
        VStack
        {
            Text("Welcome to Cork!")
                .font(.title)
            Text("Let's get you started.")
        }
        
        VStack
        {
            Text("Cork lets you...")
                .font(.title2)
            
            Grid(verticalSpacing: 20)
            {
                FeatureRow(iconName: "square.and.arrow.down", iconColor: .blue, headline: "Install Effortlessly", subheadline: "Just look a package up, press Install, and it's done!")
                FeatureRow(iconName: "spigot", iconColor: .secondary, headline: "Add Taps", subheadline: "Can't find a package? Simply all a tap that includes it.")
                FeatureRow(iconName: "trash", iconColor: .red, headline: "Free Up Space", subheadline: "Delete all those pesky caches that take up so much disk space.")
            }
        }

    }
}
