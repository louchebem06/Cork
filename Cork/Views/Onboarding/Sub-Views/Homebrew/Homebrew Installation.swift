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
                VStack(alignment: .center, spacing: 15)
                {
                    Text("Before we get started, here's an outline of what we're gonna do")
                        .font(.subheadline)
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 7)
                        {
                            Image(systemName: "1.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            VStack(alignment: .leading, spacing: 5)
                            {
                                Text("In order to install Homebrew, you will need to put in your password into a dialog that will show up when you press the install button below.")
                                Text("Don't worry, this is just to tell macOS you want to install something that's not a traditional app. Cork will not see the password.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack(alignment: .top, spacing: 7)
                        {
                            Image(systemName: "2.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            VStack(alignment: .leading, spacing: 5)
                            {
                                Text("The installation process will start. It should only take a few minutes, and you will know exactly what it's doing.")
                            }
                        }
                        HStack(alignment: .top, spacing: 7)
                        {
                            Image(systemName: "3.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            VStack(alignment: .leading, spacing: 5)
                            {
                                Text("After Homebrew is installed, Cork will restart and you can start using it!")
                            }
                        }
                    }

                    Button
                    {
                        installationStage = .installing
                    } label: {
                        Text("Install Homebrew")
                    }
                    .keyboardShortcut(.defaultAction)
                }
                .frame(width: 350)
                .fixedSize()

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
        .fixedSize()
    }
}
