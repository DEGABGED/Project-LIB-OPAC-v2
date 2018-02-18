$(document).ready(() => {
  // Instantiate some variables and objects
  const $dataTable = $('#dataTable');

  // Create helper functions
  function createRecord(data) {
    return "<tr><td>" + data.id +
      "</td><td><a href='#'>" + data.title +
      "</a></td><td>" + data.author +
      "</td><td>" + data.status +
      "</td></tr>";
  }

  // AJAX call for the index
  $.ajax({
    url: "http://localhost:3000/api/books/"
  }).then((data) => {
    $.each(data, (index, value) => {
      // Add data record to table
      $dataTable.append(createRecord(value));
      // Add on-click link to add data to modal
      $('#dataTable tr:last a').on('click', () => {
        $('#edit-book input[name=id]').val(value.id);
        $('#edit-book input[name=title]').val(value.title);
        $('#edit-book input[name=author]').val(value.author);
        $('#edit-book input[name=section]').val(value.section);
        $('#edit-book input[name=status]').val(value.status);
        $('#edit-book input[name=batch]').val(value.batch);
        $('#edit-book input[name=size]').val(value.size);
        $('#editModal').modal('show');
      });
    });
  });

  // Create form
  $('#create-book').submit((event) => {
    // Get form data
    var formdata = {
      'title': $('#create-book input[name=title]').val(),
      'author': $('#create-book input[name=author]').val(),
      'section': $('#create-book input[name=section]').val(),
      'status': $('#create-book input[name=status]').val(),
      'batch': $('#create-book input[name=batch]').val(),
      'size': $('#create-book input[name=size]').val()
    };

    // Send the form
    $.ajax({
      type: 'POST',
      url: 'http://localhost:3000/api/books/',
      data: formdata,
      dataType: 'json'
    }).done((data) => {
      // Remove modal and append new record to the table
      $('#createModal').modal('hide');
      $dataTable.append(createRecord(data));
      $('#dataTable tr:last a').on('click', () => {
        $('#edit-book input[name=id]').val(data.id);
        $('#edit-book input[name=title]').val(data.title);
        $('#edit-book input[name=author]').val(data.author);
        $('#edit-book input[name=section]').val(data.section);
        $('#edit-book input[name=status]').val(data.status);
        $('#edit-book input[name=batch]').val(data.batch);
        $('#edit-book input[name=size]').val(data.size);
        $('#editModal').modal('show');
      });
    }).fail((data, textStatus, xhr) => {
      // Backend validation
      alert(data.responseJSON.message);
    });

    // Prevent the default form submission
    event.preventDefault();
  });

  // Edit form
  $('#edit-book').submit((event) => {
    // Get form data
    var book_id = $('input[name=id]').val();
    var editdata = {
      'title': $('#edit-book input[name=title]').val(),
      'author': $('#edit-book input[name=author]').val(),
      'section': $('#edit-book input[name=section]').val(),
      'status': $('#edit-book input[name=status]').val(),
      'batch': $('#edit-book input[name=batch]').val(),
      'size': $('#edit-book input[name=size]').val()
    };

    console.log(editdata);

    // Send the form
    $.ajax({
      type: 'PUT',
      url: 'http://localhost:3000/api/books/' + book_id + '/',
      data: editdata,
      dataType: 'json'
    }).done((data) => {
      // Remove modal and append new record to the table
      $('#editModal').modal('hide');
      // Reload
      location.reload();
    }).fail((data, textStatus, xhr) => {
      // Backend validation
      alert(data.responseJSON.message);
    });

    // Prevent the default form submission
    event.preventDefault();
  });
});

/** LICENSE
  * This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
  */
