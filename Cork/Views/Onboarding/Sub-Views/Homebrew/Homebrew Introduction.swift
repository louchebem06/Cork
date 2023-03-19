//
//  Homebrew Introduction.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

private enum CurrentHomebrewIntroductionPage
{
    case whatIsHomebrew, whyUseHomebrew, doesItHaveAllTheApps
}

struct HomebrewIntroduction: View
{
    @Binding var homebrewIntroductionStage: HomebrewIntroductionStage
    
    @State private var headlineSubheadlineSpacing: CGFloat = 5

    @State private var currentPage: CurrentHomebrewIntroductionPage = .whatIsHomebrew

    var body: some View
    {
        VStack(spacing: 15)
        {
            Text("Welcome to the world of Homebrew!")
                .font(.title)

            VStack(alignment: .leading, spacing: 15)
            {
                switch currentPage
                {
                case .whatIsHomebrew:
                    VStack(alignment: .leading, spacing: headlineSubheadlineSpacing)
                    {
                        Text("What is Homebrew?")
                            .font(.headline)
                        Text("It's like the App Store. It's the one-stop-shop for all sorts of apps, even those that are not in the App Store.")

                        Spacer()
                        
                        HStack
                        {
                            Spacer()

                            Button
                            {
                                currentPage = .whyUseHomebrew
                            } label: {
                                Text("Why use Homebrew?")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                case .whyUseHomebrew:
                    VStack(alignment: .leading, spacing: headlineSubheadlineSpacing)
                    {
                        Text("Why should I use Homebrew?")
                            .font(.headline)
                        Text("Usually, when you want to install an app that is not in the App Store, you have to download it from the app's website.")
                        Text("With Homebrew, you can just say what app you want to install, and Homebrew finds and installs it automatically for you.")

                        Spacer()
                        
                        HStack
                        {
                            Button
                            {
                                currentPage = .whatIsHomebrew
                            } label: {
                                Text("Back")
                            }

                            Spacer()

                            Button
                            {
                                currentPage = .doesItHaveAllTheApps
                            } label: {
                                Text("Does Homebrew have all my apps?")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                case .doesItHaveAllTheApps:
                    VStack(alignment: .leading, spacing: headlineSubheadlineSpacing)
                    {
                        Text("Does Homebrew have all my apps?")
                            .font(.headline)
                        Text("Homebrew has a lot of apps, but not all of them.")
                        Text("If there's an app that Homebrew cannot find, you can add more apps by adding Taps.")
                        Text("Taps are sources of apps that Homebrew does not know about by default.")

                        Spacer()
                        
                        HStack
                        {
                            Button {
                                currentPage = .whyUseHomebrew
                            } label: {
                                Text("Back")
                            }
                            
                            Spacer()
                            
                            Button {
                                homebrewIntroductionStage = .installingHomebrew
                            } label: {
                                Text("Sounds good. Install Homebrew!")
                            }
                            .buttonStyle(.borderedProminent)

                        }
                    }
                }
            }
            .frame(width: 350, height: 170)
        }
    }
}
