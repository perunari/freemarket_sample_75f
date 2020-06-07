$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `
      <div data-index="${index}" class="js-file_group">
        <input class="js-file" type="file" name="item[images_attributes][${index}][picture]" id="item_images_attributes_${index}_picture">
      </div>
    `;
    return html;
  };

  const buildImg = (index, url, name)=> {
    const html = `
      <div data-index="${index}" class="preview-box">
        <div class="upper-box">
          <img data-index="${index}" src="${url}" width="112px" height="112px">
          <div class="delete-box" id="delete_btn_${index}">
            <span>削除</span>
          </div>
        </div>
      </div>
    `;
    return html;
  };

  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl, file.name));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // もしチェックが入っていたらチェックを外す
  if ($('input[type="checkbox"]').prop('checked')) {
    $('input[type="checkbox"]').prop('checked', false);
  }

  $('#image-box').on('click', '.delete-box', function() {
    const targetIndex = $(this).parent().parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().parent().remove();
    $(`#item_images_attributes_${targetIndex}_picture`).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`.js-file_group[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
