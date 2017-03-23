$(function() {
  function buildHTML(message) {
     var imageHtml = ""
    if (message.image.url) {
      imageHtml = '<img class="large-img" src="' + message.image.url + '">'
    }
    var html = '<li class="message__case">' +
    '<p class="message__case__name">' +
    message.name +
    '</p>' +
    '<p class="message__case__time">' +
    message.time +
    '</p>' +
    '<p class = "message__case__word" >' +
    message.body +
    '</p>' +
    imageHtml +
    '</li>';

    $('ul.message').append(html);
  }
    var form = $('#new_message')

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.contents__right__bottom__box__left');
    var fileField = $('#file_field');
    var form = new FormData(this);
    var message_url = $(this).attr('action');
    $.ajax({
      type: 'POST',
      url: message_url,
      data: form,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      buildHTML(data);
      console.log(data);
       $('.contents__right__bottom__box__left').val('');
      fileField.val('');
    })
    .fail(function() {
      alert('メッセージを入力してください。');
    });
    return false
  });

  setInterval(reload, 1000000)
    function reload (){
    $.ajax({
      type: 'GET',
      url: form.attr('host'),
      dataType: 'json'
    })
    .done(function(message){
      $('.message__case').remove();
        messages.forEach(function(message){
          insertHTML += buildHTML(message);
        });
      $('.message__case').append(insertHTML)
      })
    console.log("hi");
    };
});
