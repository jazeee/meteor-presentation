Schemas.DateSchema = new SimpleSchema(
	createdAt:
		type: Date
		autoValue: ->
			if @isInsert
				return new Date()
			else if @isUpsert
				return $setOnInsert: new Date()
			else
				return undefined #This leaves the value as it was.
	updatedAt:
		type: Date
		autoValue: ->
			return new Date()
)
