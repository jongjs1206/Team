$(function(){
	let temp=$('.quantity_price').html();
	let temp2=$('.em').html();
	var pro_name = $('.pro_name').val();
	var pro_price = $('.pro_price').val();
	var opt_num = new Array();
	var opt_name = new Array();
	var opt_price = new Array();
	var number = new Array();
	var count1=0;
	var count2=0;
	var count3=0;
	var count4=0;
	var check=0;
	
	$('.em').html(comma(temp2));
	
	$('.quantity_price').html(comma(temp));
	$('.QuantityUp').click(function(){
		$('#quantity').val(parseInt($('#quantity').val())+1);
		$('.quantity_price').html(comma(parseInt(temp)*parseInt($('#quantity').val())));
		$('.em').html(comma(parseInt(temp2)*parseInt($('#quantity').val())));
		$('.t_num').html($('#quantity').val());
		$('.p_co').val($('.t_num').html());
	});
	$('.QuantityDown').click(function(){
		if($('#quantity').val()!=1){
			$('#quantity').val(parseInt($('#quantity').val())-1);
			$('.quantity_price').html(comma(parseInt(temp)*parseInt($('#quantity').val())));
			$('.em').html(comma(parseInt(temp2)*parseInt($('#quantity').val())));
			$('.t_num').html($('#quantity').val());
			$('.p_co').val($('.t_num').html());
		}
	});
	
	$('.opt_num').each(function(){
		opt_num[count1]=$(this).val();
		count1++;
	});
	
	$('.opt_name').each(function(){
		opt_name[count2]=$(this).val();
		count2++;
	});
	
	$('.opt_price').each(function(){
		opt_price[count3]=$(this).val();
		count3++;
	});
	
	$('#product_option_id1').change(function(){
		if($("#product_option_id1 option").index($("#product_option_id1 option:selected"))!=0){
			for(let i=0;i<number.length;i++){
				if(parseInt(number[i])==$("#product_option_id1 option").index($("#product_option_id1 option:selected"))){
					check=1;
					alert("이미 선택된 옵션 입니다..");
					break;		
				}
			}
			if(check==0){
				number[count4]=$("#product_option_id1 option").index($("#product_option_id1 option:selected"));
				$('.option_table').append("<tr>"
				+"<td><strong>"+pro_name+"</strong><br>-"+opt_name[number[count4]-2]+"</td>"
				+"<td><span class='quantity'><input id='quantity' value='1' type='text'/> <a href='#none'>"
						+"<img src='resources/images/etc/up.gif'"
						+"class='QuantityUp2 up'/></a> <a href='#none'>"	
						+"<img src='resources/images/etc/down.gif'"
						+"class='QuantityDown2 down' /></a></span>"
						+"<a href='#none' class='delete'><img src='//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif' alt='삭제' id='option_box1_del' class='option_box_del'></a></td>"						
				+"<td class='right'><span class='quantity_price'>"+comma(parseInt(opt_price[number[count4]-2])+parseInt(pro_price))+"</span></td>"
				+"<input type='hidden' value='"+ opt_num[number[count4]-2] +"' name='opnum"+(parseInt(count4)+1)+"'>"
				+"<input type='hidden' value='1' name='opcount"+(parseInt(count4)+1)+"'>"
				+"</tr>"
				
				      );
				$('.t_num').html(parseInt($('.t_num').html())+1);
				$('.p_co').val($('.t_num').html());
				var a = parseInt(uncomma($('.em').html()))+parseInt(opt_price[number[count4]-2])+parseInt(pro_price);
				$('.em').html(comma(a));
				count4++;
			}
		}
		
		check=0;
	});
	
	
	
	$(".option_table").on("click",'.QuantityUp2',function(){
      	var text = $(this).parent().parent().children().eq(0);
      	var price = $(this).parent().parent().parent().parent().children().eq(2).children();
      	var poco = $(this).parent().parent().parent().parent().children().eq(4);
      	poco.val(parseInt(poco.val())+1);
      	text.val(parseInt(text.val())+1);
      	price.html(comma((parseInt(opt_price[number[$('.QuantityUp2').index(this)]-2])+parseInt(pro_price))*text.val()));
      	$('.t_num').html(parseInt($('.t_num').html())+1);
      	$('.p_co').val($('.t_num').html());
      	$('.em').html(comma(parseInt(uncomma($('.em').html()))+parseInt(opt_price[number[$('.QuantityUp2').index(this)]-2])+parseInt(pro_price)));
   })
   
   $(".option_table").on("click",'.QuantityDown2',function(){
     	var text = $(this).parent().parent().children().eq(0);
     	var price = $(this).parent().parent().parent().parent().children().eq(2).children();
		var poco = $(this).parent().parent().parent().parent().children().eq(4);
      	
      	
     	if(text.val()!=1){
     		poco.val(parseInt(poco.val())-1);
      		text.val(parseInt(text.val())-1);
      		price.html(comma((parseInt(opt_price[number[$('.QuantityDown2').index(this)]-2])+parseInt(pro_price))*text.val()));
      		$('.t_num').html(parseInt($('.t_num').html())-1);
      		$('.p_co').val($('.t_num').html());
      		$('.em').html(comma(parseInt(uncomma($('.em').html()))-parseInt(opt_price[number[$('.QuantityDown2').index(this)]-2])-parseInt(pro_price)));
      	}
   })
   
   $(".option_table").on("click",'.delete',function(){
   	  var text = $(this).parent().children().eq(0).children();
   	  var price = $(this).parent().parent().children().eq(2).children();
 	  
   	  for(let i=$('.QuantityDown').index(this);i<number.length-1;i++){
   	  	number[i]=number[i+1];
   	  }
   	  number[number.length-1]=null;
   	  count4--;
   	  $('.t_num').html(parseInt($('.t_num').html())-parseInt(text.val()));
   	  $('.p_co').val($('.t_num').html());
   	  $('.em').html(comma(uncomma($('.em').html())-uncomma(price.html())));
      $(this).parent().parent().empty();
   })
	
	$('.btnstyle').click(function(){
		if($('.p_co').val()=="0"){
			alert('옵션을 선택하세요');
			return false;
		}else{
			var result;
			if($(this).val()=="장바구니")
				result=confirm("장바구니에 담겠습니까?");
			if($(this).val()=="바로구매")
				result=confirm("구매하시겠습니까?");
			if(result==0)
				return false;
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