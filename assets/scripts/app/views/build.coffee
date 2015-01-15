Travis.reopen
  BuildsView: Travis.View.extend
    buildsBinding: 'controller.builds'

    ShowMoreButton: Em.View.extend
      tagName: 'button'
      classNameBindings: ['isLoading', 'showMore']
      showMore: true
      attributeBindings: ['disabled']
      isLoadingBinding: 'controller.isLoading'
      template: Em.Handlebars.compile('{{view.label}}')

      disabledBinding: 'isLoading'

      label: (->
        if @get('isLoading') then 'Loading' else 'Show more'
      ).property('isLoading')

      click: ->
        @get('controller').showMore()

  BuildView: Travis.View.extend
    classNameBindings: ['color', 'loading']
    buildBinding: 'controller.build'
    loadingBinding: 'controller.loading'

    color: (->
      Travis.Helpers.colorForState(@get('build.state'))
    ).property('build.state')
