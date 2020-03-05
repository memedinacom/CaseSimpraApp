//
//  SimpraNotify.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 5.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import SwiftEntryKit
import UIKit

class SimpraNotify{
    // MARK: - Singleton - Notification alert class
    
    class var shared: SimpraNotify {
        struct Static {
            static let instance: SimpraNotify = SimpraNotify()
        }
        return Static.instance
    }
    
    // Mark: - Present Notificaiton on top from view
    static func presentTopFloat(title: String? = "", description: String, image: UIImage?, color: UIColor? = .greenToast) {
        var attributes = EKAttributes.topNote
        self.setupAttribute(attributes: &attributes, color: EKColor(color!))
        let contentView = self.createNotification(title: title!,
                                                  description: description,
                                                  image: nil)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    static func setupAttribute(attributes: inout EKAttributes, color: EKColor) {
        attributes.entryBackground = .color(color: color)
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        
        attributes.displayDuration = 5
        attributes.statusBar = .currentStatusBar
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.maxSize = .init(width: .intrinsic, height: .intrinsic)
        attributes.screenInteraction = .dismiss
    }
    static func createNotification(title: String, description: String, image: UIImage?)-> EKNotificationMessageView {
        let simpleMessage = createSimpleMessage(title: title, description: description, image: image)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        return EKNotificationMessageView(with: notificationMessage)
    }
    
    static func createSimpleMessage(title: String, description: String, image: UIImage?) -> EKSimpleMessage {
        let title = EKProperty.LabelContent(text: title, style: .init(font: .preferredFont(forTextStyle: .headline), color: .white))
        var description = EKProperty.LabelContent(text: description, style: .init(font: .preferredFont(forTextStyle: .body), color: .white))
        description.style.alignment = NSTextAlignment.center
        
        
        if let image = image {
            let imageContent = EKProperty.ImageContent(image: image, size: CGSize(width: 16, height: 20))
            return EKSimpleMessage(image: imageContent, title: title, description: description)
        }
        return EKSimpleMessage(image: nil, title: title, description: description)
    }
}

