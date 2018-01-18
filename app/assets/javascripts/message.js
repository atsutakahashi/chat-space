// $(document).on('turbolinks:load', function() {
// $(function(){
//   function buildHTML(message){
//     var addimage = "";
//     if (message.image){
//       addimage = '<img src="'+ message.image +'">';
//     }
//     var html = '<div class="message" data-message-id = ${message.id}>'
//                   <span class="username">
//                     ${ message.name }
//                   </span>
//                   <span class="time">
//                     ${ message.time }
//                   </span>
//                   <div class="chat-main__message-body">
//                     ${ message.body }
//                     ${ addimage }
//                   </div>
//                 </div>
//     return html;
//   }

//   $('#new_message').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.chat-main__message').append(html);
//       $('.chat-main__message').animate({scrollTop: $('.chat-main__message')[0].scrollHeight}, 'fast');
//       $('.text').val('');
//     })
//     .fail(function(){
//       alert('error');
//     })
//     return false;
//   });

//   setInterval(function(){
//     if (window.location.href.match(/\/groups\/\d+\/messages/)) {
//       if ($('.message').length == 0){
//       var last_message_id = 0;
//       }
//       else{
//       var last_message_id = $('.message').last().data('message-id');
//       }

//       $.ajax({
//         url: location.href,
//         data: {id: last_message_id},
//         dataType: 'json',
//       })

//       .done(function(data){
//         var messages = data.messages;
//         messages.forEach(function(message){
//           var html = buildHTML(message);
//             $('.chat-main__message').append(html);
//         });
//       })

//       .fail(function(){
//         alert('自動更新に失敗しました');
//       })
//     }
//   }, 5000);
// });
// });