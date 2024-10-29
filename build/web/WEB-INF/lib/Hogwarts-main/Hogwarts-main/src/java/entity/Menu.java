package entity;

public class Menu {
    private String menuID;
    private String food;

    public Menu() {
    }

    public Menu(String menuID, String food) {
        this.menuID = menuID;
        this.food = food;
    }

    public String getMenuID() {
        return menuID;
    }

    public void setMenuID(String menuID) {
        this.menuID = menuID;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }
}
