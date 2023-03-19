//
//  Feature Row.swift
//  Cork
//
//  Created by David Bureš on 19.03.2023.
//

import SwiftUI

struct FeatureRow: View
{
    @State var iconName: String
    @State var iconColor: Color
    
    @State var headline: String
    @State var subheadline: String

    var body: some View
    {
        GridRow(alignment: .top)
        {
            HStack
            {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(iconColor)

                VStack(alignment: .leading)
                {
                    Text(headline)
                        .font(.headline)

                    Text(subheadline)
                        .font(.subheadline)
                }
            }
        }
    }
}
