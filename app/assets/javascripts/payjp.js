$(function() {
  if (!$('#payment_card_regist')[0]) return false;
  Payjp.setPublicKey('pk_test_b59341320085a10e1217e9b0');

  $('#payment_card_regist').on('click', function(e) {
    e.preventDefault();
    const card = {
      number: $('#payment_card_number').val(),
      exp_month: $('#payment_card_exp_mm').val(),
      exp_year: $('#payment_card_exp_yy').val(),
      cvc: $('#payment_card_cvc').val()
    };
    console.log(card);

    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $('#payment_card_number').removeAttr('name');
        $('#payment_card_exp_mm').removeAttr('name');
        $('#payment_card_exp_yy').removeAttr('name');
        $('#payment_card_cvc').removeAttr('name');
        const token = response.id;
        $('#card_token').append(`<input type="hidden" name="payjpToken" value="${token}">`);
        $('#charge-form').get(0).submit();
        alert('登録が完了しました');
      } else {
        alert('カード情報が正しくありません');
        $('#payment_card_regist').prop('disabled', false);
      }
    });
  });
});