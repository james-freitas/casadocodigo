package br.com.casadocodigo.loja.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.component.FileSaver;
import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
/*	@Autowired
	private FileSaver fileSaver;*/
	
//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(new ProductValidator());
//	}
	
	
//	@RequestMapping(method = RequestMethod.GET, value="json")
//	@ResponseBody
//	public List<Product> listJson(){
//		return productDAO.list();
//	}
	
	
	
	@RequestMapping("/{id}")
	public ModelAndView show(@PathVariable("id") Integer id){
		ModelAndView modelAndView = new ModelAndView("products/show");
		Product product = productDAO.find(id);
		modelAndView.addObject("product",product);
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST, name="saveProduct")
	@CacheEvict(value="books", allEntries=true)
	public ModelAndView save(@Valid Product product, 
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes,
			MultipartFile summary) {
		
		System.out.println(summary.getName() + ";" + summary.getOriginalFilename());
		
		if(bindingResult.hasErrors()){
			return form(product);
		}
		
		//  Integração com Amazon para salvar arquivos
		//  String webPath = fileSaver.write("uploaded-images", summary);
		//  product.setSummaryPath(webPath);
		
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");
		return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Product product){
		ModelAndView modelAndView = new ModelAndView("/products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	@Cacheable(value="books")
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}
}
