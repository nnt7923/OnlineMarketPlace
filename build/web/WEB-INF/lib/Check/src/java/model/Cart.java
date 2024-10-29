package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private int cartId;
    private Account account;
    private List<CartDetail> items = new ArrayList<>();

    public Cart() {
        items = new ArrayList<>();
    }

    public List<CartDetail> getItems() {
        return items;
    }

    public void setItems(List<CartDetail> items) {
        this.items = items;
    }

    public Cart(int cartId, Account account, List<CartDetail> items) {
        this.cartId = cartId;
        this.account = account;
        this.items = items;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", account=" + account + ", items=" + items + '}';
    }

    public CartDetail getItemByProductDetailId(int productDetailId) {
        for (CartDetail i : items) {
            if (i.getPd().getId() == productDetailId) {
                return i;
            }
        }
        return null;
    }

    public void removeItem(int productDetailId) {
        CartDetail item = getItemByProductDetailId(productDetailId);
        if (item != null) {
            items.remove(item);
        }
    }

    private ProductDetails getProductById(int id, List<ProductDetails> list) {
        for (ProductDetails i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<ProductDetails> productList) {
        this();
        if (txt != null && !txt.isEmpty()) {
            String[] parts = txt.split(",");
            for (String part : parts) {
                String[] idAndQuantity = part.split(":");
                try {
                    int id = Integer.parseInt(idAndQuantity[0]);
                    int quantity = Integer.parseInt(idAndQuantity[1]);
                    ProductDetails pd = getProductById(id, productList);
                    items.add(new CartDetail(id, quantity, pd));
                } catch (NumberFormatException e) {
                }
            }
        }
    }

    public int getCartSize() {
        return items.size();
    }

    public double getTotallMoney(List<ProductDetails> listDC) {
        double total = 0;
        for (CartDetail item : items) {
            int quantity = item.getQuantity();
            float priceDiscount = findPriceDiscount(listDC, item.getPd().getId());
            if (priceDiscount > 0) {
                total += quantity * priceDiscount;
            } else {
                total += quantity * item.getPd().getProduct().getPrice(); // S? d?ng giá g?c n?u không có giá gi?m
            }
        }
        return total;
    }

    public double getTotalMoney() {
        double total = 0;
        for (CartDetail item : items) {
            int quantity = item.getQuantity();
            ProductDetails productDetail = item.getPd();
            float priceDiscount = productDetail.getPriceDiscount();
            if (priceDiscount > 0) {
                total += quantity * priceDiscount;
            } else {
                total += quantity * productDetail.getProduct().getPrice(); // S? d?ng giá g?c n?u không có giá gi?m
            }
        }
        return total;
    }

    // Ph??ng th?c ?? tìm giá gi?m c?a s?n ph?m trong danh sách listDC
    private float findPriceDiscount(List<ProductDetails> listDC, int productId) {
        for (ProductDetails pd : listDC) {
            if (pd.getId() == productId) {
                return pd.getPriceDiscount();
            }
        }
        return 0;
    }

    public float getPriceDiscount(List<ProductDetails> listDC, int productId) {
        return findPriceDiscount(listDC, productId);
    }

    public String[] getProductImage(int productId) {
        for (CartDetail item : items) {
            if (item.getPd().getProduct().getProductId() == productId) {
                return item.getPd().getImage();
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        for (CartDetail item : items) {
            if (item.getPd().getId() == id) {
                return item.getQuantity();
            }
        }
        return 0;
    }

    public double getTotalPriceById(List<ProductDetails> listDC, int id) {
        double totalPrice = 0;
        for (CartDetail item : items) {
            if (item.getPd().getId() == id) {
                int quantity = item.getQuantity();
                float priceDiscount = findPriceDiscount(listDC, item.getPd().getId());
                if (priceDiscount > 0) {
                    totalPrice += quantity * priceDiscount;
                } else {
                    totalPrice += quantity * item.getPd().getPriceDiscount();
                }
            }
        }
        return totalPrice;
    }

    public void addItem(CartDetail t) {
        CartDetail existingItem = getItemByProductDetailId(t.getPd().getId());
        if (existingItem != null) {
            int newQuantity = existingItem.getQuantity() + t.getQuantity();
            if (newQuantity <= t.getPd().getQuantity()) {
                existingItem.setQuantity(newQuantity);
            } else {
                existingItem.setQuantity(t.getPd().getQuantity());
            }
        } else {
            items.add(t);
        }
        System.out.println("Adding item with Product Detail ID: " + t.getPd().getId());

    }

    public void updateQuantity(int productDetailId, int quantity) {
        for (CartDetail item : items) {
            if (item.getPd().getId() == productDetailId) {
                int newQuantity = item.getQuantity() + quantity;
                if (newQuantity <= 0) {
                    items.remove(item); // Xóa n?u s? l??ng b?ng 0 ho?c âm
                } else if (newQuantity > item.getPd().getQuantity()) {
                    item.setQuantity(item.getPd().getQuantity()); // Gi?i h?n s? l??ng theo t?n kho
                } else {
                    item.setQuantity(newQuantity);
                }
                return;
            }
        }
    }

    public double getTotalPriceById(int id) {
        double totalPrice = 0;
        for (CartDetail item : items) {
            if (item.getPd().getId() == id) {
                int quantity = item.getQuantity();
                float priceDiscount = item.getPd().getPriceDiscount();
                if (priceDiscount > 0) {
                    totalPrice += quantity * priceDiscount;
                } else {
                    totalPrice += quantity * item.getPd().getProduct().getPrice();
                }
            }
        }
        return totalPrice;
    }

    public void clear() {
        items.clear();
    }

    public void replaceItem(int oldProductDetailId, CartDetail newItem) {
        removeItem(oldProductDetailId);
        addItem(newItem);
    }

}
