Router.route('/'
	name: "home" 
	waitOn: ->
		return [
			Meteor.subscribe('clicks')
		]
	data: ->
		return {
			clickCounters: Models.Clicks.find()
		}
	controller: 'Controllers.BaseController'
)
