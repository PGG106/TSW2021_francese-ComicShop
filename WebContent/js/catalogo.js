/**
 * 
 */
console.log("ready");

$(document).ready(function(event) {
console.log("ready");
	$("input[type=checkbox]").change(function(event) {
		console.log("ready");
		$.post("./Visibility", { "id": $(this).val(),"visible":$(this).is(':checked')}, function(data) {
		
		
		}, 'JSON');
	});

}
)
