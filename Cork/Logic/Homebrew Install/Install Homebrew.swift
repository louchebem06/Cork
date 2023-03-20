//
//  Install Homebrew.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import Foundation

enum HomebrewInstallationError: Error
{
    case couldNotDownloadInstallScript
}

/// What this function has to do:
/// 1. Download the installer script into a temporary directory
/// 2. Execute that script in the real-time shell function and monitor for the various output

@MainActor
func installHomebrew(installationProgressTracker _: HomebrewInstallationProgressTracker) async throws
{
    print("Will now execute install function")

    /// Here, we have to download the install script separately because it will complain if we just use the one-command solution
    print("Temp directory path: \(AppConstants.tempDirectoryPath)")
    /// Declare the subdirectory of Cork in the temporary folder
    let installerTempFolder: URL = AppConstants.tempDirectoryPath.appendingPathComponent("Cork", conformingTo: .directory)
    /// Create that temporary folder if it doesn't exist already
    if !FileManager.default.fileExists(atPath: installerTempFolder.path)
    {
        print("Temp folder doesn't exist, creating it...")
        try FileManager.default.createDirectory(at: installerTempFolder, withIntermediateDirectories: true)
    }

    let installScriptPath: String = installerTempFolder.appendingPathComponent("brewInstaller.sh", conformingTo: .shellScript).path
    /// Download the install script
    let installScriptDownloadOutput: TerminalOutput = await shell("/usr/bin/curl", ["https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh", "--output", "\(installScriptPath)"])

    print("Installer download result: \(installScriptDownloadOutput)")

    /// Start the installer itself
    for await output in shell("/bin/bash", ["\(installScriptPath)"], environment: ["CI": "1"])
    {
        switch output
        {
        case let .standardOutput(outputLine):
            print("Installer output: \(outputLine)")

        case let .standardError(errorLine):
            print("Installer error: \(errorLine)")
        }
    }
}
