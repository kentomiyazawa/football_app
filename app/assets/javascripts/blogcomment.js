$(function(){

  function buildHTML(blogcomment){
    var html = `<div class="blog--comments__box__comment" data-blogcomment-id=${blogcomment.id}>
                  <div class="blog--comments__box__comment__text">
                    ${blogcomment.text}
                  </div>
                  <div class="blog--comments__box__comment__info">
                    <a class="blog--comments__box__comment__info__name" href="/users/${blogcomment.user.id}">${blogcomment.user_name}</a>
                    <div class="blog--comments__box__comment__info__time">
                      ${blogcomment.created_at}
                    </div>
                  </div>
                </div>
    `
    return html;
  }

  var reloadBlogcomments = function(){
    var last_blogcomment_id = $('.blog--comments__box__comment:last').data("blogcomment-id");
    $.ajax({
      url: "/blogs/blog/api/blogcomments",
      type: 'get',
      dataType: 'json',
      data: {id: last_blogcomment_id}
    })
    .done(function(blogcomments){
      if (blogcomments.length !== 0){
      var insertHTML = "";
      $.each(blogcomments, function(i, blogcomment){
        insertHTML += buildHTML(blogcomment)
      });
      $('.blog--comments__box').append(insertHTML);
      $('.blog--comments__box').animate({ scrollTop: $('.blog--comments__box')[0].scrollHeight});
     }
    })
    .fail(function() {
      alert('error');
    });
  };


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
  if (document.location.href.match(/\/blogs\/\d+/)) {
  setInterval(reloadBlogcomments, 7000);
  }
})