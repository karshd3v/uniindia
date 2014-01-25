function selectMenu (name,id,idel){
    
    var categoryMenu                = document.getElementById(id);
    var categoryMenuOption          = document.createElement("option");
    categoryMenuOption.setAttribute("value","-1");
    categoryMenuOption.setAttribute("selected","selected");
    categoryMenuOption.innerHTML = "SELECT " + name;
    categoryMenu.insertBefore(categoryMenuOption,categoryMenu.firstChild);
    categoryMenu.setAttribute("id",idel);    
    categoryMenu.setAttribute("class","cd-select");
  }