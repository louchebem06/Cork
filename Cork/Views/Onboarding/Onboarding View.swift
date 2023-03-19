//
//  Onboarding View.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

struct OnboardingView: View
{
    var body: some View
    {
        VStack(spacing: 10)
        {
            Text("Welcome to Cork!")
                .font(.title)
            Text("Thank you for downloading Cork. Let's get you started.")
            
            VStack
            {
                Text("Cork lets you...")
                    .font(.title2)
                
                Grid
                {
                    FeatureRow(iconName: "square.and.arrow.down", iconColor: .blue, headline: "Some text", subheadline: "A much longer explanation")
                }
            }

            HStack
            {
                HomebrewIntroduction()
            }
        }
        .padding()
    }
}
