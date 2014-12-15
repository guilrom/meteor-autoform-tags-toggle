Package.describe({
  name: 'yogiben:autoform-tags-toggle',
  summary: 'Select tags with autoForm',
  version: '0.0.1',
  git: 'https://github.com/yogiben/meteor-autoform-tags-toggle'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');

  api.use([
  	'templating',
  	'tracker',
  	'coffeescript',
  	'aldeed:autoform@4.0.7'
  ], 'client');

  api.addFiles([
  	'lib/client/autoform-tags-toggle.html',
  	'lib/client/autoform-tags-toggle.coffee'
  ]);
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('yogiben:autoform-tags');
  api.addFiles('yogiben:autoform-tags-tests.js');
});
