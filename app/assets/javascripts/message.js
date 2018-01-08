$(function(){
  function buildHTML(message){
    var addimage = "";
    if (message.image){
      addimage = `<img src="${ message.image }">`;
    }
    var html = `<div class="message">
                  <span class="username">
                    ${ message.name }
                  </span>
                  <span class="time">
                    ${ message.time }
                  </span>
                  <div class="chat-main__message-body">
                    ${ message.body }
                    ${ addimage }
                  </div>
                </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main__message').append(html);
      $('.chat-main__message').animate({scrollTop: $('.chat-main__message')[0].scrollHeight}, 'fast');
      $('.text').val('');
    })
    .fail(function(){
      alert('error');
    })
    return false;
  })
});