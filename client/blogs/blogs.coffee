Router.route('/blogs'
	name: "blogs"
	waitOn: ->
		return [
			Meteor.subscribe('blogs')
		]
	data: ->
		return {
			blogs: Models.Blogs.find()
		}
	controller: 'Controllers.BaseController'
)

Router.route('/blogs/:_id'
	name: "blog"
	waitOn: ->
		return [
			Meteor.subscribe('blogs')
		]
	data: -> Models.Blogs.findOne(@.params._id)
	controller: 'Controllers.BaseController'
)

Template.blog.helpers(
	isOwner: ->
		@userId == Meteor.userId()
)

blogEditorModalData = new Utilities.ReactiveDependency()

blogEditorPreviewMarkdown = new Utilities.ReactiveDependency()
Template.blogEditorModal.helpers(
	blogEditorPreviewMarkdown: -> blogEditorPreviewMarkdown.get()
)
Template.blogEditorModal.events =
	"keyup #markdown": (event) ->
		value = $(event.currentTarget).val()
		blogEditorPreviewMarkdown.set(value)

Template.blogs.events =
	"click .create-new-blog": (event) ->
		event.preventDefault()
		blogEditorModalData.set(
			blog: null
			autoformType: "insert"
		)
		blogEditorPreviewMarkdown.set()
Template.blog.events =
	"click .edit-blog": (event) ->
		event.preventDefault()
		blogEditorModalData.set(
			blog: @
			autoformType: "update"
		)
		blogEditorPreviewMarkdown.set(@markdownText)
	"click .delete-blog": (event) ->
		event.preventDefault()
		if confirm("Are you sure you want to remove #{@title}")
			console?.log "Deleting", @
			Models.Blogs.remove(@_id)

Template.blogs.helpers(
	blogEditorModalData: -> blogEditorModalData.get()
)

AutoForm.hooks(
	blogForm:
		onError: (type, error) ->
			console?.error error
			alert("Failed to update blog with #{error.message}")
		onSuccess: (operation, result, template) ->
			$("#blogEditorModal").modal("hide")
)
