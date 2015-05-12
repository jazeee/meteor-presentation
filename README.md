# meteor-presentation

See [Presentation] (https://docs.google.com/presentation/d/18hfoQmwRLck6PjhKBw0-6Di6aZRmMjuwlRLMErj-ZYY/edit#slide=id.g9c700aac5_1_3)

You can run through this demo code:

Install Meteor

    curl https://install.meteor.com/ | sh

Get Code

    git clone https://github.com/jazeee/meteor-presentation.git
    cd meteor-presentation

See Tags

    git tag

Checkout Tag

    git checkout -b 00 00-init-state-1

Start Meteor

    meteor --port 3010

Visit http://localhost:3010

Increment Tags

    git checkout -b 01 01-add-database-model-insecure-3
    git checkout -b 02 02-add-database-model-5
    git checkout -b 05 05-added-iron-router-removed-autopublish-6
    git checkout -b 08 08-add-accounts-and-bootstrap-6
    git checkout -b 10 10-add-autoform-schema-moment-for-blog-4 
    git checkout -b 12 12-added-input-for-number-of-click-counters-6

See Meteor Update
    
	meteor update
	meteor --port 3010

[Meteor Questions Answered](#meteor-questions-answered)

### How to use Meteor + Bootstrap:

* Simple way: 
    meteor add bootstrap
* [Better way using Less]:(http://www.manuel-schoebel.com/blog/meteorjs-and-twitter-bootstrap---the-right-way)

This demo code uses a variant of the "Better way"

### Regarding "Gotchas", trouble areas, or drawbacks:

* The compile order is definitely something to review. 
** Once you understand it and structure your code appropriately, it is reasonable.
* When searching online, such as on StackOverflow, you will see references to mrt or meteorite. 
** You will need to translate those comments as appropriate. 
** Meteor refactored around version 0.8, as it became more mature. 
** I have found it to be quite stable as it hit 1.0 release.
* Meteor updates fairly frequently. 
** On rare occasion, you may have issues with third party packages. 
** You should, of course, thoroughly test before publicly deploying.

Regarding Deployment:

* You can deploy (for testing purposes) on [meteor.com](http://meteortips.com/book/deployment/)
* You can use [Meteor Up](https://github.com/arunoda/meteor-up)
** Meteor Up is great for publishing/hosting on your own servers/Linux on the cloud.
* Cloud providers, etc...

### Notes
You can find [documentation online](http://docs.meteor.com/#/full/)

I find the documentation to be quite complete and well maintained.
