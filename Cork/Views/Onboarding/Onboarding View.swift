//
//  Onboarding View.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

enum HomebrewIntroductionStage
{
    case explainingHomebrew, installingHomebrew
}

struct OnboardingView: View
{
    
    @EnvironmentObject var appState: AppState
    
    @State private var homebrewIntroductionStage: HomebrewIntroductionStage = .explainingHomebrew
    
    var body: some View
    {
        VStack(spacing: 10)
        {
            if !appState.isHomebrewInstalled
            {
                switch homebrewIntroductionStage {
                    case .explainingHomebrew:
                        HomebrewIntroduction(homebrewIntroductionStage: $homebrewIntroductionStage)
                    case .installingHomebrew:
                        HomebrewInstallation()
                }
            }
        }
        .padding()
    }
}
