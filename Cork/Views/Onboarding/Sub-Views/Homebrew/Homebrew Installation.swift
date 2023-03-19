//
//  Homebrew Installation.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

private enum HomebrewInstallationStage
{
    case explanation, installing
}

struct HomebrewInstallation: View
{
    @State private var installationStage: HomebrewInstallationStage = .explanation

    var body: some View
    {
        VStack(spacing: 15)
        {
            Text("Homebrew Installation")
                .font(.title)

            switch installationStage
            {
            case .explanation:
                Text("Some explanations")
                
                VStack(alignment: .center)
                {
                    Button
                    {
                        installationStage = .installing
                    } label: {
                        Text("Install Homebrew")
                    }
                    .keyboardShortcut(.defaultAction)
                }

            case .installing:
                Text("Some text")
                    .task
                    {
                        for await output in shell("/usr/bin/sudo", ["su"])
                        {
                            switch output
                            {
                            case let .standardOutput(outputLine):
                                print("Output line: \(outputLine)")

                            case let .standardError(errorLine):
                                print("Error line: \(errorLine)")
                            }
                        }
                    }
            }
        }
    }
}
