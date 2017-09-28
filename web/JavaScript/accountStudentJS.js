function editMode() {
    var editBkg = document.getElementById("editBkg");
    var editContent = document.getElementById("editContent");
    
    editBkg.style.opacity = "0.7";
    editBkg.style.zIndex = "5";
    editContent.style.opacity = "1";
    editContent.style.zIndex = "6";
}

function removeEditMode() {
    var editBkg = document.getElementById("editBkg");
    var editContent = document.getElementById("editContent");
    
    editBkg.style.opacity = "0";
    editBkg.style.zIndex = "-5";
    editContent.style.opacity = "0";
    editContent.style.zIndex = "-5";
}
