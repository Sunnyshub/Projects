package com.example.myapplication

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import android.widget.ImageButton

class InternetRadio : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_internet_radio)


        val internetRadioTextView = findViewById<TextView>(R.id.textView2)
        internetRadioTextView.setOnClickListener {
            val internetRadioIntent = Intent(this, MainActivity::class.java)
            startActivity(internetRadioIntent)
        }


        val imageButtonRadio1 = findViewById<ImageButton>(R.id.imageButtonRadio1)

        imageButtonRadio1.setOnClickListener {
            val intent = Intent(this, RadioPlayerPage::class.java)
            startActivity(intent)
        }

        val imageButtonRadio2 = findViewById<ImageButton>(R.id.imageButton)

        imageButtonRadio2.setOnClickListener {
            val intent = Intent(this, RadioPlayerPage::class.java)
            startActivity(intent)
        }

    }




}