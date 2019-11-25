var globalAspectRatio = 1;
var imageResize = 800;
var imageModified = false;
var initialCrop = false;

$(document).ready(function(){
	if(!imageUrl)
		$("#imageCrop").hide();
	else
		initializeCropper();
  });

	window.addEventListener('paste', e => {
		files = e.clipboardData.files;
		if(files.length > 0){
			$("#archivoImagenPreload")[0].files = e.clipboardData.files;
			$("#archivoImagenPreload").change();	
		}
	});
  
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      // $('#imageCrop').attr('src', e.target.result);
	      setTimeout(initializeCropper(),500);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	$("#archivoImagenPreload").change(function(e) {
	  imageModified = true;
	  $('#imageCrop').cropper('destroy');
	  compress(e);
	});

	function compress(e) {
	    /*const width = 500;
	    const height = 300;*/
	    
	    
	    const fileName = e.target.files[0].name;
	    const reader = new FileReader();
	    reader.readAsDataURL(e.target.files[0]);
	    reader.onload = event => {
	        const img = new Image();
	        img.src = event.target.result;
	        
	        img.onload = () => {
	                const elem = document.createElement('canvas');
	                const width = imageResize;
	                const scaleFactor = width / img.width;
	                elem.width = width;
	                elem.height = img.height * scaleFactor;
	                const ctx = elem.getContext('2d');
	                // img.width and img.height will contain the original dimensions
	                
	                
	                
	                ctx.drawImage(img, 0, 0, width, img.height * scaleFactor);
	                ctx.canvas.toBlob((blob) => {
	                	const imageUrl = URL.createObjectURL(blob);
	                	$("#imageCrop")[0].src=imageUrl;
	                	readURL(e.target);
	              	  	$("#imageCrop").show();
	              	  
	                    /*const file = new File([blob], fileName, {
	                        type: 'image/jpeg',
	                        lastModified: Date.now()
	                    });*/
	                }, 'image/jpeg', 1);
	            },
	            reader.onerror = error => console.log(error);
	    };
	}
	

function initializeCropper(){
	$('#imageCrop').cropper({
		  aspectRatio: globalAspectRatio,
		  autoCropArea : 1,
		  crop: function(e){
			  if(!initialCrop)
				  initialCrop=true;
			  else
				  imageModified=true;
		  }
		  
		});
	
}

function saveFormProduct(){
	var form = document.forms[0];
	var formData = new FormData(form);
	appendProductTypes(form,formData);
	if(!isValidForm(form))
		return;
	
	var croppedCanvas = $('#imageCrop').cropper('getCroppedCanvas');
	if(croppedCanvas){
		croppedCanvas.toBlob(function(blob){
			formData.delete("archivoImagenPreload");
			if(imageModified){
				formData.append('archivoImagen', blob, "product.jpg");
				formData.append('imageModified', imageModified);
			}else{
				formData.append('archivoImagen', null);
				formData.append('imageModified', imageModified);
				
			}
			$.ajax(formUrl, {
			    method: "POST",
			    data: formData,
			    processData: false,
			    contentType: false,
			    success: function (d) {
			      if(d.message=="Success")
			    	  window.location=url+"store";
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

function appendProductTypes(form,formData){
	var productTypes = $(form).find("[name=productTypesSelect]");
	productTypes.each(function(index,select){
		var productTypeId = select.getAttribute("product_type_id");
		var productTypeValue = select.value;
		var str = productTypeId+";"+productTypeValue;
		formData.append("productTypes["+index+"]",str);
	});
}
