$(document).ready(function(){
  $('input[data-provide="datepicker"]').datepicker({
		format: "dd M yyyy",
	  calendarWeeks: true,
	  autoclose: true,
	  todayHighlight: true
	});
});