package com.example.myapplication

import android.content.Intent
import android.media.MediaPlayer
import android.os.Bundle
import android.speech.RecognizerIntent
import android.view.GestureDetector
import android.view.MotionEvent
import android.widget.ImageButton
import android.widget.SeekBar
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import java.util.Locale
import java.util.Objects
import java.util.concurrent.TimeUnit
import kotlin.math.abs

class PlayerPage2_weeknd_2 : AppCompatActivity() {

    private var mediaPlayer: MediaPlayer? = null
    private lateinit var gestureDetector: GestureDetector
    private var seekBar: SeekBar? = null
    private var isUserSeeking = false
    private var timePassedTextView: TextView? = null
    private var totalLengthTextView: TextView? = null
    private var isImage1 = true
    private val REQUEST_CODE_SPEECH_INPUT = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_player_page2_weeknd2)

        val voiceRecognitionButton = findViewById<ImageButton>(R.id.voiceRecognitionButton)
        voiceRecognitionButton.setOnClickListener {
            val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
            intent.putExtra(
                RecognizerIntent.EXTRA_LANGUAGE_MODEL,
                RecognizerIntent.LANGUAGE_MODEL_FREE_FORM
            )
            intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault())
            intent.putExtra(RecognizerIntent.EXTRA_PROMPT, "Listening")

            try {
                startActivityForResult(intent, REQUEST_CODE_SPEECH_INPUT)
            } catch (e: Exception) {
                Toast.makeText(this, "" + e.message, Toast.LENGTH_LONG).show()
            }
        }

        val imageButton: ImageButton = findViewById(R.id.imageButton2)
        imageButton.setOnClickListener {
            if (isImage1) {
                imageButton.setImageResource(R.drawable.baseline_shuffle_24)
            } else {
                imageButton.setImageResource(R.drawable.baseline_repeat_24)
            }
            isImage1 = !isImage1
        }

        mediaPlayer = MediaPlayer.create(this, R.raw.weeknd_breath)
        gestureDetector = GestureDetector(this, MyGestureListener())

        seekBar = findViewById(R.id.seekBar)
        seekBar?.progress = 0
        mediaPlayer?.let {
            seekBar?.max = it.duration
            it.start()
        }

        val imgButton2 = findViewById<ImageButton>(R.id.albumArtImageView2)
        imgButton2.setOnClickListener {
            mediaPlayer?.let {
                if (!it.isPlaying) {
                    it.start()
                } else {
                    it.pause()
                }
            }
        }

        val imgButton = findViewById<ImageButton>(R.id.arrow_down_back)
        imgButton.setOnClickListener {
            stopMusic()
            val intent = Intent(this, MainActivity::class.java)
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

        timePassedTextView = findViewById(R.id.timePassedTextView2)
        totalLengthTextView = findViewById(R.id.totalLengthTextView2)

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
                it.prepare()
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        mediaPlayer?.release()
        mediaPlayer = null
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        return gestureDetector.onTouchEvent(event) || super.onTouchEvent(event)
    }

    private inner class MyGestureListener : GestureDetector.SimpleOnGestureListener() {
        private val SWIPE_THRESHOLD = 100
        private val SWIPE_VELOCITY_THRESHOLD = 100

        override fun onFling(
            downEvent: MotionEvent,
            moveEvent: MotionEvent,
            velocityX: Float,
            velocityY: Float
        ): Boolean {
            try {
                val diffY = moveEvent.y - downEvent.y
                val diffX = moveEvent.x - downEvent.x

                if (abs(diffX) > abs(diffY) &&
                    abs(diffX) > SWIPE_THRESHOLD &&
                    abs(velocityX) > SWIPE_VELOCITY_THRESHOLD
                ) {
                    stopMusic()
                    startActivity(Intent(this@PlayerPage2_weeknd_2, PlayerPage2::class.java))
                    return true
                }
            } catch (exception: Exception) {
                exception.printStackTrace()
            }
            return false
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == REQUEST_CODE_SPEECH_INPUT) {
            if (resultCode == RESULT_OK && data != null) {
                val res: ArrayList<String> =
                    data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS) as ArrayList<String>
                val tvtext = findViewById<TextView>(R.id.tvtext)

                tvtext.text = Objects.requireNonNull(res)[0]
            }
        }
    }
}
