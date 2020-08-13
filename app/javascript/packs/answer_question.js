$(document).ready(function() {
	$("#answers input[type='radio']").change(function() {
		let path = $("#answer_question_path").val();
		$.ajax({
		  url: path,
		  type: 'PUT',
		  data: {"answer": { "id": $(this).val() }},
		  error: function(jqXHR, textStatus, errorThrown) {
		  	let errorMessage = jqXHR.status + ': ' + jqXHR.responseJSON.error; 
		    alert('Error - ' + errorMessage);
		    location.reload();
		  }
		});
	});
});