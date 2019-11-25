//
//  AppDelegate.swift
//  Overlay Test
//
//  Created by Marco Masser on 2015-09-19.
//  Copyright © 2015 Objective Development Software GmbH. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var visualEffectView: NSVisualEffectView!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.isMovableByWindowBackground = true
        visualEffectView.maskImage = _maskImage(cornerRadius: 20.0)
        visualEffectView.state = .active
        visualEffectView.material = .dark
    }

    private func _maskImage(cornerRadius: CGFloat) -> NSImage {
        let edgeLength = 2.0 * cornerRadius + 1.0
        let maskImage = NSImage(size: NSSize(width: edgeLength, height: edgeLength), flipped: false) { rect in
            let bezierPath = NSBezierPath(roundedRect: rect, xRadius: cornerRadius, yRadius: cornerRadius)
            NSColor.black.set()
            bezierPath.fill()
            return true
        }
        maskImage.capInsets = NSEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
        maskImage.resizingMode = .stretch
        return maskImage
    }

}

