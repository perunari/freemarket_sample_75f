$(function() {

  const dataBox = new DataTransfer();
  const file_field = document.querySelector('input[type="file"]');
  
  $('.file-input').on('change', function() {
    const file = $('input[type="file"]').prop('files')[0];

    $.each(this.files, function(i, file) {
      const fileReader = new FileReader();
      dataBox.items.add(file);
      file_field.files = dataBox.files;
      let num = $('.item-image').length + 1 + i;
      fileReader.readAsDataURL(file);

      if (num == 10) {
        $('#image-box__container').css('display', 'none');
      }

      fileReader.onloadend = function() {
        const src = fileReader.result;
        const html = `
          <div class='item-image' data-image="${file.name}">
            <div class='item-image__content'>  
              <div class='item-image__content--icon'>
                <img src="${src}" width='80' height='120'>
              </div>
            </div>
            <div class='item-image__operation'>
              <div class='item-image__operation--delete'>削除</div>
            </div>
          </div>
        `;
        $('#image-box__container').before(html);
      };
      $('#image-box__container').attr('class', `item-num-${num}`);
    });
  });

  $(document).on('click', '.item-image__operation--delete', function() {
    const target_image = $(this).parent().parent();
    const target_name = $(target_image).data('image');

    if (file_field.files.length == 1) {
      $('input[type="file"]').val(null);
      dataBox.clearData();
      console.log(dataBox);
    } else {
      $.each(file_field.files, function(i, input) {
        if (input.name == target_name) {
          dataBox.items.remove(i);
        }
      });
      file_field.files = dataBox.files;
    }

    target_image.remove();
    let num = $('.item-image').length;
    $('#image-box__container').show();
    $('#image-box__container').attr('class', `item-num-${num}`);
  });
});