package com.pillarbox

import android.view.View
import androidx.media3.common.Player
import ch.srgssr.pillarbox.core.business.DefaultPillarbox
import ch.srgssr.pillarbox.core.business.MediaItemUrn
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = PillarboxModule.NAME)
class PillarboxModule(reactContext: ReactApplicationContext) :
  NativePillarboxSpec(reactContext) {

  init {
    player = DefaultPillarbox(reactContext.applicationContext)
    play()
  }

  fun play(urn: String = "urn:rts:video:6820736", position: Long = 0) {
    player.seekTo(position)
    player.prepare()
    player.setMediaItem(MediaItemUrn(urn))
    player.play()
  }

  fun seekTo(position: Long) {
    player.seekTo(position)
  }

  fun resume() {
    player.play()
  }

  fun pause() {
    player.pause()
  }

  fun stop() {
    player.stop()
  }

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  override fun multiply(a: Double, b: Double): Double {
    return a * b + 1
  }



  companion object {
    const val NAME = "Pillarbox"
    lateinit var player: Player
  }
}
