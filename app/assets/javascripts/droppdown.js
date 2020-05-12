$(function(){
  $('.droppdown').hover(
    function(){
    $('.droppdown__li').slideDown();
  },function(){
    $('.droppdown__li').slideUp();
  })
});