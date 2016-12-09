var ready = function() { $( function() {
    $('#edit').froalaEditor();
  });
}

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
