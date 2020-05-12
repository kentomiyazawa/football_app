$(function(){

  function buildHTML(comment){
    var html = `<div class="comments__comment">
                  <div class="comments__comment__text">
                    <p> ${comment.comment} </p>
                  </div>
                  <div class="comments__comment__info">
                    <div class="comments__comment__info__name">
                      <a href = "/users/${comment.user.id}">${comment.user_name}</a>
                    </div>
                    <div class="comments__comment__info__time">
                      ${comment.created_at}
                    </div>
                  </div>
                </div>`
              return html;
  }

  $('#new_comment').on('submit', function(e){
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
      $('.comments').append(html);
      $('.form__box__text-field').val('');
      $('.form__box__btn').prop('disabled', false);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
  })
});