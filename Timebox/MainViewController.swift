//
//  MainViewController.swift
//  Timebox
//
//  Created by Matt Swieboda on 06/23/21.
//  Copyright © 2021 Matt Swieboda. All rights reserved.
//

import AppKit

class MainViewController: NSViewController {
    override func viewDidAppear()
    {
        super.viewDidAppear()

        // You can use a notification and observe it in a view model where you want to fetch the data for your SwiftUI view every time the popover appears.
        // NotificationCenter.default.post(name: Notification.Name("ViewDidAppear"), object: nil)
    }
}
