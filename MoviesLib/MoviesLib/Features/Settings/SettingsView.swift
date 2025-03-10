//
//  SettingsView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

enum AppStorageKeys {
    static let color = "color"
    static let autoplay = "autoplay"
    static let category = "category"
}

struct SettingsView: View {
    @AppStorage(AppStorageKeys.color) private var color: Int = 0
    @AppStorage(AppStorageKeys.autoplay)  private var autoplay: Bool = false
    @AppStorage(AppStorageKeys.category)  private var category: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Esquema de cores") {
                    Picker("Qual a sua cor favorita?", selection: $color) {
                        Text("Azul")
                            .tag(0)
                        Text("Laranja")
                            .tag(1)
                        Text("Roxo")
                            .tag(2)
                    }
                    .pickerStyle(.segmented)
                }

                Section("Autoplay") {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Toggle("Tocar automaticamente", isOn: $autoplay)
                    }
                }

                Section("Categorias") {
                    TextField("Entre com sua categoria favorita", text: $category)

                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
