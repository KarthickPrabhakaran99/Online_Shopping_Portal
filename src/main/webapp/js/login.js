// Firebase connection


// Reference variables
const email = document.getElementById('typeEmailX');
const emailError = document.getElementById('emailError');
const password = document.getElementById('typePasswordX');
const loginButton = document.getElementById('loginButton');


const userIdentifier = document.getElementById('UserIdentifier');
const accountID = document.getElementById('AccountID');

email.addEventListener('input',function(e){
    var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    
    if(!regex.test(e.target.value)){
  
        emailError.style.display = 'block';
        email.style.boxShadow ="0 0 5px 5px red";
        password.disabled = true;
        
    }
    else{
        emailError.style.display = 'none';
        email.style.boxShadow ="0 0 0 0 ";
        password.disabled = false;   
    }
})

