$(function() {
  
  var handlers = {
    container: $("#contacts").find('tbody'),
    
    //LIST ALL HANDLERS
    getContacts: function() {
      handlers.container.empty();
      $.getJSON("/contacts", handlers.receiveContacts); //handlers.receiveContacts is run as success callback
    },

    receiveContacts: function(contacts) {
      contacts.forEach(handlers.addContact);
    },

    addContact: function(contact) {
      var tr = $("<tr>").appendTo(handlers.container);
      $("<td contentEditable='false'>").text(contact.name).appendTo(tr);
      $("<td contentEditable='false'>").text(contact.email).appendTo(tr);
      $("<td contentEditable='false'>").text(contact.address).appendTo(tr);
      $("<td contentEditable='false'>").text(contact.phone).appendTo(tr);
      $("<td contentEditable='false'>").append("<button class='delete_contact'>Delete</button>").append("<button class='update_contact'>Update</button>").appendTo(tr);
    },

    //SEARCH HANDLERS
    searchGetContacts: function() {
      
      $.getJSON("/contacts", searchReceiveContacts); //handlers.receiveContacts is run as success callback
      
      function searchReceiveContacts(contacts) {
        handlers.container.empty();
        contacts.forEach(searchAddContact); // TODO: Use javascript's forEach instead of $.each
      };

      function searchAddContact(contact) {
        var tr = $("<tr>").appendTo(handlers.container);
        var search_val = $("#search_contact").val();
        var myExp = new RegExp(search_val, "i");
        // TODO: Either make Sinatra search for you (create /search action)
        //       OR keep a copy of all contacts in the browser, and **dont't** make an AJAX request when a user searches.
        if ((contact.name.search(myExp) != -1) || (contact.email.search(myExp) != -1) || (contact.phone.search(myExp) != -1)) {
          $("<td contentEditable='false'>").text(contact.name).appendTo(tr);
          $("<td contentEditable='false'>").text(contact.email).appendTo(tr);
          $("<td contentEditable='false'>").text(contact.address).appendTo(tr);
          $("<td contentEditable='false'>").text(contact.phone).appendTo(tr);
          $("<td contentEditable='false'>").append("<button class='delete_contact'>Delete</button>").append("<button class='update_contact'>Update</button>").appendTo(tr);
        };
      };
    },
    
    //NEW HANDLERS
    newDefineContact: function(e) {
      e.preventDefault()
      var name = $("#name").val();
      var email = $("#email").val();
      var address = $("#address").val();
      var phone = $("#phone").val();
      var contact = {name: name, email: email, address: address, phone: phone};

      $.post("/new_contact", contact, function(data) { 

        if (data.result) {
          handlers.addContact(contact);
          $('#new_contact_form')[0].reset();
        } else {
          alert("Unable to create contact.");
        }
      }, 'json');
    },

    deleteContact: function(e) {
      var email = $(this).closest('tr').children('td:nth-child(2)').text();
      var row = $(this).closest('tr')
      
      $.ajax({
        url: '/contact/' + email,
        method: 'delete',
        accepts: 'application/json',
        success: function (data){
          data = JSON.parse(data)
          if (data.result) {
            $(row).remove();
          } else {
            alert("Unable to create contact.");
          }
        }
      })
    },

    // updateContact: function(e) {
    //   value = $(this).closest('tr');
    //   value.find('td').attr('contentEditable',true).addClass('done');
    //   value.find('.update_contact').text('save')
    //   $('.done').on('click', function(){
    //     console.log("hello")
    //   })



    //   // if (value == 'false') {
    //   //   $(this).closest('tr').children('td:nth-child(1)').attr('contenteditable','true');
    //   //   $(this).closest('tr').children('td:nth-child(2)').attr('contenteditable','true');
    //   //   $(this).closest('tr').children('td:nth-child(3)').attr('contenteditable','true');
    //   //   $(this).closest('tr').children('td:nth-child(4)').attr('contenteditable','true');
    //   // }
    //   // else {
    //   //   $(this).closest('tr').children('td:nth-child(1)').attr('contenteditable','false');
    //   //   $(this).closest('tr').children('td:nth-child(2)').attr('contenteditable','false');
    //   //   $(this).closest('tr').children('td:nth-child(3)').attr('contenteditable','false');
    //   //   $(this).closest('tr').children('td:nth-child(4)').attr('contenteditable','false');
    // // }
    // }
      

 
  };


  $(document).on('click', '.delete_contact', handlers.deleteContact); 
  // $(document).on('click', '.update_contact', handlers.updateContact); 
  $("#load_contacts").on('click', handlers.getContacts);
  $('#search_contact').on('keyup', handlers.searchGetContacts);
  $('#new_contact_form').on('submit', handlers.newDefineContact);

 
  }); 

