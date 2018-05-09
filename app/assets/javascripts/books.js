//= require jquery3

String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

$(document).ready(() => {
  $("#createModal").on("ajax:success", (e, data, status, xhr) => {
    location.reload();
  }).on("ajax:error", (e, xhr, status, error) => {
    msg = JSON.parse(e.originalEvent.detail[0]);
    console.log(msg);
    alert_msg = "";
    for(i in msg) {
      alert_msg += ((i.localeCompare("base") ? i.capitalize() + " " : "") + msg[i][0] + "\n");
    }
    alert(alert_msg);
  });

  $("#editModal").on("ajax:success", (e, data, status, xhr) => {
    location.reload();
  }).on("ajax:error", (e, xhr, status, error) => {
    msg = JSON.parse(e.originalEvent.detail[0]);
    console.log(msg);
    alert_msg = "";
    for(i in msg) {
      //alert_msg += (i + " " + msg[i][0] + "\n");
      alert_msg += ((i.localeCompare("base") ? i.capitalize() + " " : "") + msg[i][0] + "\n");
    }
    alert(alert_msg);
  });

  $("#deleteButton").on("ajax:success", (e, data, status, xhr) => {
    location.reload();
  }).on("ajax:error", (e, xhr, status, error) => {
    msg = JSON.parse(e.originalEvent.detail[0]);
    console.log(msg);
    alert_msg = "";
    for(i in msg) {
      alert_msg += ((i.localeCompare("base") ? i.capitalize() + " " : "") + msg[i][0] + "\n");
    }
    alert(alert_msg);
  });
});

// Author: Nicko Pangurungan
// This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.

// Code History:
// Nicko Pangurungan
// 02/23/18
// Sprint 2

// Comments
// 02/23/18
// Group 3
// Recoletas Chapel
//

