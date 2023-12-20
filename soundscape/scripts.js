let shakeAudio = new Audio('amogus.mp3');

function playAudio() {
    shakeAudio.play();
}

if (window.DeviceMotionEvent) {
    window.addEventListener('devicemotion', function (e) {
        let acceleration = e.accelerationIncludingGravity;

        let accelerationMagnitude = Math.sqrt(
            Math.pow(acceleration.x, 2) +
            Math.pow(acceleration.y, 2) +
            Math.pow(acceleration.z, 2)
        );

        let shakeThreshold = 15;

        if (accelerationMagnitude > shakeThreshold) {
            playAudio();
        }
    });
} else {
    console.log('Device Motion not supported.');
}