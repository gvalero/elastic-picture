/**
 * Place all the behaviors and hooks related to the matching controller here.
 * All this logic will automatically be available in application.js.
 */
$(document).ready(function() {
    $('.show_comments').on('ajax:success', function(event, data, status, xhr) {
        $(this).parent().append(data);
        $(this).remove();
    });

    // Parse the JSON response and replace the <form> with the successfully created article
    $('form.new_comment').on('ajax:success',function(event, data, status, xhr){
        if($('.comments')) {
            $('.comments').children('table').children('tbody').append(
                '<tr class="highlighted"><td>'+ data.title +'</td><td>'+ data.descr +'</td><td></td></tr>'
            ).fadeIn();
        } else {
            $(this).after().append(
                '<div>Comment created successfully </div>'
            ).show().delay(3000).fadeOut();
        }
        this.reset();
    });


    // Parse the JSON response and generate an unordered list of errors, then stick it inside
    // <div class="errors"> which is in our view template
    $('form.new_article').on('ajax:error',function(event, xhr, status, error){

        var responseObject = $.parseJSON(xhr.responseText), errors = $('<ul />');

        $.each(responseObject, function(index, value){
            errors.append('<li>' + index + ':' + value + '</li>');
        })

        $(this).find('.errors').html(errors);
    });
});