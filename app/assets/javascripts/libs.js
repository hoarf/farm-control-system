$(function() {
    function check_to_hide_or_show_add_link() {
        if ($('#entry .nested-fields').length == 1) {
            $('#entry .links a').hide();
        } else {
            $('#entry .links a').show();
        }
    }

    $('#entry').bind('cocoon:after-insert', function() {
        check_to_hide_or_show_add_link();
    });

    $('#entry').bind('cocoon:after-remove', function() {
        check_to_hide_or_show_add_link();
    });

    check_to_hide_or_show_add_link();
});
