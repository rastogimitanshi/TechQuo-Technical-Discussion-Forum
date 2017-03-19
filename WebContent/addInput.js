var counter=1;
function addInput(divName){
     
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Enter value <br><input type='text' name='myInputs'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     
}