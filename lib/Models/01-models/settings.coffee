Models.Settings = new Mongo.Collection('settings')

if Meteor.server
	Meteor.methods(
		resetMeetingGroup: ->
			Models.Settings.remove({type: "meetingGroup"})
	)

	Meteor.startup ->
		Meteor.publish("settings", ->
			Models.Settings.find({})
		)
		Models.Settings.allow(Rules.allowAll)
