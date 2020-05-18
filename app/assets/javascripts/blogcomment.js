$(function(){

  function buildHTML(blogcomment){
    var html = `<div class="blog--comments__box__comment">
                  <div class="blog--comments__box__comment__text">
                    ${blogcomment.text}
                  </div>
                  <div class="blog--comments__box__comment__info">
                    <a class="blog--comments__box__comment__info__name" href="/users/${blogcomment.user.id}">${blogcomment.user_name}</a>
                    <div class="blog--comments__box__comment__info__time">
                      ${blogcomment.created_at}
                    </div>
                  </div>
                </div>`
    return html;
  }

  $('#new_blogcomment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
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
      $('.blog--comments__box').append(html);
      $('.blogcomment__text__field').val('');
      $('.blogcomment__submit').prop('disabled', false);
      $('.blog--comments__box').animate({ scrollTop: $('.blog--comments__box')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
  })
})