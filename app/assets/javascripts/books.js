//= require jquery3

$(document).ready(() => {
  $("#createModal").on("ajax:success", (e, data, status, xhr) => {
    location.reload();
  }).on("ajax:error", (e, xhr, status, error) => {
    msg = JSON.parse(e.originalEvent.detail[0]);
    console.log(msg);
    alert_msg = "";
    for(i in msg) {
      alert_msg += (i + " " + msg[i][0] + "\n");
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
      alert_msg += (i + " " + msg[i][0] + "\n");
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
      alert_msg += (i + " " + msg[i][0] + "\n");
    }
    alert(alert_msg);
  });
});
