
function clearSelected() {
    console.log("test");
    var filterButtons = document.getElementsByClassName("filterbtn");
    for (var i = 0; i < filterButtons.length; i++) {
        filterButtons[i].classList.remove("selected");
    }
}

function hideRows() {
    var bookingTableRows = document.getElementsByClassName("bookingTableRow");
    for (var i = 0; i < bookingTableRows.length; i++) {
        bookingTableRows[i].style.display = "none";
    }
}

function showRows(status) {
    var bookingTableRows = document.getElementsByClassName("bookingTableRow");
    for (var i = 0; i < bookingTableRows.length; i++) {
        if (bookingTableRows[i].cells[4].className === status) {
            bookingTableRows[i].style.display = "";
        }
    }
}

function showAllRows() {
    var bookingTableRows = document.getElementsByClassName("bookingTableRow");
    for (var i = 0; i < bookingTableRows.length; i++) {
        bookingTableRows[i].style.display = "";
    }
}

document.getElementById("allBookingsBtn").addEventListener("click", function(){
    console.log("test");
    clearSelected();
    showAllRows();
    document.getElementById('allBookingsBtn').className += " selected";
});

document.getElementById("activeBookingsBtn").addEventListener("click", function(){
    console.log("test");
    clearSelected();
    hideRows();
    showRows("active");
    document.getElementById('activeBookingsBtn').className += " selected";
});

document.getElementById("cancelledBookingsBtn").addEventListener("click", function(){
    console.log("test");
    clearSelected();
    hideRows();
    showRows("cancelled");
    document.getElementById('cancelledBookingsBtn').className += " selected";
});

document.getElementById("completedBookingsBtn").addEventListener("click", function(){
    console.log("test");
    clearSelected();
    hideRows();
    showRows("completed");
    document.getElementById('completedBookingsBtn').className += " selected";
});