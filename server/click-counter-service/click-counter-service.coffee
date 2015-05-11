Meteor.methods(
	resetClickCounters: ->
		Models.Clicks.remove({})
)
