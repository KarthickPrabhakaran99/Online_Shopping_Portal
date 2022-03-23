 function checkLuhn(cardNo)
    {
        let nDigits = cardNo.length;
 
        let nSum = 0;
        let isSecond = false;
        for (let i = nDigits - 1; i >= 0; i--)
        {
 
            let d = cardNo[i].charCodeAt() - '0'.charCodeAt();
 
            if (isSecond == true)
                d = d * 2;
 
            // We add two digits to handle
            // cases that make two digits
            // after doubling
            nSum += parseInt(d / 10, 10);
            nSum += d % 10;
 
            isSecond = !isSecond;
        }
        return (nSum % 10 == 0);
    }

  
const creditCardNumber= document.getElementById("credit-card-number");
const creditCardNumberError= document.getElementById("credit-card-number-error");
const cardName =document.getElementById("credit-card-name");
const cardNameError =document.getElementById("credit-card-name-error");
const cardExpiration =document.getElementById("card-expiration");
const cardExpirationError =document.getElementById("card-expiration-error");
const cardCvv =document.getElementById("credit-card-cvv");
const cardCvvError =document.getElementById("credit-card-cvv-error");
const credit =document.getElementById("credit");
const debit =document.getElementById("debit");
const paypal =document.getElementById("paypal");
const cardLabel =document.getElementById("card-label");


cardName.addEventListener("input", function (e) {
  var regex = /^[a-zA-Z ]{2,30}$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    cardNameError.style.display = "block";
    cardName.style.boxShadow = "0 0 5px 5px red";
    creditCardNumber.disabled = true;
      cardExpiration.disabled = true;
          cardCvv.disabled = true;

  } else {
    cardNameError.style.display = "none";
    cardName.style.boxShadow = "0 0 0 0";
    creditCardNumber.disabled = false;
  cardExpiration.disabled = false;
     cardCvv.disabled = false;
   
  }
});








creditCardNumber.addEventListener('input',function(e){
	 e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
	if(!checkLuhn(e.target.value)){
		console.log(checkLuhn(e.target.value));
		creditCardNumberError.style.display ='block';
		creditCardNumber.style.boxShadow ="0 0 5px 5px red";
		cardName.disabled = true;
		cardExpiration.disabled = true;
		    cardCvv.disabled = true;
	}
	else{
		creditCardNumberError.style.display ='none';
		creditCardNumber.style.boxShadow ="0 0 0 0 ";
		    cardName.disabled = false;
		    cardExpiration.disabled = false;
		       cardCvv.disabled = false;
	}
})


cardExpiration.addEventListener("input", function (e) {
  var regex = /^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    cardExpirationError.style.display = "block";
    cardExpiration.style.boxShadow = "0 0 5px 5px red";
	cardName.disabled = true;
	    creditCardNumber.disabled = true;
	       cardCvv.disabled = true;
  } else {
    cardExpirationError.style.display = "none";
    cardExpiration.style.boxShadow = "0 0 0 0";
cardName.disabled = false;
     creditCardNumber.disabled = false;
        cardCvv.disabled = false;
  }
});

cardCvv.addEventListener("input", function (e) {
  var regex = /^[0-9]{3,4}$/ ;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    cardCvvError.style.display = "block";
    cardCvv.style.boxShadow = "0 0 5px 5px red";
	cardName.disabled = true;
	    creditCardNumber.disabled = true;
	    cardExpiration.disabled= true;
  } else {
    cardCvvError.style.display = "none";
    cardCvv.style.boxShadow = "0 0 0 0";
cardName.disabled = false;
     creditCardNumber.disabled = false;
         cardExpiration.disabled= false;
  }
});

 
credit.addEventListener('change',function(e){
	cardLabel.innerHTML ="Credit Card Number";
	
})
debit.addEventListener('change',function(e){
	 cardLabel.innerHTML ="Debit Card Number";
	
})

