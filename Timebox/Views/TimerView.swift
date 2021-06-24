//
//  TimerView.swift
//  Timebox
//
//  Created by Matt on 6/23/21.
//  Copyright © 2021 mswieboda. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @Binding var remainingTime: Int
    @Binding var countingDown: Bool

    var onEnded: (() -> Void)?

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(duration: Binding<Int>, onEnded: (() -> Void)?, start: Binding<Bool>) {
        self.onEnded = onEnded
        self._countingDown = start
        self._remainingTime = duration
    }
    
    var body: some View {
        Text("\(remainingTime) secs left...").onReceive(timer) {_ in
            if self.countingDown {
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.onTerminated()
                }
           }
       }
    }

    func onTerminated() {
        timer.upstream.connect().cancel()
        self.remainingTime = 0
        onEnded?()
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
