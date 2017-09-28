
document.getElementById("userType").addEventListener("change", function(){
    var select = document.getElementById('userType');
    var currentOption = select.options[select.selectedIndex];
    console.log(currentOption.value);
    if (currentOption.value === "Student") {
        document.getElementById("subject").style.visibility = "hidden";
        document.getElementById("subjectlabel").style.visibility = "hidden";
    } else {
        document.getElementById("subject").style.visibility = "visible";
        document.getElementById("subjectlabel").style.visibility = "visible";
    }
});


//
//function createBooking(id) {
//    var tableRow = document.getElementById(id);
//    for (var i = 0, len = tableRow.cells.length; i < len; i++) {
//        if (tableRow.cells[i].className == "tutorEmail") {
//            window.location.replace("createBooking.jsp")
//        }
//    }
//    
//}