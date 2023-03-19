//
//  Onboarding View.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

struct OnboardingView: View
{
    
    @EnvironmentObject var appState: AppState
    
    var body: some View
    {
        VStack(spacing: 10)
        {
            if !appState.isHomebrewInstalled
            {
                HomebrewIntroduction()
            }
        }
        .padding()
    }
}
