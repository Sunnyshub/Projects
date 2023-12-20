package com.example.myapplication

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageButton
import android.widget.ImageView
import android.widget.TextView
class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val imgButton = findViewById<ImageButton>(R.id.imageButton)
        imgButton.setOnClickListener {
            val intent = Intent(this, PlayerPage::class.java)
            startActivity(intent)
        }

        val imgButton2 = findViewById<ImageView>(R.id.imageView)
        imgButton2.setOnClickListener {
            val intent = Intent(this, PlayerPage2::class.java)
            startActivity(intent)
        }

        val internetRadioTextView = findViewById<TextView>(R.id.textView4)
        internetRadioTextView.setOnClickListener {
            val internetRadioIntent = Intent(this, InternetRadio::class.java)
            startActivity(internetRadioIntent)
        }


    }
}
