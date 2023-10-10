package com.pillarbox

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.media3.common.Player
import ch.srgssr.pillarbox.core.business.DefaultPillarbox

class PillarboxFragment : Fragment() {

  private lateinit var player : Player

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
  }

}
