# meteor-presentation

See [Presentation] (https://docs.google.com/presentation/d/18hfoQmwRLck6PjhKBw0-6Di6aZRmMjuwlRLMErj-ZYY/edit#slide=id.g9c700aac5_1_3)

You can run through this demo code:

###Install Meteor

```bash
    curl https://install.meteor.com/ | sh
```

###Get Code

```bash
    git clone https://github.com/jazeee/meteor-presentation.git
    cd meteor-presentation
```

###See Branches

```bash
    git branch -a
```

###Checkout Initial Branch

```bash
    git checkout 00-init-state
```

###Start Meteor

```bash
    meteor --port 3010
```

Open app in [Browser](http://localhost:3010)

###Increment Branches 

```bash
    git checkout 01-add-database-model-insecure
    git checkout 02-add-database-model
    git checkout 05-added-iron-router-removed-autopublish
    git checkout 08-add-accounts-and-bootstrap
    git checkout 10-add-autoform-schema-moment-for-blog
    # The next one is just for performance testing
    git checkout 12-added-input-for-number-of-click-counters
```

###Try Meteor Update

```bash
	meteor update
	meteor --port 3010
```

# Meteor Questions Answered

### How to use Meteor + Bootstrap:

* Simple way: 
    meteor add bootstrap
* [Better way using Less]:(http://www.manuel-schoebel.com/blog/meteorjs-and-twitter-bootstrap---the-right-way)

This demo code uses a variant of the "Better way"

### Regarding "Gotchas", trouble areas, or drawbacks:

* The compile order is definitely something to review. 
   * Once you understand it and structure your code appropriately, it is reasonable.
* When searching online, such as on StackOverflow, you will see references to mrt or meteorite. 
   * You will need to translate those comments as appropriate. 
   * Meteor refactored around version 0.8, as it became more mature. 
   * I have found it to be quite stable as it hit 1.0 release.
* Meteor updates fairly frequently. 
   * On rare occasion, you may have issues with third party packages. 
   * You should, of course, thoroughly test before publicly deploying.

### Regarding Deployment:

* You can deploy (for testing purposes) on [meteor.com](http://meteortips.com/book/deployment/)
* You can use [Meteor Up](https://github.com/arunoda/meteor-up)
   * Meteor Up is great for publishing/hosting on your own servers/Linux on the cloud.
* Cloud providers, etc...

### Notes
You can find [documentation online](http://docs.meteor.com/#/full/)

I find the documentation to be quite complete and well maintained.
