$(function(){
	let count = 0;
		let costPrice = 0;
		let totalSalePrice = 0;
		let totalDelivery = 0;
		let totalPoint = 0;
		let totalPrice = 0;
		let idx = 0;
		
		let totalNo = new Array();
		
		// 선택 삭제 클릭
		$('.del').click(function() {
			
		let cartNo = $('input:checkbox:checked').val();
		let checkbox = $('input:checkbox:checked');
		
		console.log("cartNo : "+cartNo);
		
		if(cartNo == null){
			alert('선택된 상품이 없습니다.');
			return;
		}
		
		$.ajax({
			url : '/Kmarket/product/deleteCart.do',
			method : 'get',
			data : {"cartNo":cartNo},
			dataType : 'json',
			success : function(data) {
				console.log("data : "+data.result);
				if(data.result == 1){
					alert('삭제되었습니다.');
					checkbox.parent().parent().remove();
					
					count -= 1;
					
					let price = $(this).next().val();
					costPrice -= parseInt(price)*count;
					
					let sellPrice = $(this).next().next().val();
					totalSalePrice -= parseInt(sellPrice);
					
					let delivery = $(this).next().next().next().val();
					totalDelivery -= parseInt(delivery);
					
					let point = $(this).next().next().next().next().val();
					totalPoint -= parseInt(point);
					
					let total = $(this).next().next().next().next().next().val();
					totalPrice -= parseInt(total);
					
					
					console.log(costPrice);
					$('.productCount_span').text(count.toLocaleString());
					$('.costPrice_span').text(costPrice*count);
					$('.totalDelivery_span').text(totalDelivery);
					$('.totalPoint_span').text(totalPoint);
					$('.totalPrice_span').text(totalPrice);
					$('.totalSale_span').text(totalSalePrice);
					
					return true;
				}else {
					alert('실패하였습니다.');
					return false;
				}
			}
			
		});
		});
			
		//alert('삭제하시겠습니까?');
		
	
		// 전체 선택 체크박스
		$(document).on('click','.chk',function(){
			if($('input[name=all]').is(':checked')){
				$('input[name=cartNo]').prop('checked', true);
				
				let uid = $(this).next().val();
				
				$.ajax({
					url:'/Kmarket/product/cart.do',
					method:'post',
					data: { "uid":uid },
					dataType:"json",
					success: function(data){
						
						count = parseInt(data.totalCount);
						costPrice = parseInt(data.costPrice);
						totalSalePrice = data.totalSalePrice;
						totalDelivery = data.totalDelivery;
						totalPoint = data.totalPoint;
						totalPrice = data.totalPrice;
						
						$('.productCount_span').text(count);
						$('.costPrice_span').text(costPrice);
						$('.totalDelivery_span').text(totalDelivery);
						$('.totalPoint_span').text(totalPoint);
						$('.totalPrice_span').text(totalPrice);
						$('.totalSale_span').text(totalSalePrice);
					}
					
				});
				
			}else{
				$('input[name=cartNo]').prop('checked', false);
				
				count = 0; 
				costPrice = 0;				
				totalSalePrice = 0;
				totalDelivery = 0;
				totalPoint = 0;
				totalPrice = 0;
				
				$('.productCount_span').text(count);
				$('.costPrice_span').text(costPrice);
				$('.totalDelivery_span').text(totalDelivery);
				$('.totalPoint_span').text(totalPoint);
				$('.totalPrice_span').text(totalPrice);
				$('.totalSale_span').text(totalSalePrice);
			}
		});
	
		
		// 장바구니 품목 당 체크박스
		$('input[name=cartNo]').change(function(){
			if($(this).prop('checked')){
				
				count += 1;
				let cartNo = $(this).val();
				
				let price = $(this).next().val();
				costPrice += parseInt(price);
				
				let sellPrice = $(this).next().next().val();
				totalSalePrice += parseInt(sellPrice);
				
				let delivery = $(this).next().next().next().val();
				totalDelivery += parseInt(delivery);
				
				let point = $(this).next().next().next().next().val();
				totalPoint += parseInt(point);
				
				let total = $(this).next().next().next().next().next().val();
				totalPrice += parseInt(total);
				
				$('.productCount_span').text(count);
				$('.costPrice_span').text(costPrice);
				$('.totalDelivery_span').text(totalDelivery);
				$('.totalPoint_span').text(totalPoint);
				$('.totalPrice_span').text(totalPrice);
				$('.totalSale_span').text(totalSalePrice);
				
				totalNo.push(cartNo);
			}else {

				count -= 1;
				let cartNo = $(this).val();
				
				let price = $(this).next().val();
				costPrice -= parseInt(price);
				
				let sellPrice = $(this).next().next().val();
				totalSalePrice -= parseInt(sellPrice);
				
				let delivery = $(this).next().next().next().val();
				totalDelivery -= parseInt(delivery);
				
				let point = $(this).next().next().next().next().val();
				totalPoint -= parseInt(point);
				
				let total = $(this).next().next().next().next().next().val();
				totalPrice -= parseInt(total);
				
				$('.productCount_span').text(count);
				$('.costPrice_span').text(costPrice);
				$('.totalDelivery_span').text(totalDelivery);
				$('.totalPoint_span').text(totalPoint);
				$('.totalPrice_span').text(totalPrice);
				$('.totalSale_span').text(totalSalePrice);
				
				idx = totalNo.indexOf(cartNo);
				
				totalNo.splice(idx, 1);
				
				// count = 0 일때 전체 체크박스 해제
				if(count == 0){
					$('input[name=all]').prop('checked',false);
				}
			}
		});
		
		/*
		$('.cart > form').submit(function(e){
			e.preventDefault();
			
			console.log(totalNo);
			
			$.ajax({
				url:'/Kmarket/product/order.do',
				method:'post',
				traditional: true,
				data: JSON.stringify(totalNo),
				dataType:'json',
				success: function(data){
					
				}
			});
			
		});
		*/		
})