/**
 * Place all the behaviors and hooks related to the matching controller here.
 * All this logic will automatically be available in application.js.
 */
$(document).ready(function() {
    $('.show_comments').on('ajax:success', function(event, data, status, xhr) {
        $(this).parent().append(data);
        $(this).remove();
    });
});