define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class TaskModel extends Backbone.Model
    url: '',

    initialize: () ->
      @on 'invalid', (model, error) ->
        $('#error').html(error)

    defaults: 
      deadline: new Date()
      status: 0
      assigned: false

    validate: (attrs, options) ->
      if _.isEmpty attrs.title
        return 'title is requied !'

    parse: (response, options) ->
      response


  class TasksCollection extends Backbone.Collection
    model: TaskModel

  return {
    "TaskModel": TaskModel,
    "TasksCollection": TasksCollection
  }