$(document).on('turbolinks:load', function() {
  $(".bubble").each( function() {
      if ( parseInt($(this).data("message-user2-id")) === $('[data-user-id]').data('user-id') ){
        $(this).addClass("bubble-primary");
        console.log($(this));
      } else {
        $(this).addClass("bubble-secondary");
      }
    }
  );
});
