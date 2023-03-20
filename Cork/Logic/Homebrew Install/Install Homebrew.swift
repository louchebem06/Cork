//
//  Install Homebrew.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import Foundation

enum HomebrewInstallationError: Error
{
    case idk
}

@MainActor
func installHomebrew(installationProgressTracker: HomebrewInstallationProgressTracker) async throws -> Void
{
    
    for await output in shell("/opt/homebrew/bin/bash", ["-c", "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"], environment: ["CI": "1"])
    {
        switch output
        {
            case let .standardOutput(outputLine):
                print("Homebrew install output: \(outputLine)")
            case let .standardError(errorLine):
                print("Homebrew install error: \(errorLine)")
        }
    }
}
