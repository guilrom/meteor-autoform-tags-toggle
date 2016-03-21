Package.describe({
  name: 'guilrom:autoform-tags-toggle',
  summary: 'Select tags with autoForm',
  version: '0.0.1',
  git: 'https://github.com/guilrom/meteor-autoform-tags-toggle'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');

  api.use([
  	'reactive-var',
  	'coffeescript'
  ], ['client', 'server']);
  api.use([
  	'templating',
  	'aldeed:autoform@5.5.1'
  ], 'client');

  api.addFiles([
    'lib/client/autoform-tags-toggle.coffee',
  	'lib/client/autoform-tags-toggle.html',
  	'lib/client/autoform-tags-toggle.css'
  ], 'client');  
  
});
