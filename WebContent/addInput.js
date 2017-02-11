var counter=1;
function addInput(divName){
     
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Entry " + (counter + 1) + " <br><input type='text' name='myInputs'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     
}