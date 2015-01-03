$(document).ready(function() { 
    // call the tablesorter plugin 
    $('#votingtable').tablesorter({
      sortInitialOrder: 'desc',
      sortList: [[3,1]]
    });
});
