package model;

public class product {

    String p_id;
    String p_name;
    String p_image;
    String p_cost;
    String p_details;
    String p_cat;

    public String getP_id() {
        return p_id;
    }

    public String getP_cat() {
        return p_cat;
    }

    public void setP_cat(String p_cat) {
        this.p_cat = p_cat;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_image() {
        return p_image;
    }

    public void setP_image(String p_image) {
        this.p_image = p_image;
    }

    public String getP_cost() {
        return p_cost;
    }

    public void setP_cost(String p_cost) {
        this.p_cost = p_cost;
    }

    public String getP_details() {
        return p_details;
    }

    public void setP_details(String p_details) {
        this.p_details = p_details;
    }

}
