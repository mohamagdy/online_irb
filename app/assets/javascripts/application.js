// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function($, undefined) {
    $('#irb').terminal(function(command, term) {
  	 	$.post('/command.js', { 'command': command }, function(data) {
  			term.echo(data);
			});
    }, 
    {
    	greetings: 'Welcome to irb',
      name: 'irb_demo',
      height: $(document).height() * 0.7,
      width: $(document).width() * 0.6,
      prompt: '>>'
    });
});


