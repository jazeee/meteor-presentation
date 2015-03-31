if Meteor.isClient
	Template.registerHelper("formatDate", (dateString) ->
		return moment(dateString).fromNow()
	)
