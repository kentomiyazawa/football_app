$(function(){

  $('.detail__info__player').click(function(){
    $('.player-info').fadeIn();
    $('.detail').fadeOut();
  });
  $('.player-info__back').click(function(){
    $('.detail').fadeIn();
    $('.player-info').fadeOut();
  });
});