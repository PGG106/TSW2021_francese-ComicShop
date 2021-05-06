package it.unisa.model;



/** Associates a catalog Item with a specific order by
 *  keeping track of the number ordered and the total price.
 *  Also provides some convenience methods to get at the
 *  CatalogItem data without extracting the CatalogItem
 *  separately.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */

public class ItemOrder {
  private ProductBean item;
  private int numItems;

  public ItemOrder(ProductBean item) {
    setItem(item);
    setNumItems(1);
  }

  public ProductBean getItem() {
    return(item);
  }

  protected void setItem(ProductBean item) {
    this.item = item;
  }

  public int getId() {
    return(getItem().getId());
  }

  public String getDescrizione() {
    return(getItem().getDescrizione());
  }

  public String getNome() {
	  return(getItem().getNome());
  }
  
  
  public double getPrezzo() {
    return(Math.round(getItem().getPrezzo()*100.0))/100.0;
  }
  
  public int getNumItems() {
    return(numItems);
  }

  public void setNumItems(int n) {
    this.numItems = n;
  }

  public void incrementNumItems() {
    setNumItems(getNumItems() + 1);
  }

  public void cancelOrder() {
    setNumItems(0);
  }

  public double getTotalCost() {
    return(getNumItems() * getPrezzo());
  }
}