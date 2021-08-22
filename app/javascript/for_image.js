$(function() {
  $('#post_image').on('change', function (e) {
    const reader = new FileReader();
    reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });

  $(function(){
    setTimeout("$('.flash').fadeOut('slow')", 3000);
  });
});