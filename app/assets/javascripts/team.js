$(function(){

  $('.detail__info__player').click(function(){

    $('.player-info').css('display', 'block');
    $('.detail').css('display', 'none')
  });
  $('.player-info__back').click(function(){
    $('.detail').css('display', 'block');
    $('.player-info').css('display', 'none');
  })
});