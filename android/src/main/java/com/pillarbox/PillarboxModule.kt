package com.pillarbox

import android.util.Log
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.util.EventLogger
import ch.srgssr.pillarbox.core.business.DefaultPillarbox
import ch.srgssr.pillarbox.core.business.MediaItemUrn
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = PillarboxModule.NAME)
class PillarboxModule(reactContext: ReactApplicationContext) :
  NativePillarboxSpec(reactContext) {

  init {
    Log.d("Coucou", "Je suis là!")
    player = DefaultPillarbox(reactContext.applicationContext)
    player.addAnalyticsListener(EventLogger("Coucou"))
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

  companion object {
    const val NAME = "Pillarbox"
    lateinit var player: ExoPlayer
  }
}
