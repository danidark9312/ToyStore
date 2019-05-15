var globalAspectRatio = 1;
$(document).ready(function(){
	if(!imageUrl)
		$("#imageCrop").hide();
	else
		initializeCropper();
  });
  
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      $('#imageCrop').attr('src', e.target.result);
	      setTimeout(initializeCropper(),500);
	    }
	    reader.readAsDataURL(input.files[0]);
	    
	    
	    
	  }
	}

	$("#archivoImagenPreload").change(function() {
	  $('#imageCrop').cropper('destroy');
	  readURL(this);
	  $("#imageCrop").show();
	});

function initializeCropper(){
	
	$('#imageCrop').cropper({
		  aspectRatio: globalAspectRatio,
		});
}

function saveFormProduct(){
	var form = document.forms[0];
	if(!isValidForm(form))
		return;
	
	var formData = new FormData(form);
	var croppedCanvas = $('#imageCrop').cropper('getCroppedCanvas');
	
	if(croppedCanvas){
		croppedCanvas.toBlob(function(blob){
			formData.delete("archivoImagenPreload");
			formData.append('archivoImagen', blob, "product.jpg");
			$.ajax(formUrl, {
			    method: "POST",
			    data: formData,
			    processData: false,
			    contentType: false,
			    success: function (d) {
			      if(d.message=="Success")
			    	  window.location=url+"admin/products/list";
			    },
			    error: function () {
			      console.log('Upload error');
			    }
			  });
			
		});
	}
	
};

function isValidForm(form){
	if(form.name.value == ""){
		showFormError("El nombre del producto es obligatorio");
		return false;
	}else if(form.value.value == 0){
		showFormError("El valor del producto no puede ser cero");
		return false;
	}
		
	
	return true;
}

function showFormError(text){
	$("#errorMessage").show().text(text);
	window.location="#errorMessage";
}
