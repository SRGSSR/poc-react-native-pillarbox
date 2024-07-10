package com.pillarbox

import android.content.Context
import android.util.AttributeSet
import android.widget.FrameLayout
import androidx.annotation.OptIn
import androidx.media3.common.util.RepeatModeUtil
import androidx.media3.common.util.UnstableApi
import androidx.media3.ui.AspectRatioFrameLayout
import androidx.media3.ui.PlayerView
import ch.srgssr.pillarbox.core.business.DefaultPillarbox
import ch.srgssr.pillarbox.core.business.SRGMediaItemBuilder
import ch.srgssr.pillarbox.player.PillarboxExoPlayer

@OptIn(UnstableApi::class)
class PillarboxView : FrameLayout {
  constructor(context: Context) : super(context)
  constructor(context: Context, attrs: AttributeSet?) : super(context, attrs)
  constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(
    context,
    attrs,
    defStyleAttr
  )

  // IF done here, after each rotation, it will be recreated
  private lateinit var player: PillarboxExoPlayer
  private val playerView: PlayerView

  init {
    playerView = PlayerView(context)
    playerView.resizeMode = AspectRatioFrameLayout.RESIZE_MODE_FIT
    playerView.controllerAutoShow = true
    playerView.useController = true
    playerView.setRepeatToggleModes(RepeatModeUtil.REPEAT_TOGGLE_MODE_ONE)
    playerView.setShowSubtitleButton(true)
    playerView.setShowBuffering(PlayerView.SHOW_BUFFERING_WHEN_PLAYING)
    addView(playerView)
    playerView.showController()
  }

  override fun onAttachedToWindow() {
    super.onAttachedToWindow()
    player = DefaultPillarbox(context)
    player.setMediaItem(SRGMediaItemBuilder("urn:rts:video:14827306").build())
    player.prepare()
    player.play()

    playerView.player = player
  }

  override fun onDetachedFromWindow() {
    super.onDetachedFromWindow()
    playerView.player = null
    player.release()
  }
}
