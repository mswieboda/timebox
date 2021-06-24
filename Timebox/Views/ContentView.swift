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
    @State var duration = 5
    @State private var timerStart: Bool = false
    @State private var isTerminated: Bool = true

    var body: some View {
        VStack {
            if self.isTerminated {
                HStack {
                    Button(action: {
                        startTimer(duration: 7)
                    }) {
                        Text("7sec")
                    }
                    Button(action: {
                        startTimer(duration: 5 * 60)
                    }) {
                        Text("5min")
                    }
                    Button(action: {
                        startTimer(duration: 15 * 60)
                    }) {
                        Text("15min")
                    }
                    Button(action: {
                        startTimer(duration: 30 * 60)
                    }) {
                        Text("30min")
                    }
                    Button(action: {
                        startTimer(duration: 1 * 60 * 60)
                    }) {
                        Text("1hr")
                    }
                }
            } else {
                TimerView(duration: $duration, onEnded: timerTerminated, start: $timerStart)
            }
        }
    }
    
    private func startTimer(duration: Int) {
        print(">>> startTimer duration: \(duration)")
        self.duration = duration
        timerStart = true
        isTerminated = false
    }
    
    private func timerTerminated() {
        print(">>> timerTerminated")
        isTerminated = true
        
        showAlert()
    }
    
    func showAlert() {
        let alert = NSAlert()
        alert.messageText = "Timeboxing is over!"
        alert.runModal()
    }
}

// NOTE: Preview not working with my crappy Macbook Air, but might be unrelated
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
