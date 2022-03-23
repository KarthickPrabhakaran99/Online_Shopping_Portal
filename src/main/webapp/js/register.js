



// Getting the tags
const username = document.getElementById("typeNameX");
const password = document.getElementById("typePasswordX");
const confirmPassword = document.getElementById("typeConfirmPasswordX");
const email = document.getElementById("typeEmailX");
const usernameError = document.getElementById("nameError");
const passwordError = document.getElementById("PasswordError");
const confirmPasswordError = document.getElementById("ConfirmPasswordError");
const emailError = document.getElementById("emailError");
const signUp = document.getElementById("SignUp");
const radioUser = document.getElementById("RadioUser");
const radioAdmin = document.getElementById("RadioAdmin");
let x = Math.random();
// console.log(radioUser.checked);
// console.log(radioAdmin.checked);

// Listener for name field
username.addEventListener("input", function (e) {
  var regex = /^[a-zA-Z ]{2,30}$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    usernameError.style.display = "block";
    username.style.boxShadow = "0 0 5px 5px red";
    email.disabled = true;
    password.disabled = true;
    confirmPassword.disabled = true;
  } else {
    usernameError.style.display = "none";
    username.style.boxShadow = "0 0 0 0";
    email.disabled = false;
    password.disabled = false;
    confirmPassword.disabled = false;
  }
});
// Listener for password field
password.addEventListener("input", function (e) {
  var regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    passwordError.style.display = "block";
    password.style.boxShadow = "0 0 5px 5px red";
    email.disabled = true;
    username.disabled = true;
    confirmPassword.disabled = true;
  } else {
    passwordError.style.display = "none";
    password.style.boxShadow = "0 0 0 0 ";
    email.disabled = false;
    username.disabled = false;
    confirmPassword.disabled = false;
  }
});
// Listener for confirmPassword field
confirmPassword.addEventListener("input", function (e) {
  var regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    confirmPasswordError.style.display = "block";
    confirmPassword.style.boxShadow = "0 0 5px 5px red";
    email.disabled = true;
    username.disabled = true;
    password.disabled = true;
  } else {
    confirmPasswordError.style.display = "none";
    confirmPassword.style.boxShadow = "0 0 0 0";
    email.disabled = false;
    username.disabled = false;
    password.disabled = false;
  }
});

// Listener for email field
email.addEventListener("input", function (e) {
  var regex =
    /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    emailError.style.display = "block";
    email.style.boxShadow = "0 0 5px 5px red";
    confirmPassword.disabled = true;
    username.disabled = true;
    password.disabled = true;
  } else {
    emailError.style.display = "none";
    email.style.boxShadow = "0 0 0 0";
    confirmPassword.disabled = false;
    username.disabled = false;
    password.disabled = false;
  }
});

//  Submit Form
signUp.addEventListener("click", saveMessage);


function saveMessage(e) {
  console.log(username.value,email.value,password.value,confirmPassword.value);
  if (
    username.value &&
    email.value  &&
    password.value  &&
    confirmPassword.value && (radioAdmin.checked || radioUser.checked)
  ) {
   
   // e.preventDefault();
    

    if (password.value === confirmPassword.value) {
      
      let random = Math.floor(Math.random() * 10000000 + 1);

     
    } else {
      alert("The password not matching");
      password.value = "";
      confirmPassword.value = "";
    }
  } else {
    alert("Please fill all the required fields");
  }
}
