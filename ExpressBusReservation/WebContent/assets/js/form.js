function checkBlack(n,s){
    if(n.value.length == 0){
        s.innerHTML="!! empty field not allow";
        s.style.visibility="visible";
        
        return false;
    }else{
        s.style.visibility="hidden";
        return true;
    }
}

    function  checkNumber(n,s){
        var patt=/^[0-9]{16}$/;
        
        if(!n.value.match(patt)){
        s.innerHTML="!!card number must 16 digit and only number";
        s.style.visibility="visible";
        return false;
    }else{
        s.style.visibility="hidden";
        return true;
    }
    }
    
    function  checkDateFormat(n,s){
        var patt=/^\d{2}\-\d{2}$/;
         
        
        if(!n.value.match(patt)){
        s.innerHTML="!!expiry date must mustbe mm-dd format";
        s.style.visibility="visible";
        return false;
    }else{
        s.style.visibility="hidden";
        return true;
    }
    }
    
    function pasLenth(n,s){
    if(n.value.length<5 || n.value.length>15){
        s.innerHTML="!! password must be 5 to 14 digit";
        s.style.visibility="visible";
        
        return false;
    }else{
        s.style.visibility="hidden";
        return true;
    }
}

    function passMach(n1,n2,s){
    if(n1.value != n2.value){
        s.innerHTML="!! password not match";
        s.style.visibility="visible";
        
        return false;
    }else{
        s.style.visibility="hidden";
        return true;
    }
}

//function mobileNo(){
//    var mnu = document.getElementById("mnun");
//    
//    var span1 = document.getElementById("sp1");
//    checkBlack(mnu,span1);
//    
//    if(checkBlack(mnu,span1) && checkNumber(mnu,span1)){
//        return true;
//    }else{
//        return false;
//    }
//    
//}


function m1(){
    var cardNumder = document.getElementById("cardNumber");
    var exDate = document.getElementById("exDate");
//    var pas2 = document.getElementById("ps2");
    
    
    var span1 = document.getElementById("sp1");
    var span2 = document.getElementById("sp2");
//    var span3 = document.getElementById("sp3");
    
    
    
//    if(checkBlack(mnu,span1) && checkNumber(mnu,span1) && pasLenth(pas1,span2) && passMach(pas1,pas2,span3)){
//        return true;
//    }else{
//        return false;
//    }
    
    if(checkBlack(cardNumder,span1) && checkNumber(cardNumder,span1) && checkBlack(exDate,span2) &&checkDateFormat(exDate,span2) ){
        return true;
    }else{
        return false;
    }
    
}

