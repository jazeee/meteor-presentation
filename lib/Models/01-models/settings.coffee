Models.Settings = new Mongo.Collection('settings')

if Meteor.server
	Meteor.methods(
		resetMeetingGroup: ->
			Models.Settings.remove({type: "meetingGroup"})
	)
