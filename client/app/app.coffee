Template.appHeader.helpers(
	meetingGroup: -> Models.Settings.findOne({type: "meetingGroup"})
)

Template.appHeader.events(
	"submit #meeting-group": (event, template) ->
		event.preventDefault()
		name = template.find("#name")?.value
		if name?
			Meteor.call("resetMeetingGroup", ->
				if name.length
					Models.Settings.insert({name, type: "meetingGroup"})
			)

	"click .meeting-group": (event) ->
		event.preventDefault()
		Meteor.call("resetMeetingGroup")
)
