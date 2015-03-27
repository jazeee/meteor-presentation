Models.Clicks = new Mongo.Collection('clicks')

if Meteor.isServer
	Meteor.startup ->
		Models.Clicks.allow(Rules.allowAll)
		#Models.Clicks.allow(Rules.allowInsertElseRestrictToOwner)
