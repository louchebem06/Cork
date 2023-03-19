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
            Image(systemName: "cup.and.saucer")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.blue)
            
            VStack(alignment: .center, spacing: 5) {
                Text("Homebrew Installation")
                    .font(.title)
                Text("Here's what we're gonna do")
                    .font(.subheadline)
            }

            switch installationStage
            {
            case .explanation:
                VStack(alignment: .center, spacing: 15)
                {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 7)
                        {
                            Image(systemName: "1.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                            VStack(alignment: .leading, spacing: 5)
                            {
                                Text("When you press the Install button, macOS will ask for your password to approve the installation.")
                                Text("Don't worry, Cork doesn't see your password")
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
