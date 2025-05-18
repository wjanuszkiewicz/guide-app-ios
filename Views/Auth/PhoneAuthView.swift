//
//  PhoneAuthView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI

struct PhoneAuthView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("auth_phone")

            Button("auth_back") {
                dismiss()
            }
        }
        .padding()
    }
}

