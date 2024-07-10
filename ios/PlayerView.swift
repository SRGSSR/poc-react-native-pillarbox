//
//  PlayerView.swift
//  react-native-pillarbox
//
//  Created by Léon Chabbey on 10.07.2024.
//

import Foundation
import PillarboxPlayer
import PillarboxCoreBusiness
import SwiftUI

struct _PlayerView: View {
  @StateObject private var player = Player(item: .urn("urn:rts:video:15026576"))
  
  var body: some View {
    VideoView(player: player)
      .onAppear(perform: player.play)
      .ignoresSafeArea()
  }
}

@objc
public class PlayerView: NSObject {
  @objc
  public static func view() -> UIView {
    UIHostingController(rootView: _PlayerView()).view
  }
}
