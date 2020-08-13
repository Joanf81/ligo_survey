$(document).ready(function() {
	$("#answers input[type='radio']").change(function() {
		let path = $("#answer_question_path").val();
		$.ajax({
		  url: path,
		  type: 'PUT',
		  data: {"answer": { "id": $(this).val() }},
		  fail: function(data) {
		    alert('Error sending the answer');
		    location.reload();
		  }
		});
	});
});