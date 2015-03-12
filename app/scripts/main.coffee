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

require [
  'models/Task',
  'views/Task'
  ], (TaskModel, TaskView) ->

    statusList = { todo: 0, doing: 1, done: 2, closed: 3 }

    tasks = new TaskModel.TasksCollection([
      {
        title: 'task1',
        deadline: new Date(),
        status: statusList.todo
      },
      {
        title: 'task2',
        deadline: new Date(),
        status: statusList.doing
      },
      {
        title: 'task3',
        deadline: new Date(),
        status: statusList.done
      },
    ])

    for k, v of statusList
      tasks = new TaskModel.TasksCollection tasks.where {status: v}
      tasksView = new TaskView.TasksView {collection: tasks}
      $('#' + k).html(tasksView.render().el)
