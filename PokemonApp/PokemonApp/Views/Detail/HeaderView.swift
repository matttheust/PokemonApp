//
//  HeaderView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    let imageURL: String?

    var body: some View {
        HStack {
            Text(name.capitalized)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Spacer()
            AsyncImage(url: URL(string: imageURL ?? "")) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFit()
                } else if phase.error != nil {
                    Image(systemName: "xmark.octagon").foregroundColor(.red)
                } else {
                    ProgressView()
                }
            }
            .frame(width: 100, height: 100)
        }
        .padding(.bottom, 8)
    }
}

struct InfoSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionTitle(title: title)
            content()
        }
    }
}

struct SectionTitle: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 16)
            .foregroundColor(.black)
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.bold)
            Text(value)
        }
        .padding(.leading, 8)
    }
}

struct TypeBadge: View {
    let typeName: String

    var body: some View {
        Text(typeName.capitalized)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
}
