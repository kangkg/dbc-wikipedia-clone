var ready = function() { $( function() {
    $('#edit').froalaEditor();
    console.log("hi");
  });
}

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
