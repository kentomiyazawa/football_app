$(function(){

  $('.secret-btn').click(function(){

    $('.detail').css('display', 'block');
    $('.secret-btn').css('display', 'none')
  });
  $('.detail__info__back').click(function(){
    $('.secret-btn').css('display', 'block');
    $('.detail').css('display', 'none');
  })
});