//
//  EmailAuthView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI

struct EmailAuthView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("auth_email") // локализованный заголовок

            Button("auth_back") {
                dismiss()
            }
        }
        .padding()
    }
}

