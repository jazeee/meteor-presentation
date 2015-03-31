Schemas.blogs = new SimpleSchema(
	userId:
		type: String
		autoValue: ->
			if @isInsert
				return @userId
			else if @isUpsert
				return $setOnInsert: @userId
			else
				return undefined #This leaves the value as it was.
		denyUpdate: true
	title:
		type: String
		min: 10
		label: "Title"
		autoform:
			placeholder: 'Title'
	markdownText:
		type: String
		min: 10
		label: "Markdown"
		autoform:
			placeholder: 'Markdown Content'
			type: "textarea"
			rows: 10
	dates:
		type: Schemas.DateSchema
)

Models.Blogs = new Mongo.Collection('blogs')

Models.Blogs.attachSchema(Schemas.blogs)

if Meteor.isServer
	Meteor.startup ->
		Meteor.publish("blogs", ->
			Models.Blogs.find({}, {limit: 1000})
		)

		Models.Blogs.allow(Rules.allowInsertElseRestrictToOwner)
