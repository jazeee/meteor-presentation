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
Session.setDefault("numberOfClickCountersToAdd", 20)

loadedDate = new Date()

Template.clickCounters.helpers(
	counter: -> Session.get("counter");
	numberOfClickCountersToAdd: -> Session.get("numberOfClickCountersToAdd")
	getClass: ()->
		if @date >= loadedDate
			"newly-clicked"
)

Template.clickCounters.events(
	'click button': (event) ->
		Session.set("counter", Session.get("counter") + 1)

	'change #number-of-click-counters-to-add': (event) ->
		event.preventDefault()
		clickCountersToAdd = Number($(event.currentTarget).val())
		Session.set("numberOfClickCountersToAdd", clickCountersToAdd)

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

	'click .add-many-new-click-counters': (event) ->
		event.preventDefault()
		for i in [1..Session.get("numberOfClickCountersToAdd")]
			Models.Clicks.insert({count: i})

	'click .resetClickCounters': (event) ->
		event.preventDefault()
		Meteor.call("resetClickCounters")
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
