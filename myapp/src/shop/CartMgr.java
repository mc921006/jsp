package shop;

import java.util.Hashtable;

public class CartMgr {
	

	//Integer : 상품 번호(bean에서 productNo)
	private Hashtable<Integer, OrderBean> hCart = new Hashtable<>();
	
	//Cart Insert
	public void addCart(OrderBean order/*새로운 장바구니로 들어오는 객체*/) {
		int productNo = order.getProductNo();
		int quantity = order.getQuantity(); //주문 수량
		if (quantity > 0) { 
			if (hCart.containsKey(productNo)) { //cart에 기존에 저장된 것 O
				//기존에 저장된 주문객체
				OrderBean temp = hCart.get(productNo);
				//새로운 주문의 수량 + 기존의 주문 수량
				quantity += temp.getQuantity();
				//order 객체에 합쳐진 주문 수량 setter
				order.setQuantity(quantity);
				//카트에 다시 저장하면 기존에 주문객체는 덮어쓰기 된다.
				hCart.put(productNo, order);
			}else { //cart에 기존에 저장된 것 X
				hCart.put(productNo, order);
			}
		}
	}
	
	//Cart Update
	public void updateCart(OrderBean order) {
		int ProductNo = order.getProductNo();
		//동일한 key값은 덮어쓰기가 되는 특징이 있음.
		hCart.put(ProductNo/*Auto Boxing*/, order);
	}
	
	//Cart Delete
	public void deleteCart(OrderBean order) {
		int productNo = order.getProductNo();
		hCart.remove(productNo);
	}
	
	//Cart List
	public Hashtable<Integer, OrderBean> getCartList() {
		return hCart;
	}
}
