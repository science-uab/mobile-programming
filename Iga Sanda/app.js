
// Author: Iga (Voronianu) Sanda <vorosanda@gmail.com> 
// MIT License 
 
 
 // Instantiating the shake lib 
 var myShakeEvent = new Shake({ 
     threshold: 1 // shake strength threshold 
 }); 
 
 
 // Getting DOM 
 var counterElem = document.getElementById('steps-counter'); 
 var infoBox = document.getElementById('info-box'); 
 
 
 myShakeEvent.start(); 
 
 
 window.addEventListener('shake', shakeEventDidOccur, false); 
 
 
 //function to call when shake occurs 
 function shakeEventDidOccur () { 
     var previousSteps = parseInt(counterElem.innerHTML); 
     var currentSteps = previousSteps + 1; 
     counterElem.innerHTML = currentSteps.toString(); 
 } 
 
 
 // Called when the reset button is pressed 
 function resetSteps() { 
     console.log('reseted'); 
     var steps = 0; 
     counterElem.innerHTML = steps.toString(); 
     updateStatus('Steps counter reset'); 
 } 
 
 
 // Called when the start button is press 
 function startSteps() { 
    myShakeEvent.start(); 
     updateStatus('Steps counter started. Counting steps.'); 
 } 
 
 
 // Called when the stop button is pressed 
 function stopSteps() { 
     myShakeEvent.stop(); 
     updateStatus('Steps counter stopped. Not counting steps anymore'); 
 } 
 
 
 // Called in every button press function to update the message box 
 function updateStatus(message) { 
     infoBox.style.display = 'block'; 
     infoBox.innerText = message; 
     setTimeout(function(){ 
         infoBox.style.display= 'none'; 
     }, 3000); 
 } 
