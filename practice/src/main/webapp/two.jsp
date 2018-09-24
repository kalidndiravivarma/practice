<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="WEB-INF/CSS/index.css">

    <title>Search Student</title>
  </head>
  <body>
  <div class="container">
	  <div class="row">
  		<div class="col-md-11 col-md-offset-1">
  		<br>
  		<h2>Search: </h2>
	  		<form id="getstudentform" action="getstudent" method="GET">
		    	<div class="form-group">
		    		<p>Id:</p>
		    		<input class="form-control" type="text" id="id" name="id">
		    	</div>
		    	<br>		    	
		    	<button class="btn btn-success" type="submit">Submit</button>
	    	</form>
	    </div>
	  </div>  	
  </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	
    	jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[a-z ]+$/i.test(value);
		}, "Letters only please"); 
    	
    	$("#getstudentform").validate({
    		rules:{
    			id:{
    				required:true,
    				number:true
    			},
    		},
    		messages: {	            
	            "id": {
	            	required: "Please enter Student ID",
	                number:" please enter valid ID: 27",
	            },
	        },
	        errorPlacement: function(error, element) 
	        {
	        	error.insertAfter( element );
	         },
	        submitHandler: function(form) {
	            $('#getstudentform').submit();
	          }
    	});
    });
    </script>
    
  </body>
</html>