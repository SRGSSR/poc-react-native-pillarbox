package com.pillarbox

import android.view.View

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.PillarboxViewManagerDelegate
import com.facebook.react.viewmanagers.PillarboxViewManagerInterface

abstract class PillarboxViewManagerSpec<T : View> : SimpleViewManager<T>(), PillarboxViewManagerInterface<T> {
  private val mDelegate: ViewManagerDelegate<T>

  init {
    mDelegate = PillarboxViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<T>? {
    return mDelegate
  }
}
