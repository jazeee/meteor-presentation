Session.setDefault("counter", 0)

loadedDate = new Date()

Template.clickCounter.helpers(
	counter: -> Session.get("counter");
	clickCounters: -> Models.Clicks.find()
	getClass: ->
		if @date >= loadedDate
			"newly-clicked"
)

Template.clickCounter.events(
	'click button': (event) ->
		Session.set("counter", Session.get("counter") + 1)

	'click .increment-count': (event) ->
		event.preventDefault()
		count = @count + 1
		date = new Date()
		Models.Clicks.update(@_id, {
			$set:
				{count, date}
		})

	'click .add-new-click-counter': (event) ->
		event.preventDefault()
		Models.Clicks.insert({count: 0})

	'click .add-20-new-click-counters': (event) ->
		event.preventDefault()
		for i in [1..20]
			Models.Clicks.insert({count: i})
)
