package it.unisa.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class Cart {
	ProductModelDS model;
	private List<ItemOrder> products;

	public Cart() {
		products = new ArrayList<ItemOrder>();
	}

	public void addProduct(int itemID) {

		ItemOrder order;
		for (int i = 0; i < products.size(); i++) {
			order = (ItemOrder) products.get(i);
			if (order.getId() == itemID) {
				order.incrementNumItems();
				return;
			}
		}
		ItemOrder newOrder ;
		try {
			newOrder = new ItemOrder(model.doRetrieveByKey(itemID));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		products.add(newOrder);

	}

	public void deleteProduct(int Id) {
		ItemOrder order;
		for (int i = 0; i < products.size(); i++) {
			order = (ItemOrder) products.get(i);
			if (order.getId() == Id) {
				setNumOrdered(order.getId(),0);
				return;
			}
		}
	}

	public synchronized void setNumOrdered(int Id, int numOrdered) {
		ItemOrder order;
		for (int i = 0; i < products.size(); i++) {
			order = (ItemOrder) products.get(i);
			if (order.getId()==Id) {
				if (numOrdered <= 0) {
					products.remove(i);
				} else {
					order.setNumItems(numOrdered);
				}
				return;
			}
		}
		ItemOrder newOrder ;
		try {
			newOrder = new ItemOrder(model.doRetrieveByKey(Id));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		products.add(newOrder);
	}

public void EmptyCart()
{
	products = new ArrayList<ItemOrder>();
}

	public List<ItemOrder> getProducts() {
		return products;
	}
}
