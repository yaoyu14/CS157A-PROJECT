package admin.model;

public class AdminModel {



	protected int cocktail_id;
    protected String ctName;
    protected int AlcoholContent;
    protected int price;

    public AdminModel() {}

    public AdminModel(int cocktail_id, String ctName, int AlcoholContent, int price) {
        super();
        this.cocktail_id = cocktail_id;
        this.ctName = ctName;
        this.AlcoholContent = AlcoholContent;
        this.price = price;
    }
    
    public AdminModel(String ctName, int AlcoholContent, int price) {
        super();
        this.ctName = ctName;
        this.AlcoholContent = AlcoholContent;
        this.price = price;
    }
    
	public int getCocktail_id() {
		return cocktail_id;
	}

	public void setCocktail_id(int cocktail_id) {
		this.cocktail_id = cocktail_id;
	}
	
	public String getctName() {
		return ctName;
	}

	public void setctName(String ctName) {
		this.ctName = ctName;
	}

	public int getAlcoholContent() {
		return AlcoholContent;
	}

	public void setAlcoholContent(int AlcoholContent) {
		this.AlcoholContent = AlcoholContent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
