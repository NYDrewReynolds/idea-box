$(document).ready(function() {
    var $searchField = $('#filter_ideas');

    $searchField.on('keyup', function() {
       var searchTerm = this.value.toLowerCase();
        $('.panel').each(function(index,panel){
            var title = $(panel).find('h3').text().toLowerCase();
            var body = $(panel).find('.panel-body').text().toLowerCase();
            var matches = title.indexOf(searchTerm) !== -1 || body.indexOf(searchTerm) !== -1;
            $(panel).toggle(matches);
        });
    });
});
