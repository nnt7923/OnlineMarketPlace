package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private int customerId;
    private int amount;
    private List<ProductDetails> items = new ArrayList<>();

// Constructor m?c ??nh
    public Cart() {
        items = new ArrayList<>();
    }

    // Constructor v?i tham s?
    public Cart(int customerId) {
        this.customerId = customerId;
        this.items = new ArrayList<>();
    }

    // Getter và Setter
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public List<ProductDetails> getItems() {
        return items;
    }

    public void setItems(List<ProductDetails> items) {
        this.items = items;
    }

    // L?y m?t ProductDetail theo productDetailId|
    public ProductDetails getItemByProductDetailId(int productDetailId) {
        for (ProductDetails item : items) {
            if (item.getId() == productDetailId) {
                return item;
            }
        }
        return null;
    }

    // Thêm s?n ph?m vào gi? hàng
    public void addItem(ProductDetails productDetail, int amount) {
        for (ProductDetails item : items) {
            if (item.getId() == productDetail.getId()) {
                item.setQuantity(item.getQuantity() + amount); // N?u s?n ph?m ?ã t?n t?i, c?p nh?t s? l??ng
                return;
            }
        }
        productDetail.setQuantity(amount); // Thi?t l?p s? l??ng cho s?n ph?m m?i
        items.add(productDetail); // N?u s?n ph?m ch?a t?n t?i, thêm vào danh sách
    }

    // Xóa s?n ph?m kh?i gi? hàng
    public void removeItem(int productDetailId) {
        items.removeIf(item -> item.getId() == productDetailId);
    }

    // L?y s?n ph?m theo productDetailId t? danh sách s?n ph?m
    private ProductDetails getProductById(int id, List<ProductDetails> productList) {
        for (ProductDetails product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    // Constructor kh?i t?o t? chu?i text ch?a danh sách s?n ph?m
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
                    pd.setQuantity(quantity);
                    items.add(pd);
                } catch (NumberFormatException e) {
                    e.printStackTrace(); // Thêm x? lý l?i n?u c?n
                }
            }
        }
    }

    // L?y kích th??c gi? hàng
    public int getCartSize() {
        return items.size();
    }

    // Tính t?ng ti?n trong gi? hàng có tính giá gi?m t? ProductDetails
    public double getTotalMoney() {
        double total = 0;
        for (ProductDetails item : items) {
            int quantity = item.getQuantity();
            float priceDiscount = item.getPriceDiscount();
            if (priceDiscount > 0) {
                total += quantity * priceDiscount;
            } else {
                total += quantity * item.getProduct().getPrice();
            }
        }
        return total;
    }

    // L?y hình ?nh c?a s?n ph?m theo productId
    public String[] getProductImage(int productId) {
        for (ProductDetails item : items) {
            if (item.getProduct().getProductId() == productId) {
                return item.getImage();
            }
        }
        return null;
    }

    // L?y s? l??ng s?n ph?m trong gi? hàng theo productDetailId
    public int getQuantityById(int productDetailId) {
        for (ProductDetails item : items) {
            if (item.getId() == productDetailId) {
                return item.getQuantity();
            }
        }
        return 0;
    }

    // Tính t?ng ti?n cho m?t s?n ph?m c? th? trong gi? hàng
    public double getTotalPriceById(int productDetailId) {
        double totalPrice = 0;
        for (ProductDetails item : items) {
            if (item.getId() == productDetailId) {
                int quantity = item.getQuantity();
                float priceDiscount = item.getPriceDiscount();
                if (priceDiscount > 0) {
                    totalPrice += quantity * priceDiscount;
                } else {
                    totalPrice += quantity * item.getProduct().getPrice();
                }
            }
        }
        return totalPrice;
    }

    // C?p nh?t s? l??ng s?n ph?m trong gi? hàng
    public void updateQuantity(int productDetailId, int amount) {
        for (ProductDetails item : items) {
            if (item.getId() == productDetailId) {
                item.setQuantity(amount);
                if (item.getQuantity() <= 0) {
                    items.remove(item); // Xóa s?n ph?m n?u s? l??ng là 0
                }
                return;
            }
        }
    }

    // C?p nh?t chi ti?t s?n ph?m trong gi? hàng
    public void updateItem(int oldProductDetailId, int newProductDetailId, String newColor, String newCriteria, ProductDetails newPd) {
        for (ProductDetails item : items) {
            if (item.getId() == oldProductDetailId) {
                item.setId(newProductDetailId);
                item.setColor(newColor);
                item.setCriteria(newCriteria);
                item.setPriceDiscount(newPd.getPriceDiscount());
                item.setPriceDiscount(newPd.getPriceDiscount());
                return;
            }
        }
    }

    // Xóa t?t c? s?n ph?m trong gi? hàng
    public void clear() {
        items.clear();
    }

    // Thay th? s?n ph?m c? b?ng s?n ph?m m?i
    public void replaceItem(int oldProductDetailId, ProductDetails newItem) {
        removeItem(oldProductDetailId);
        addItem(newItem, newItem.getQuantity());
    }

}
