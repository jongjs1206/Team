$(document).ready(function(){
	var mile = $('.mile').val();
	var all_total=$('.all_total').val();
	$('#total_addpay_price_view').html(comma(all_total));
	
	$('#input_mile').keyup(function() {
		if($(this).val()==""){
			$('#total_addpay_price_view').html(comma(all_total));
		}else if(parseInt($(this).val())>mile){
        	alert("기존 적립금보다 높은 수를 입력했습니다.");
        	$(this).val("");
        	$('#total_addpay_price_view').html(comma(all_total));
       	}else if(parseInt($(this).val())>mile){
       		$(this).val(all_total);
       		$('#total_addpay_price_view').html(0);
       	}else{
       		$('#total_addpay_price_view').html(comma(parseInt($('.all_total').val())-parseInt($(this).val())));
       	}
    });
    
    $('.t_btn').click(function(){
    	if(parseInt(all_total)>mile){
    		$('#input_mile').val(mile);
    		$('#total_addpay_price_view').html(comma(parseInt(all_total)-parseInt(mile)));
    	}else{
    		$('#input_mile').val(mile);
    		$('#total_addpay_price_view').html(0);
    	}
    });
    
   
    
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    
     function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
});