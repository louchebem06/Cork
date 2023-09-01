//
//  IntentHandler.swift
//  Shortcuts
//
//  Created by David Bureš on 01.09.2023.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        switch intent
        {
            case is GetOutdatedPackagesIntent:
                return GetOutdatedPackagesHandler()
            default:
                fatalError("No handler for this intent")
        }
    }
    
}
