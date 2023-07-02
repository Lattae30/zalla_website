var selectedCategory = document.getElementById('category');
var selectedSubcategory = document.getElementById('subcategory');
var dropZone = document.getElementById('dropZone');
var fileInput = document.getElementById('fileInput');
var previewContainer = document.getElementById('previewContainer');
var variantsTableBody = document.getElementById('variantsTable').getElementsByTagName('tbody')[0];

function updateSubcategories() {
  selectedSubcategory.innerHTML = '';
  var category = selectedCategory.value;

  if (category === 'top') {
    addSubcategoryOption('Blouse');
    addSubcategoryOption('Shirt');
    addSubcategoryOption('T-Shirt');
    addSubcategoryOption('Dress');
  } else if (category === 'bottom') {
    addSubcategoryOption('Trousers');
    addSubcategoryOption('Skirt');
    addSubcategoryOption('Shorts');
  } else if (category === 'accessories') {
    addSubcategoryOption('Glasses');
    addSubcategoryOption('Sunglasses');
    addSubcategoryOption('Ring');
    addSubcategoryOption('Necklaces');
    addSubcategoryOption('Hat');
    addSubcategoryOption('Bracelet');
  }
}

function addSubcategoryOption(subcategory) {
  var option = document.createElement('option');
  option.text = subcategory;
  selectedSubcategory.add(option);
}

function chooseFiles() {
  if (dropZone.children.length - 1 >= 4) {
    alert('The maximum number of images is 4.');
    return;
  }

  fileInput.click();
}

dropZone.addEventListener('dragover', function (e) {
  e.preventDefault();
  dropZone.classList.add('drag-over');
});

dropZone.addEventListener('dragleave', function () {
  dropZone.classList.remove('drag-over');
});

dropZone.addEventListener('drop', function (e) {
  e.preventDefault();
  dropZone.classList.remove('drag-over');

  var files = e.dataTransfer.files;
  if (previewContainer.children.length + files.length > 4) {
    alert('The maximum number of image files is 4.');
    return;
  }

  for (var i = 0; i < files.length; i++) {
    var file = files[i];
    var reader = new FileReader();

    reader.onload = function (e) {
      var img = document.createElement('img');
      img.src = e.target.result;
      img.className = 'img-thumbnail image-preview';
      previewContainer.appendChild(img);
    };

    reader.readAsDataURL(file);
  }
});

fileInput.addEventListener('change', function () {
  var files = fileInput.files;
  if (previewContainer.children.length + files.length > 5) {
    alert('The maximum number of image files is 4.');
    return;
  }

  for (var i = 0; i < files.length; i++) {
    var file = files[i];
    var reader = new FileReader();

    reader.onload = function (e) {
      var img = document.createElement('img');
      img.src = e.target.result;
      img.className = 'img-thumbnail image-preview';
      previewContainer.appendChild(img);
    };

    reader.readAsDataURL(file);
  }
});

function addVariantRow() {
    var tbody = document.getElementById('variantBody');
    var newRow = document.createElement('tr');
  
    newRow.innerHTML = 
    	`
    	<td><input type="text" class="form-control" name="size" id="size"></td>
        <td><input type="text" class="form-control" name="color" id="color"></td>
        <td><input type="number" class="form-control" name="quantity" min="0" id="quantity"></td>
        <td><button type="button" class="btn btn-danger" onclick="removeVariantRow(this)">Remove</button></td>
    	`      
    ;
  
    tbody.appendChild(newRow);
}

function removeVariantRow(button) {
  var row = button.closest('tr');
  alert("Are You Sure Want to Delete This Row?")
  row.remove();
}

// Function to display an error message
function displayErrorMessage(element, message) {
  var errorElement = document.createElement('div');
  errorElement.className = 'error-message';
  errorElement.innerText = message;
  element.classList.add('is-invalid');
  element.parentNode.appendChild(errorElement);
}

// Function to remove error messages
function removeErrorMessages() {
  var errorMessages = document.getElementsByClassName('error-message');
  for (var i = 0; i < errorMessages.length; i++) {
    errorMessages[i].remove();
  }

  var invalidElements = document.getElementsByClassName('is-invalid');
  for (var i = 0; i < invalidElements.length; i++) {
    invalidElements[i].classList.remove('is-invalid');
  }
}



