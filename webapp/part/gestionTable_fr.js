var calcDataTableHeight = function() {
	//
  return document.body.clientHeight  - 150;
  //return $(window).height()  - 225;
};

var setTable = function() {
	var table = $('#quezac').DataTable( {
	scrollY:        calcDataTableHeight(),
	paging: true,
  searching: false,
  lengthChange: false,
  pageLength: 50,
  processing: true,
	scrollCollapse: true,
	deferRender:    true,
  "pagingType": "simple_numbers",
	"language": {
			"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
		},
	responsive: {
        breakpoints: [
            { name: 'desktop', width: 1400 },
            { name: 'tablet',  width: 1024 },
            { name: 'fablet',  width: 768 },
            { name: 'phone',   width: 480 }
        ]
    }
  } );
  table.on( 'search.dt', function () {
    if (table.search().length > 0) {

    }
  } );
};


$(document).ready(function() {
	setTable();
} );
