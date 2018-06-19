$(document).ready ->


  $('form').keyup  ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
            $('#bitcoin').val(data.valuebit)
        return false;

  $('button').click ->
    $('#result').val($('#source_currency').val()) # We need a third var to do the trick, and 'result' will change after this function, so we use it
    $('#source_currency').val($('#target_currency').val())
    $('#target_currency').val($('#result').val())
    $('#result').val('')
    $('form').trigger('keyup')

  $('form').change  ->
    $('form').trigger('keyup')

