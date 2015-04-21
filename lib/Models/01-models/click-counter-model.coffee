Models.Clicks = new Mongo.Collection('clicks')

if Meteor.isServer
	Meteor.startup ->
		Meteor.publish("clicks", ->
			Models.Clicks.find({}, {limit: 3000})
		)

		Models.Clicks.allow(Rules.allowAll)
		#Models.Clicks.allow(Rules.allowInsertElseRestrictToOwner)
