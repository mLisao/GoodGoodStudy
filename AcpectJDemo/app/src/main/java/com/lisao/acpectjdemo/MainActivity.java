package com.lisao.acpectjdemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.lisao.acpectjlib.BehaviorTrace;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button button1;
    private Button button2;
    private Button button3;
    private Button button4;

    private static final String behaviorOne = "摇一摇";
    private static final String behaviorTwo = "朋友圈";
    private static final String behaviorThree = "语音通话";
    private static final String behaviorFour = "视频通话";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        button1 = (Button) findViewById(R.id.button1);
        button2 = (Button) findViewById(R.id.button2);
        button3 = (Button) findViewById(R.id.button3);
        button4 = (Button) findViewById(R.id.button4);

        button1.setOnClickListener(this);
        button2.setOnClickListener(this);
        button3.setOnClickListener(this);
        button4.setOnClickListener(this);
    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.button1:
                behaviorOne();
                break;
            case R.id.button2:
                behaviorTwo();
                break;
            case R.id.button3:
                behaviorThree();
                break;
            case R.id.button4:
                behaviorFour();
                break;
        }
    }

    @BehaviorTrace(behaviorOne)
    private void behaviorOne() {
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Toast.makeText(this, "behaviorOne", Toast.LENGTH_LONG).show();
    }

    @BehaviorTrace(behaviorTwo)
    private void behaviorTwo() {
        Toast.makeText(this, "behaviorTwo", Toast.LENGTH_LONG).show();
    }

    @BehaviorTrace(behaviorThree)
    private void behaviorThree() {
        Toast.makeText(this, "behaviorThree", Toast.LENGTH_LONG).show();
    }

    @BehaviorTrace(behaviorFour)
    private void behaviorFour() {
        Toast.makeText(this, "behaviorFour", Toast.LENGTH_LONG).show();
    }
}
