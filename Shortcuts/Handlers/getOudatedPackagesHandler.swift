//
//  getOudatedPackagesHandler.swift
//  Shortcuts
//
//  Created by David Bureš on 01.09.2023.
//

import Foundation

class GetOutdatedPackagesHandler: NSObject, GetOutdatedPackagesIntentHandling
{
    
    func handle(intent: GetOutdatedPackagesIntent) async -> GetOutdatedPackagesIntentResponse {
        
        CFURLStartAccessingSecurityScopedResource(AppConstants.brewExecutablePath as CFURL)
        
        guard let outdatedPackageNames: [String] = try? await getListOfAllUpgradeablePackageNames() else
        {
            return GetOutdatedPackagesIntentResponse.success(result: .init())
        }
        
        CFURLStopAccessingSecurityScopedResource(AppConstants.brewExecutablePath as CFURL)
        
        return GetOutdatedPackagesIntentResponse.success(result: outdatedPackageNames)
    }
}
