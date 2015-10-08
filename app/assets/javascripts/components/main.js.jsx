var app = app || {};

$(document).ready(function () {

	$.ajax({
		url: "/tweets"
	}).done(function(results){
		// debugger;
		React.render(<Board count={50} data={results}/>,
		document.getElementById('react-container'));
	});
});