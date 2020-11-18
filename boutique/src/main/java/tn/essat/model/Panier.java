package tn.essat.model;

import java.util.List;

public class Panier {
private List<LignePanier> lignes ;
public void addPanier(LignePanier li) {
	this.lignes.add(li);
}
public Panier(List<LignePanier> lignes) {
	super();
	this.lignes = lignes;
}

public Panier() {
	super();
}
public List<LignePanier> getLignes() {
	return lignes;
}
public void setLignes(List<LignePanier> lignes) {
	this.lignes = lignes;
}


}
