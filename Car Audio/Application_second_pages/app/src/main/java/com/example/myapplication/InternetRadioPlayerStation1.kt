package com.example.myapplication

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.media.AudioAttributes
import android.media.AudioManager
import android.media.MediaPlayer
import android.os.Bundle
import android.view.View
import android.widget.ImageButton
import android.widget.SeekBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import java.util.concurrent.TimeUnit

class RadioPlayerPage : AppCompatActivity() {

    private var mediaPlayer: MediaPlayer? = null
    private var seekBar: SeekBar? = null
    private var isUserSeeking = false
    private var timePassedTextView: TextView? = null
    private var totalLengthTextView: TextView? = null

    private lateinit var audioManager: AudioManager
    private val afChangeListener = AudioManager.OnAudioFocusChangeListener { focusChange ->
        when (focusChange) {
            AudioManager.AUDIOFOCUS_LOSS -> {
                mediaPlayer?.pause()
            }
            AudioManager.AUDIOFOCUS_GAIN -> {
                mediaPlayer?.start()
            }
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT -> {
                mediaPlayer?.pause()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_internet_radio_player_station1)

        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.INTERNET
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.INTERNET), REQUEST_CODE)
        }

        seekBar = findViewById(R.id.seekBar)
        seekBar?.progress = 0

        timePassedTextView = findViewById(R.id.timePassedTextView)
        totalLengthTextView = findViewById(R.id.totalLengthTextView)

        mediaPlayer = MediaPlayer()
        mediaPlayer?.setAudioAttributes(
            AudioAttributes.Builder()
                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .build()
        )

        audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager

        val result = audioManager.requestAudioFocus(
            afChangeListener,
            AudioManager.STREAM_MUSIC,
            AudioManager.AUDIOFOCUS_GAIN
        )

        if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) {
            val radioStreamUrl = "https://stream.slam.nl/web13_mp3?dist"
            try {
                mediaPlayer?.setDataSource(radioStreamUrl)
                mediaPlayer?.prepareAsync()
                mediaPlayer?.setOnPreparedListener { mp ->
                    mp.start()

                    seekBar?.max = mp.duration
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }

        val imgButton2 = findViewById<ImageButton>(R.id.albumArtImageView)
        imgButton2.setOnClickListener {
            mediaPlayer?.let {
                if (it.isPlaying) {
                    it.pause()
                } else {
                    it.start()
                }
            }
        }

        val imgButton = findViewById<ImageButton>(R.id.arrow_down_back)
        imgButton.setOnClickListener {
            stopMusic()
            val intent = Intent(this, InternetRadio::class.java)
            startActivity(intent)
        }

        seekBar?.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                if (fromUser) {
                    mediaPlayer?.seekTo(progress)
                }
            }

            override fun onStartTrackingTouch(seekBar: SeekBar?) {
                isUserSeeking = true
            }

            override fun onStopTrackingTouch(seekBar: SeekBar?) {
                isUserSeeking = false
            }
        })

        val updateSeekBar = object : Runnable {
            override fun run() {
                mediaPlayer?.let { player ->
                    if (!isUserSeeking && player.isPlaying) {
                        val currentPosition = player.currentPosition
                        seekBar?.progress = currentPosition
                        updateSongTime(currentPosition)
                    }
                }
                seekBar?.postDelayed(this, 1000)
            }
        }

        seekBar?.post(updateSeekBar)
    }

    private fun updateSongTime(currentPosition: Int) {
        val currentTimeFormatted = String.format(
            "%d:%02d",
            TimeUnit.MILLISECONDS.toMinutes(currentPosition.toLong()),
            TimeUnit.MILLISECONDS.toSeconds(currentPosition.toLong()) % 60
        )
        timePassedTextView?.text = currentTimeFormatted

        val totalTimeFormatted = String.format(
            "%d:%02d",
            TimeUnit.MILLISECONDS.toMinutes(mediaPlayer?.duration?.toLong() ?: 0),
            TimeUnit.MILLISECONDS.toSeconds(mediaPlayer?.duration?.toLong() ?: 0) % 60
        )
        totalLengthTextView?.text = totalTimeFormatted
    }

    private fun stopMusic() {
        mediaPlayer?.let {
            if (it.isPlaying) {
                it.stop()
                it.release()
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        audioManager.abandonAudioFocus(afChangeListener)

        mediaPlayer?.release()
        mediaPlayer = null
    }

    companion object {
        private const val REQUEST_CODE = 123
    }
}
