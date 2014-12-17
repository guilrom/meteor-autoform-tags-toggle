AutoForm.addInputType 'tags-toggle',
	template: 'autoformTagsToggle'
	valueOut: ->
		tags = @children('.js-selected').map ->
			$(@).data 'tag'
		tags.get().join ','
	contextAdjust: (ctx) ->
		ctx.selectedTags = new ReactiveVar []
		ctx.selectedTags.set ctx.value.split(',') if typeof ctx.value == 'string'
		
		ctx.selectTag = (tag) =>
			ctx.selectedTags.set _.union(ctx.selectedTags.get(), [tag])
		ctx.removeTag = (tag) =>
			ctx.selectedTags.set _.without(ctx.selectedTags.get(), tag)
		ctx.isTagSelected = (tag) =>
			_.contains ctx.selectedTags.get(), tag
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