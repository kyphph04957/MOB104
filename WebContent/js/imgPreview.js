/**
 * 
 */	
		
		function updateImageDisplay(inputFile,imgPreview) {
			var input = document.getElementById(inputFile);
			var preview = document.getElementById(imgPreview);
			var file = input.files;
			let url = window.URL.createObjectURL(file[0]);
			preview.src=url;
			}