$(function() {
  function buildHTML(message) {
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
    '</li>';

    $('ul.message').append(html);
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.contents__right__bottom__box__left');
    // var fileField = $('.set_image');
    var form = new FormData(this);
    var message_url = $(this).attr('action');
    $.ajax({
      type: 'POST',
      url: message_url,
      data: form,
      processData: false,
      contentType: false,
      dataType: 'json'
      context: this
    })
    .done(function(data) {
      buildHTML(data);
      this.reset();
      // fileField.val('');
    })
    .fail(function() {
      alert('失敗');
    });
    return false
  });
});