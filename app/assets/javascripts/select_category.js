$(function(){
  function appendOption(category){
    const html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  };

  function appendChildrenBox(insertHTML){
    const childSelectHTML = `
      <div class='field__input field__input__category' id='children__select'>
        <select id='child_category' name=''>
          <option value=''>選択してください</option>
          ${insertHTML}
        </select>
        <i class="fas fa-chevron-down"></i>
      </div>
    `;
    $('.field__category').append(childSelectHTML);
  };

  function appendGrandchildrenBox(insertHTML){
    const grandchildrenHTML = `
      <div class='field__input' id='grandchildren__select'>
        <select id='grandchild_category' name='item[category_id]'>
          <option value=''>選択してください</option>
          ${insertHTML}
        </select>
        <i class="fas fa-chevron-down"></i>
      </div>
    `;
    $('.field__category').append(grandchildrenHTML);
  };

  $('#parent_category').on('change', function(){
    const parentCategoryId = document.getElementById('parent_category').value;
    if(parentCategoryId !== ''){
      $.ajax({
        url: 'get_child_categories',
        type: 'GET',
        data: { id: parentCategoryId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children__select').remove();
        $('#grandchildren__select').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }else{
      $('#children__select').remove();
      $('#grandchildren__select').remove();
    };
  });

  $('.field__category').on('change', '#child_category', function(){
    const childCategoryId = document.getElementById('child_category').value;
    if(childCategoryId !== ''){
      $.ajax({
        url: 'get_grandchild_categories',
        type: 'GET',
        data: { id: childCategoryId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren__select').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました')
      });
    }else{
      $('#grandchildren__select').remove();
    };
  });
});