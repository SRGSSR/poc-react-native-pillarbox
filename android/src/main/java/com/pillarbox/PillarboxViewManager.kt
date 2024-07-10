package com.pillarbox

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = PillarboxViewManager.NAME)
class PillarboxViewManager :
  PillarboxViewManagerSpec<PillarboxView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): PillarboxView {
    return PillarboxView(context)
  }

  override fun play(view: PillarboxView?) {
    view?.play()
  }

  @ReactProp(name = "color")
  override fun setColor(view: PillarboxView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "PillarboxView"
  }
}
