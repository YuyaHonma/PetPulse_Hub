(document).on('submit', '#new_category', function(e) {
  e.preventDefault();
  var formData = $(this).serialize();
  
  $.ajax({
    type: 'POST',
    url: $(this).attr('action'),
    data: formData,
    dataType: 'script', // <- 追加: JavaScriptを返す
    success: function(data) {
      // カテゴリーの表示を更新するための関数を呼び出す
    },
    error: function(xhr, status, error) {
      console.error(error);
    }
  });
});