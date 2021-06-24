//
//  ContentView.swift
//  Timebox
//
//  Created by Matt Swieboda on 06/23/21.
//  Copyright © 2021 Matt Swieboda. All rights reserved.
//

import SwiftUI
import AppKit

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Timebox")
                .font(Font.system(size: 33.0))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 13.0)
                .padding(.vertical, 13.0)
                .frame(width: 360.0, height: 320.0, alignment: .topLeading)
            HStack {
                Text("15min")
                Text("30min")
                Text("1hr")
            }
            Button(action: {
                NSApplication.shared.terminate(self)
            }) {
                Text("Quit")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.trailing, 13.0)
            .frame(width: 360.0, alignment: .trailing)
        }
        .padding(0)
        .frame(width: 360.0, height: 360.0, alignment: .top)
    }
}

// NOTE: Preview not working with my crappy Macbook Air, but might be unrelated
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