document.getElementById('productForm').addEventListener('submit', function (e) {
  e.preventDefault();

  // Remove previous error messages
  removeErrorMessages();

  // Get form values
  var productId = document.getElementById('productId').value;
  var productName = document.getElementById('productName').value;
  var category = selectedCategory.value;
  var subcategory = selectedSubcategory.value;
  var weight = document.getElementById('weight').value;
  var price = document.getElementById('price').value;
  var size = document.getElementById('size').value;
  var color = document.getElementById('color').value;
  var quantity = document.getElementById('quantity').value;
  var desc = document.getElementById('desc').value;
  var images = [];


  // Get image URLs
  var imageElements = previewContainer.getElementsByTagName('img');
  for (var i = 0; i < imageElements.length; i++) {
    images.push(imageElements[i].src);
  }

  // Validate form fields
  var isValid = true;

  // Validate ID field
  if (productId.trim() === '') {
    displayErrorMessage(document.getElementById('productId'), 'You must fill this field');
    isValid = false;
  }

  // Validate Name field
  if (productName.trim() === '') {
    displayErrorMessage(document.getElementById('productName'), 'You must fill this field');
    isValid = false;
  }

  // Validate Category field
  if (category === '') {
    displayErrorMessage(document.getElementById('category'), 'You must fill this field');
    isValid = false;
  }

  // Validate Subcategory field
  if (subcategory === '') {
    displayErrorMessage(document.getElementById('subcategory'), 'You must fill this field');
    isValid = false;
  }

  // Validate Weight field
  if (weight.trim() === '' || !/^\d*\.?\d+$/.test(weight) || parseFloat(weight) <= 0) {
    displayErrorMessage(document.getElementById('weight'), 'Please fill this field correctly');
    isValid = false;
  }

  // Validate Price field
  if (price.trim() === '' || !/^\d+$/.test(price) || parseInt(price) <= 0) {
    displayErrorMessage(document.getElementById('price'), 'Please fill this field correctly');
    isValid = false;
  }
  
//Validate Size field
  if (size.trim() === '') {
    displayErrorMessage(document.getElementById('size'), 'This field must be filled');
    isValid = false;
  } else if (!/^[a-zA-Z0-9]+$/.test(size)) {
    displayErrorMessage(document.getElementById('size'), 'Please fill this field correctly');
    isValid = false;
  }

  // Validate Color field
  if (color.trim() === '') {
    displayErrorMessage(document.getElementById('color'), 'This field must be filled');
    isValid = false;
  } else if (!/^[a-zA-Z]+$/.test(color)) {
    displayErrorMessage(document.getElementById('color'), 'Please fill this field correctly');
    isValid = false;
  }

  // Validate Quantity field
  if (quantity.trim() === '') {
    displayErrorMessage(document.getElementById('quantity'), 'This field must be filled');
    isValid = false;
  } else if (!/^\d+$/.test(quantity) || parseInt(quantity) <= 0) {
    displayErrorMessage(document.getElementById('quantity'), 'Please fill this field correctly');
    isValid = false;
  }

  // Validate Desc field
  if (desc.trim() === '') {
    displayErrorMessage(document.getElementById('desc'), 'This field must be filled');
    isValid = false;
  }

  // Validate Images field
  // Validate Images field
    if (images.length === 0) {
        displayErrorMessage(document.getElementById('fileInput'), 'Please choose the image file');
        isValid = false;
    } else {
        var isValidImage = true;
        for (var i = 0; i < images.length; i++) {
        var file = images[i];
        var extension = file.name.substr(file.name.lastIndexOf('.')).toLowerCase();
        if (extension !== '.jpg' && extension !== '.jpeg' && extension !== '.png') {
            isValidImage = false;
            break;
        }
        }
        if (!isValidImage) {
        displayErrorMessage(document.getElementById('fileInput'), 'Only accept .jpg, .png, and .jpeg files');
        isValid = false;
        }
    }
  

  // Validate Variant fields
  var variantRows = variantsTableBody.getElementsByTagName('tr');
  for (var i = 0; i < variantRows.length; i++) {
    var sizeInput = variantRows[i].querySelector('.size-input');
    var colorInput = variantRows[i].querySelector('.color-input');
    var quantityInput = variantRows[i].querySelector('.quantity-input');

    // Validate Size field
    if (sizeInput.value.trim() === '' || !/^[a-zA-Z0-9]+$/.test(sizeInput.value)) {
      displayErrorMessage(sizeInput, 'Please fill this field correctly');
      isValid = false;
    }

    // Validate Color field
    if (colorInput.value.trim() === '' || !/^[a-zA-Z]+$/.test(colorInput.value)) {
      displayErrorMessage(colorInput, 'Please fill this field with alphabet');
      isValid = false;
    }

    // Validate Quantity field
    if (quantityInput.value.trim() === '' || !/^\d+$/.test(quantityInput.value) || parseInt(quantityInput.value) <= 0) {
      displayErrorMessage(quantityInput, 'Please fill this field with positive number');
      isValid = false;
    }
  }

  
});

// Add event listener to remove variant buttons


