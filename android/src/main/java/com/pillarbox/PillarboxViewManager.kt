package com.pillarbox

import androidx.media3.common.Player
import androidx.media3.ui.PlayerView
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

class PillarboxViewManager : SimpleViewManager<PlayerView>() {
  override fun getName(): String {
      return NAME
  }

  override fun createViewInstance(contextReact: ThemedReactContext): PlayerView {
    val view = PlayerView(contextReact)
    view.player = PillarboxModule.player
    return view
  }

  override fun onDropViewInstance(view: PlayerView) {
    super.onDropViewInstance(view)
    view.player = null
  }

  companion object{
    const val NAME = "PillarboxReactView"
  }
}
