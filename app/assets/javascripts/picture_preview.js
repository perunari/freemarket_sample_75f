$(function() {
  const file_field = document.querySelector('input[type="file"]');
  $('.file-input').on('change', function() {
    const file = $('input[type="file"]').prop('files')[0];
    const fileReader = new FileReader();
    fileReader.onloadend = function() {
      const src = fileReader.result;
      const html = `
        <div class='item-image' data-image="${file.name}">
          <div class='item-image__content'>  
            <div class='item-image__content--icon'>
              <img src="${src}" width='100' height='100'>
              <div class='item-image__operation'>
                <div class='item-image__operation--delete'>削除</div>
              </div>
            </div>
          </div>
        </div>
      `;
      $('.image-upload__box').before(html);
    };
    fileReader.readAsDataURL(file);
  });

  $(document).on('click', '.item-image__operation--delete', function() {
    const target_image = $(this).parent().parent().parent().parent();
    target_image.remove();
    file_field.val('');
  });


});