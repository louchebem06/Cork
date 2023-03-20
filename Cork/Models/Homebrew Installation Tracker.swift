//
//  Homebrew Installation Tracker.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import Foundation

class HomebrewInstallationProgressTracker: ObservableObject
{
    @Published var installationStage: HomebrewInstallationStage = .explanation
    @Published var installationStep: HomebrewInstallationStep = .ready
    @Published var installationProgressNumer: Double = 0
}
