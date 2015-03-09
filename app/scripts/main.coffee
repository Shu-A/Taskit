#/*global require*/
'use strict'

require.config
  shim: {
  }
  paths:
    jquery: '../bower_components/jquery/dist/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/lodash/dist/lodash'

require [
  'backbone'
], (Backbone) ->
  Backbone.history.start()

tasks = new @Models.Tasks([
  {
    title: 'task1',
    deadline: new Date(),
    status: 0
  },
  {
    title: 'task2',
    deadline: new Date(),
    status: 1
  },
  {
    title: 'task3',
    deadline: new Date(),
    status: 2
  },
])

todoTasks = new @Models.Tasks tasks.where {status:0}
todoTasksView = new @Views.TasksView {collection: todoTasks}
$("#todoTasks").html(todoTasksView.render().el)

$("body").append(todoTasksView.render().el)