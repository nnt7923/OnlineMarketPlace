package entity;

import java.util.Date;

public class ClassCategoryMenu {
    private String cateID;
    private String menuID;
    private String date;
    private String meal;

    public ClassCategoryMenu() {
    }

    public ClassCategoryMenu(String cateID, String menuID, String date, String meal) {
        this.cateID = cateID;
        this.menuID = menuID;
        this.date = date;
        this.meal = meal;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getMenuID() {
        return menuID;
    }

    public void setMenuID(String menuID) {
        this.menuID = menuID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }
}
