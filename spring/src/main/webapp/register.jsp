<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  .container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  .content {
    margin-bottom: 20px;
  }
</style>
</head>
<body>
<div class="container">
  <h2 class="mb-4">Register Form</h2>
  <form action="/register" method="post">
    <div class="content">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" name="username" pattern="[A-Z0-9]{5}"  required>
    
    </div>
    
    <div class="content">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8}" required>
     
    </div>
    
    <div class="content">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" required>
      
    </div>
    
    <div class="content">
      <label for="contact no">Contact No:</label>
      <input type="tel" class="form-control" id="contact no" name="contact no" pattern="[0-9]{10}"  required>
      <small class="form-text text-muted">Format: 10 digits only</small>
    </div>
  
    <button type="submit" class="btn btn-primary">Register</button>
  </form>
</div>
</body>
</html>

    
  <!--  
    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="errorModalLabel">Validation Error</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p id="errorMessage"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function validateForm() {
  var usernameInput = document.getElementById('username');
  var passwordInput = document.getElementById('password');
  var emailInput = document.getElementById('email');
  var contactNoInput = document.getElementById('contactno');


  var password = passwordInput.value.trim();
  var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
  if (!passwordRegex.test(password)) {
    showAlert("Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number.", passwordInput);
    return false;
  }
  
  var email = emailInput.value.trim();
  if (!isValidEmail(email)) {
    showAlert("Please enter a valid email address.", emailInput);
    return false;
  }
  
  var contactNo = contactNoInput.value.trim();
  if (contactNo.length !== 10 || isNaN(contactNo)) {
    showAlert("Please enter a valid 10-digit contact number.", contactNoInput);
    return false;
  }

  return true; 
}

function isValidEmail(email) {
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function showAlert(message, inputField) {
  var errorMessageElement = document.getElementById('errorMessage');
  errorMessageElement.textContent = message;
  $('#errorModal').modal('show');
  inputField.focus();
}
</script> -->



<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  .container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  .content {
    margin-bottom: 20px;
  }
</style>
</head>
<body>
<div class="container">
  <h2 class="mb-4">Register Form</h2>
  <form action="/register" method="post" onsubmit="return validateForm()">
    <div class="content">
      <label for="username">Username:</label>
      <input type="text" class="form-control" id="username" name="username" >
    </div>
    
    <div class="content">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    
    <div class="content">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" >
    </div>
    
    <div class="content">
      <label for="contactno">Contact No:</label>
      <input type="tel" class="form-control" id="contactno" name="contact no" pattern="[0-9]{10}" >
      <small class="form-text text-muted">Format: 10 digits only</small>
    </div>

    <button type="submit" class="btn btn-primary">Register</button>
    
    Modal for displaying errors
    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="errorModalLabel">Validation Error</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p id="errorMessage"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function validateForm() {
  var usernameInput = document.getElementById('username');
  var passwordInput = document.getElementById('password');
  var emailInput = document.getElementById('email');
  var contactNoInput = document.getElementById('contactno');

  var username = usernameInput.value.trim();
  var usernameRegex = /^[A-Z][a-z]{7,}$/;
  if (!usernameRegex.test(username)) {
    showAlert("Username must start with an uppercase letter followed by at least 7 characters.", usernameInput);
    return false;
  }

  var password = passwordInput.value.trim();
  if (password === '') {
    showAlert("Password cannot be empty.", passwordInput);
    return false;
  } else if (password.length < 8) {
    showAlert("Password must be at least 8 characters.", passwordInput);
    return false;
  }
  
  var email = emailInput.value.trim();
  if (!isValidEmail(email)) {
    showAlert("Please enter a valid email address.", emailInput);
    return false;
  }
  
  var contactNo = contactNoInput.value.trim();
  if (contactNo.length !== 10 || isNaN(contactNo)) {
    showAlert("Please enter a valid 10-digit contact number.", contactNoInput);
    return false;
  }

  return true; 
}

function isValidEmail(email) {
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function showAlert(message, inputField) {
  var errorMessageElement = document.getElementById('errorMessage');
  errorMessageElement.textContent = message;
  $('#errorModal').modal('show');
  inputField.focus();
}
</script>

</body>
</html>
 -->