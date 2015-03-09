define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class TaskView extends Backbone.View
    template: JST['app/scripts/templates/Task.ejs']

    tagName: 'div'

    id: ''

    className: 'task'

    events: {}

    initialize: () ->
        @listenTo @model, 'change', @render

    render: () ->
        @$el.html @template(@model.toJSON())

  class TasksView extends Backbone.View
    tagName: 'ul'

    render: () ->
      @collection.each (task) ->
        taskView = new TaskView {model: task}
        @$el.append taskView.render().el
      , this
        
