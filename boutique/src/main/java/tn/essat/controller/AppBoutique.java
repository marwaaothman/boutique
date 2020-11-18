package tn.essat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tn.essat.dao.ICategorieDao;
import tn.essat.dao.IClientDao;
import tn.essat.dao.ICommandeDao;
import tn.essat.dao.ILigneCommandeDao;
import tn.essat.dao.IProduitDao;
import tn.essat.model.Categorie;
import tn.essat.model.Client;
import tn.essat.model.LignePanier;
import tn.essat.model.Panier;
import tn.essat.model.Produit;

@Controller
public class AppBoutique {

	
	@Autowired
	ICategorieDao catdao;

	@Autowired
	IProduitDao proddao;

	@Autowired
	IClientDao cltdao;

	@Autowired
	ICommandeDao cdedao;

	@Autowired
	ILigneCommandeDao licdedao;

	public void setCatdao(ICategorieDao catdao) {
		this.catdao = catdao;
	}

	public void setProddao(IProduitDao proddao) {
		this.proddao = proddao;
	}

	public void setCltdao(IClientDao cltdao) {
		this.cltdao = cltdao;
	}

	public void setCdedao(ICommandeDao cdedao) {
		this.cdedao = cdedao;
	}

	public void setLicdedao(ILigneCommandeDao licdedao) {
		this.licdedao = licdedao;
	}

	@GetMapping("/home")
	public String get1(Model m) {
		List<Categorie> liste1 = catdao.findAll();
		List<Produit> liste2 = proddao.findAll();
		m.addAttribute("cats", liste1);
		m.addAttribute("prods", liste2);
		return "accueil";

	}

	@RequestMapping(value = "/categorie/{id}", method = RequestMethod.GET)
	public String getproduit22(ModelMap model, @PathVariable("id") int id) {
		List<Produit> liste = proddao.getAllProduitByCat(id);
		List<Categorie> listec = catdao.findAll();
		model.addAttribute("prods", liste);
		model.addAttribute("cats", listec);
		return "accueil";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String fotrll(ModelMap model) {
		return "connexion";
	}

	@RequestMapping(value = "/verif", method = RequestMethod.GET)
	public String chercher1(ModelMap model, HttpServletRequest request, HttpSession session) {
		String s1 = request.getParameter("email");
		String s2 = request.getParameter("pass");

		List<Client> liste = cltdao.findAll();
		Client u1 = null;
		for (Client u : liste) {
			if ((u.getEmail().equals(s1)) && u.getPassword().equals(s2))
				u1 = u;
		}

		if (u1 == null)
			return "redirect:/login";
		else {
			session.setAttribute("user", u1);
			return "redirect:/home";
		}

	}

	@RequestMapping(value = "/monpanier", method = RequestMethod.GET)
	public String affichepan(ModelMap model, HttpSession session) {
		List<Categorie> liste1 = catdao.findAll();
		List<Produit> liste2 = proddao.findAll();
		model.addAttribute("cats", liste1);
		model.addAttribute("prods", liste2);
		List<Panier> listepan = (List<Panier>) session.getAttribute("panier");
		model.addAttribute("panier", listepan);
		return "panier";

	}

	@RequestMapping(value = "/addpanier/{id}", method = RequestMethod.GET)
	public String ajouterpanier(ModelMap model, @PathVariable("id") int id, HttpSession session) {
		Produit p = proddao.findOne(id);
		List<LignePanier> panier = (List<LignePanier>) session.getAttribute("panier");

		if (panier == null) {
			List<LignePanier> pan = new ArrayList<LignePanier>();
			pan.add(new LignePanier(p, 1));
			session.setAttribute("panier", pan);

		} else {
			int index = -1;
			for (LignePanier pp : panier) {
				if (pp.getProd().getId() == id) {
					index = panier.indexOf(pp);
				}
			}

			if (index == -1) {
				panier.add(new LignePanier(p, 1));
			} else {
				panier.get(index).setQuantite(panier.get(index).getQuantite() + 1);
			}

			session.setAttribute("panier", panier);

		}

		return "redirect:/monpanier";

	}

	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deletepan(ModelMap model, HttpSession session, @PathVariable("id") int id) {
		List<LignePanier> panier= (List<LignePanier>) session.getAttribute("panier");
		
		int index=-1;
		for(LignePanier pp:panier) {
			if(pp.getProd().getId()==id) {
				index=panier.indexOf(pp);
			}
			
		}
		panier.remove(index);
		
		session.setAttribute("panier", panier);
		
		return "redirect:/monpanier";
		
	}
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String getForm (ModelMap m) {
		Produit p= new Produit();
		m.addAttribute("p",p);
		List<Categorie> liste1 = catdao.findAll();
		List<Produit> liste2 = proddao.findAll();
		m.addAttribute("cats", liste1);
		m.addAttribute("prods", liste2);
		return "formajout";
	}
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String ajouter(ModelMap model, @ModelAttribute Produit p) {
		proddao.save(p);
		return "redirect:/home";
	}
	
	
}
