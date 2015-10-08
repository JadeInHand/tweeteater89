var app = app || {};

var Searchbox = React.createClass({

	// doSearch: function () {
	// 	// debugger;
	// 	var query = this.refs.searchInput.getDOMNode().value;
	// 	this.props.doSearch(query);
	// },

	doAPI: function () {
		var self = this;
		var query = this.refs.searchInput.getDOMNode().value;
		console.log(query);
		$.ajax({
			url: "/searchtweets",
			method: 'post',
			data: {
				searchKey: query
			}
		}).done(function(results){
			results = results;
			results.forEach(function(tweet){
				self.props.add(tweet);
			});
		});
	},

	render: function () {
		return (<div className="row">
									<div className="col-lg-6">
										<div className="input-group">
											<input className="form-control" type="text" ref="searchInput" placeholder="Search Butterfly"/>
											<span className="input-group-btn">
												<button className="btn btn-default" type="button" onClick={this.doAPI}>Go!</button>
											</span>
										</div>
									</div>
								</div>);
	}
});