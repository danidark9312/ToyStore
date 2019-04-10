/**
 * 
 */
var dt;

function initializeTableClientes(){
	dt = $("#tableClientes").DataTable( {
        ajax: "load",
        "bDestroy" : "true",
        "language": {
            "lengthMenu": "Mostrando _MENU_ registros por pagina",
            "zeroRecords": "No se encontraron registros",
            "info": "Mostrando _PAGE_ de _PAGES_ paginas",
            "zeroRecords": "No se encontraron registros",
            "infoFiltered": "(filtrado de _MAX_ registros)",
            "search":    "Buscar:",	
            "paginate": {
                "first":      "Primera",
                "last":       "Ultima",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
        },
        "initComplete": function( oSettings,json ) {
        	$("#tableClientes tbody").on("click","tr",function() {
        		 var data = dt.row(this).data();
        		 if(!data.isEditing){
        			 data.prevState = this.innerHTML;
                     resetEditTable();
                     $(this).find("td:eq(0)").html("<input type=\"text\" name=\"nombre\" value=\""+data.nombreCliente+"\" />");
                     $(this).find("td:eq(1)").html("<input type=\"text\" name=\"telefono\" value=\""+data.telefono+"\"/>");
                     $(this).find("td:eq(2)").html("<input type=\"text\" name=\"email\" /value=\""+data.email+"\">");
                     var link = getLinkActualizar();
                     $(this).find("td:eq(4)").html("").append(link);
                     data.isEditing = true;
        		 }
                 
            } );
          },
        "columns": [
            { "data": "nombreCliente" },
            { "data": "telefono" },
            { "data": "email" },
            { "data": "ciudad.nombreCiudad" },
            { data: null, render: function ( data, type, row ) {
                // Combine the first and last names into a single table field
                return "<a href=javascript:eliminar("+data.idClient+")>Eliminar</a>";
            } },
            { "data": "idClient", "visible" : false },
        ]
        
    } );
	
}

function initializeAutoCompleteCities(){
	var autoCompleteCityField = $("input[name=ciudad]");
			autoCompleteCityField.autocomplete({
			   	  minLength : 3,
			      source: "loadCities",
			      select: function( event, ui ) {
			          //$( "#project" ).val( ui.item.label );
			          autoCompleteCityField.val(ui.item.nombreCiudad +" - "+ ui.item.nombreEstado)
			          $("input[name=idCiudad]").val(ui.item.idCiudad)
			          return false;
			        }
			    }).autocomplete( "instance" )._renderItem = function( ul, item ) {
			      return $( "<li>" )
			        .append( "<div>" + item.nombreCiudad+" - "+item.nombreEstado+ "</div>" )
			        .appendTo( ul );
			    };
	
}

function getLinkActualizar(){
	var link = $("<a href=\"javascript:void(0)\">Guardar</a>");
	link.on("click",function(){
		actualizarCliente(this);
	});
	return link;
}

function actualizarCliente(a){
	var tr = $(a).closest("tr");
	
	dt = $("#tableClientes").DataTable();
	var data = dt.row(tr).data();
	cliente = {
			nombreCliente : tr.find("[name=nombre]").val(),
			telefono: tr.find("[name=telefono]").val(),
			email: tr.find("[name=email]").val(),
			idClient : data.idClient,
	}
	saveCliente(cliente);
	
}

function resetEditTable(){
	$("#tableClientes tr").each(function(index,data){
		var datatableRow=dt.row(this);
		var data = datatableRow.data();
		if(data&&data.prevState){
			this.innerHTML = data.prevState;
			data.isEditing=false;
		}
	});
}


function eliminar(documento){
	var form = document.forms[0];
	var cliente = {
			idClient : documento
	}
	
	$.ajax({
		  type: "DELETE",
		  url: "remove",
		  contentType: "application/json",
		  data: JSON.stringify(cliente),
		  success: function(data){
			  alert("Eliminado con exito");
			  initializeTableClientes();
		  },error : function(err){
			  alert("error");
		  }
		});
	
}


function saveCliente(modifyClient){
	var form = document.forms[0];
	var cliente;
	
	if(modifyClient){
		cliente = modifyClient;
	}else{
		cliente = {
				nombreCliente : form.nombreCliente.value,
				telefono: form.telefono.value,
				email: form.email.value,
				ciudad:{idCiudad:$("input[name=idCiudad]").val()}
		}
		
	}
	
	$.ajax({
		  type: "POST",
		  url: "save",
		  contentType : "application/json",
		  data: JSON.stringify(cliente),
		  success: function(data){
			  alert("Guardado con exito");
			  $("#modalCliente").modal("hide");
			  initializeTableClientes();
		  },error : function(err){
			  alert("error");
		  }
		});
	
}