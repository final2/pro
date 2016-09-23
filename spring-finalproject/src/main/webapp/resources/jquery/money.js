// 숫자 천단위 콤마 추가
	function isNumeric(num, opt){
		  num = String(num).replace(/^\s+|\s+$/g, "");
		  if(typeof opt == "undefined" || opt == "1"){
		    var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		  }else if(opt == "2"){
		    var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		  }else if(opt == "3"){
		    var regex = /^[0-9]+(\.[0-9]+)?$/g;
		  }else{
		    var regex = /^[0-9]$/g;
		  }
		  if( regex.test(num) ){
		    num = num.replace(/,/g, "");
		    return isNaN(num) ? false : true;
		  }else{ return false;  }
		}
		 
		function getNumeric(str, opt){
		  if(isNumeric(str, opt)){
		    str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
		    return Number(str);
		  }else{
		    return str;
		  }
		}
		
	function formatNumber(str, opt){
		  var rstr = "", sign = "";
		  if(isNumeric(str, opt)){
		    str = String(getNumeric(str, opt));
		    if(str.substr(0, 1) == "-" ){
		      sign = "-";
		      str = str.substr(1);
		    }
		    var arr = str.split(".");
		    for(var ii = 0 ; ii < arr[0].length ; ii++){
		      if( ii % 3 == 0 && ii > 0){
		        rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + "," + rstr;
		      }else{
		        rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + rstr;
		      }
		    }
		    rstr = sign + rstr;
		    return arr.length > 1 ? rstr + "." + arr[1] : rstr;
		  }else{
		    return str;
		  }
		}