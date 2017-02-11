var counter=1;
function addEducation(divName){
     
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Entry " + (counter + 1) + " <br><input type='text' name='myEducation'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     
}