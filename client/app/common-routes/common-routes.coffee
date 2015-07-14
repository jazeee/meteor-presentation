Router.configure(
	loadingTemplate: 'loading'
	notFoundTemplate: 'pageNotFound'
)

Router.onBeforeAction('loading');

@Controllers = {}

Controllers.BaseController = RouteController.extend(
	waitOn: ->
		return [
			Meteor.subscribe('settings')
		]
	onRun: ->
		#This is only run the first time the route is loaded
		$('body,html').scrollTop(0)
		@next()
	layoutTemplate: 'baseLayout'
)
