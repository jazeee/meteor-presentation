Router.route('/click-counters'
	name: "clickCounters"
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

Router.route('/click-counters/:_id'
	waitOn: ->
		return [
			Meteor.subscribe('clicks')
		]
	data: -> Models.Clicks.findOne(@.params._id)
	template: "clickCounter"
	controller: 'Controllers.BaseController'
)

Session.setDefault("counter", 0)

loadedDate = new Date()

Template.clickCounters.helpers(
	counter: -> Session.get("counter");
	getClass: ()->
		if @date >= loadedDate
			"newly-clicked"
)

Template.clickCounters.events(
	'click button': (event) ->
		Session.set("counter", Session.get("counter") + 1)

	'mousedown .increment-count': (event) ->
		event.preventDefault()
		switch event.which
			when 1 #left mouse
				count = @count + 1
				date = new Date()
				Models.Clicks.update(@_id, {
					$set:
						{count, date}
				})
			when 2, 3
				console.log @_id
				Router.go("/click-counters/#{@_id}")

	'click .add-new-click-counter': (event) ->
		event.preventDefault()
		Models.Clicks.insert({count: 0})

	'click .add-20-new-click-counters': (event) ->
		event.preventDefault()
		for i in [1..20]
			Models.Clicks.insert({count: i})
)

Template.clickCounter.events(
	"click .increment-count": (event) ->
		event.preventDefault()
		count = @count + 1
		date = new Date()
		Models.Clicks.update(@_id, {
			$set:
				{count, date}
		})
)
