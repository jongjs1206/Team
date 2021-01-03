$(function(){
var monthsalearray = new Array();
	monthsalearray.push(['Month', '']);
var daysalearray = new Array();
	daysalearray.push(['Day', '매출']);
var monthsalecountarray = new Array();
	monthsalecountarray.push(['Month', '판매량']);
var catecountarray = new Array();
	catecountarray.push(['카테고리', '판매량']);
var topfivearray = new Array();
	topfivearray.push(['상품', '인기량']);

//월매출,일매출, 회원유지율 구하기
		$.ajax({
					type : 'post',
					async : true,
					url : 'getmaindata.do',
			//		dataType : 'text',
					dataType : 'json',
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
						console.log(data["monthtotalprice"]);
						console.log(data["daytotalprice"]);
						console.log(data["userkeeprate"]);
						console.log(typeof data);
						
						$('#monthtotalprice').val(data["monthtotalprice"]);
						$('#daytotalprice').val(data["daytotalprice"]);
						$('#userkeeprate').val(data["userkeeprate"]+'%');
						
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
			});

//월별 매출 
//var monthlysales;

		$.ajax({
					type : 'post',
					async : true,
					url : 'getmonthsalesdata.do',
			//		dataType : 'text',
					dataType : 'json',
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
						console.log(data);
						console.log(typeof data);
						for (var i = 0; i < data.length ; i++){
							//console.log(data[i]);
							// 	console.log(data[i]["TOTALPRICE"]);
							//	console.log(data[i]["MONTH_DATE"]);
								monthsalearray.push([data[i]["MONTH_DATE"],data[i]["TOTALPRICE"]]);
								monthsalecountarray.push([data[i]["MONTH_DATE"],data[i]["COUNT"]]);
							}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
			});
			
//일별 매출 
		$.ajax({
					type : 'post',
					async : true,
					url : 'getdaysalesdata.do',
			//		dataType : 'text',
					dataType : 'json',
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
						console.log(data);
						console.log(typeof data);
						for (var i = 0; i < data.length ; i++){
							//console.log(data[i]);
							 	console.log(data[i]["PRICE"]);
								console.log(data[i]["DAY_DATE"]);
							
							
								daysalearray.push([data[i]["DAY_DATE"],data[i]["PRICE"]]);
							//	console.log(data[i]["PRICE"]);
							//	if (isNaN(data[i]["PRICE"])) { // 값이 없어서 NaN값이 나올 경우
								//}else{
								//monthlysales = monthlysales + Number(data[i]["PRICE"]);
								//}
							}
							//console.log(data[0]["PRICE"]+data[1]["PRICE"]);
							//console.log(monthlysales);
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
			});
// 카테고리별 판매량
		$.ajax({
					type : 'post',
					async : true,
					url : 'getcategorycount.do',
			//		dataType : 'text',
					dataType : 'json',
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
						//console.log(data);
						//console.log(typeof data);
						for (var i = 0; i < data.length ; i++){
							//console.log(data[i]);
							 //	console.log(data[i]["CATE"]);
							//	console.log(data[i]["COUNT"]);
								catecountarray.push([data[i]["CATE"],data[i]["COUNT"]]);
							}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
			});
//top5 판매량
		$.ajax({
					type : 'post',
					async : true,
					url : 'gethitfivepname.do',
			//		dataType : 'text',
					dataType : 'json',
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
						//console.log(data);
						//console.log(typeof data);
						for (var i = 0; i < data.length ; i++){
							//console.log(data[i]);
							 //	console.log(data[i]["PNAME"]);
							//	console.log(data[i]["COUNT"]);
								topfivearray.push([data[i]["PNAME"],data[i]["COUNT"]]);
							}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
			});
		//console.log(monthsalearray);
		//console.log(daysalearray);
		//console.log(monthsalecountarray);
		//console.log(catecountarray);
		//console.log(topfivearray);
//월별 매출 차트
 google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
function drawChart() {
        var data = google.visualization.arrayToDataTable(monthsalearray);
        var options = {
          chart: {
            title: ' ',
            subtitle: '',
              height: 800
          },
         height: 300,
      //  backgroundColor: '#6f879c',
       // colors: ['#FFCC00', '#FFCC00']
        };
        var chart = new google.charts.Bar(document.getElementById('monthsalearray'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
// 일별 매출 차트
google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(DaydrawChart);
function DaydrawChart() {
        var data = google.visualization.arrayToDataTable(daysalearray);
        var options = {
        chart: {
            title: ' ',
            subtitle: '',
              height: 800
          },
          hAxis: {
          title: '',
          logScale: true

        },	
         height: 500,
         width: 1030,
      //  backgroundColor: '#6f879c',
      //  colors: ['#FFCC00', '#FFCC00']
        };
        var chart = new google.visualization.LineChart(document.getElementById('daysalearray'));
        chart.draw(data, options);
      }

//월별 판매량 차트
 google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(MonthCountdrawChart);
function MonthCountdrawChart() {
        var data = google.visualization.arrayToDataTable(monthsalecountarray);
        var options = {
          chart: {
            title: ' ',
            subtitle: '',
              height: 800
          },
         height: 300,
      //  backgroundColor: '#6f879c',
       // colors: ['#FFCC00', '#FFCC00']
        };
        var chart = new google.charts.Bar(document.getElementById('monthsalecountarray'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
//카테고리별 판매량 차트 
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(cateCountdrawBasic);

function cateCountdrawBasic() {

      var data = google.visualization.arrayToDataTable(catecountarray);

      var options = {
        title: '',
        chartArea: {},
     //   hAxis: {
     //     title: '',
     //     minValue: 0
    //    },
        height: 300,
        width : 470
      //  vAxis: {
       //   title: ''
     //   }
      };

      var chart = new google.visualization.BarChart(document.getElementById('catecountarray'));

      chart.draw(data, options);
    }
//TOP 5 인기상품 
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(topfivedrawChart);

      function topfivedrawChart() {

        var data = google.visualization.arrayToDataTable(topfivearray);

        var options = {
          title: '',
          height: 300
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }




});

