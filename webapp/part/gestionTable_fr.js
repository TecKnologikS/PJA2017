var calcDataTableHeight = function() {
	//return document.body.clientHeight  - 200;
  return $(window).height()  - 225;
};

var setTable = function() {
	var table = $('#quezac').DataTable( {
	paging: true,
	scrollCollapse: true,
	deferRender:    true,
	scrollY:        calcDataTableHeight(),
	"language": {
			"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
		},
	responsive: {
        breakpoints: [
            { name: 'desktop', width: 1200 },
            { name: 'tablet',  width: 1024 },
            { name: 'fablet',  width: 768 },
            { name: 'phone',   width: 480 }
        ]
    }
  } );
  table.on( 'search.dt', function () {
    if (table.search().length > 0) {
      switch(table.search()) {
        case "#about":
          document.getElementById('easter').className='easter';
        break;
      }
    }
  } );
};


$(document).ready(function() {
	setTable();
} );
