AutoForm.addInputType 'tags-toggle',
	template: 'autoformTagsToggle'
	valueOut: ->
		tags = @children('.js-selected').map ->
			$(@).data 'tag'
		tags.get().join ','
	contextAdjust: (ctx) ->
		ctx.selectedTags = new Tracker.Dependency
		ctx._selectedTags = []
		if typeof ctx.value == 'string'
			ctx._selectedTags = ctx.value.split ','
		
		ctx.getSelectedTags = =>
			ctx.selectedTags.depend()
			ctx._selectedTags
		ctx.selectTag = (tag) =>
			ctx._selectedTags.push tag
			ctx.selectedTags.changed()
		ctx.removeTag = (tag) =>
			pos = ctx._selectedTags.indexOf tag
			if pos > -1
				ctx._selectedTags.splice pos, 1
			ctx.selectedTags.changed()
		ctx.isTagSelected = (tag) =>
			ctx.selectedTags.depend()
			ctx._selectedTags.indexOf(tag) > -1
		ctx

Template.autoformTagsToggle.helpers
	schemaKey: ->
		@atts['data-schema-key']
	tags: ->
		_.map @atts.tags, (tag) =>
			if typeof tag == 'string'
				tag = { value: tag, label: tag }
			tag.selected = @isTagSelected tag.value
			tag

Template.autoformTagsToggle.events
	'click .label': (e, t) ->
		selected = t.data.isTagSelected @value
		if selected
			t.data.removeTag @value
		else
			t.data.selectTag @value