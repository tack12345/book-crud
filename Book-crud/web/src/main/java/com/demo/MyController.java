package com.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	@Autowired
	BookRepository bookRepository;

	@GetMapping("/hello")
	public String greet() {
		return "welcome";
	}

	@GetMapping("/add")
	public String addBook(Model model, @RequestParam(value = "name") String name,
			@RequestParam(value = "price") float price) {
		try {
			Book bk = new Book(0, name, price);
			bookRepository.save(bk);
			model.addAttribute("msg", "Book details saved successfully !");
			return "success";
		} catch (Exception e) {
			model.addAttribute("msg", "Book details couldn't be saved !");
			e.printStackTrace();
			return "error";
		}
	}

	@GetMapping("/update")
	public String updateBook(Model model, @RequestParam(value = "id") int id,
			@RequestParam(value = "name") String name, @RequestParam(value = "price") float price) {

		try {
			Book bk = new Book(id, name, price);
			bookRepository.save(bk);
			model.addAttribute("msg", "Book details updated successfully !");
			return "success";
		} catch (Exception e) {
			model.addAttribute("msg", "Book details couldn't be updated !");
			e.printStackTrace();
			return "error";
		}

	}
	
	@PostMapping("/delete")
	public String deleteBook(Model model, @RequestParam(value = "id") int id) {
		
		try {
			bookRepository.deleteById(id);
			model.addAttribute("msg", "Book details deleted successfully !");
			return "success";
		} catch (Exception e) {
			model.addAttribute("msg", "Book details couldn't be deleted !");
			e.printStackTrace();
			return "error";
		}
		
	}
	
	@GetMapping("/view")
	public String viewBooks(Model model) {
		List<Book> books = (List<Book>) bookRepository.findAll();
		model.addAttribute("bks", books);
		return "view";
	}

}







