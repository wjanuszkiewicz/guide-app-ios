//
//  AuthButton.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 18.05.25.
//

import SwiftUI

struct AuthButton: View {
    let title: LocalizedStringKey
    let systemImage: String?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = systemImage {
                    Image(systemName: icon)
                        .font(.system(size: 17, weight: .medium))
                }

                Text(title)
                    .font(.system(size: 17, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
            .background(Color.black)
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


