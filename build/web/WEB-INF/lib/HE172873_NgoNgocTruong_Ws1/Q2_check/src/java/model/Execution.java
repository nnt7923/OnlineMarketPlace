package model;

public class Execution {
    private static int idCounter = 1;

    private int id;
    private String array;
    private String option;
    private String result;

    public Execution(String array, String option, String result) {
        this.id = idCounter++;
        this.array = array;
        this.option = option;
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public String getArray() {
        return array;
    }

    public void setArray(String array) {
        this.array = array;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
