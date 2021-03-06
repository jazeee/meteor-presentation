doesUserOwnDocument = (userId, document) ->
	isOwned = document.userId == userId
	return userId? && isOwned

Rules.allowAll =
	insert: (userId, document) -> true
	update: (userId, document) -> true
	remove: (userId, document) -> true

Rules.allowInsertElseRestrictToOwner =
	insert: (userId, document) -> true
	update: doesUserOwnDocument
	remove: doesUserOwnDocument

# Models.Blogs.allow(Rules.allowInsertElseRestrictToOwner)
