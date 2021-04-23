package it.unisa.model;

import java.util.ArrayList;
import java.util.List;



public class Cart {

	private List<ItemOrder> products;

	public Cart() {
		products = new ArrayList<ItemOrder>();
	}

	public void addProduct(ProductBean product) {

		ItemOrder order;
		for (int i = 0; i < products.size(); i++) {
			order = (ItemOrder) products.get(i);
			if (order.getId() == product.getId()) {
				order.incrementNumItems();
				return;
			}
		}
		ItemOrder newOrder = new ItemOrder(product);
		products.add(newOrder);

	}

	public void deleteProduct(ProductBean product) {
		setNumOrdered(product, 0);
	}

	public synchronized void setNumOrdered(ProductBean product, int numOrdered) {
		ItemOrder order;
		for (int i = 0; i < products.size(); i++) {
			order = (ItemOrder) products.get(i);
			if (order.getId()==(product.getId())) {
				if (numOrdered <= 0) {
					products.remove(i);
				} else {
					order.setNumItems(numOrdered);
				}
				return;
			}
		}
		ItemOrder newOrder = new ItemOrder(product);
		products.add(newOrder);
	}



	public List<ItemOrder> getProducts() {
		return products;
	}
}
