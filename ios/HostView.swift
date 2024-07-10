//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

import SwiftUI
import UIKit

/**
 *  Simple view hosting `SwiftUI` content.
 */
public class HostView<Content: View>: UIView {
    let ignoresSafeArea: Bool
    let topAnchorConstant: CGFloat
    let bottomAnchorConstant: CGFloat
    let leadingAnchorConstant: CGFloat
    let trailingAnchorConstant: CGFloat

    private var hostController: UIHostingController<Content>?

    public init(frame: CGRect, ignoresSafeArea: Bool = true, topAnchorConstant: CGFloat = 0, bottomAnchorConstant: CGFloat = 0, leadingAnchorConstant: CGFloat = 0, trailingAnchorConstant: CGFloat = 0) {
        self.ignoresSafeArea = ignoresSafeArea
        self.topAnchorConstant = topAnchorConstant
        self.bottomAnchorConstant = bottomAnchorConstant
        self.leadingAnchorConstant = leadingAnchorConstant
        self.trailingAnchorConstant = trailingAnchorConstant
        super.init(frame: frame)
    }

    override convenience init(frame: CGRect) {
        self.init(frame: frame, ignoresSafeArea: true)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update(with content: Content?) {
        if let rootView = content {
            if let hostController {
                hostController.rootView = rootView
            } else {
                hostController = UIHostingController(rootView: rootView)
            }

            if let hostView = hostController?.view, hostView.superview != self {
                hostView.backgroundColor = .clear
                addSubview(hostView)

                hostView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    hostView.topAnchor.constraint(equalTo: topAnchor, constant: topAnchorConstant),
                    hostView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant),
                    hostView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingAnchorConstant),
                    hostView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingAnchorConstant)
                ])
            }
        } else if let hostView = hostController?.view {
            hostView.removeFromSuperview()
        }
    }

    var content: Content? {
        didSet {
            update(with: content)
        }
    }
}
