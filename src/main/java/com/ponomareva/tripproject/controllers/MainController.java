package com.ponomareva.tripproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ponomareva.tripproject.models.Trip;
import com.ponomareva.tripproject.models.User;
import com.ponomareva.tripproject.services.TripService;
import com.ponomareva.tripproject.services.UserService;
import com.ponomareva.tripproject.validator.UserValidator;

@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final TripService tripService;
	
	public MainController(
			UserService userService,
			UserValidator userValidator,
			TripService tripService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.tripService = tripService;
	}	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("user", new User());
		return "index.jsp";
	}
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String register(
			@Valid @ModelAttribute ("user") User user,
			BindingResult result,
			HttpSession session) {
		userValidator.validate(user,  result);
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/dashboard";
		}
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			@RequestParam(value="email") String email,
			@RequestParam(value="password") String password,
			HttpSession session,
			RedirectAttributes redirect) {
		if(userService.authenticateUser(email,  password)) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			redirect.addFlashAttribute("success", "");
			return "redirect:/dashboard";
		} else {
			redirect.addFlashAttribute("error", "Invalid Login Credentials");
			return "redirect:/";
		}
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please Login befre entering our site");
			return "redirect:/";
		}
		model.addAttribute("user", userService.findUserById(userId));
		model.addAttribute("trips", tripService.findAllTrips());
		return "dashboard.jsp";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// =========================== New Trip Routes - Create ===========================
	
	@RequestMapping("/trip/new")
	public String newTrip(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please Login befre entering our site");
			return "redirect:/";
		}
		model.addAttribute("trip", new Trip());
		return "newTrip.jsp";
	}
	@RequestMapping(value="/trip/new", method=RequestMethod.POST)
	public String createTrip(@Valid @ModelAttribute("trip") Trip trip, BindingResult result) {
		if(result.hasErrors()) {
			return "newTrip.jsp";
		} else {
			tripService.saveTrip(trip);
			return "redirect:/dashboard";
		}
	}
	// =========================== New Trip Routes - Display ===========================
	@RequestMapping("/trip/{id}")
	public String showTrip(@PathVariable("id") Long id,
			Model model) {
		model.addAttribute("trip", tripService.findTripById(id));
		return "showTrip.jsp";
	}
	// =========================== New Trip Routes - Edit ===========================
	@RequestMapping("/trip/edit/{id}")
	public String editTrip(
			@PathVariable("id") Long id, 
			HttpSession session, 
			RedirectAttributes redirect,
			Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please Login befre entering our site");
			return "redirect:/";
		}
		model.addAttribute("trip", tripService.findTripById(id));
		return "editTrip.jsp";
	}
	
	@RequestMapping(value="/trip/edit/{id}", method=RequestMethod.PUT)
	public String updateTrip(@Valid @ModelAttribute("trip") Trip trip, BindingResult result) {
		
		if(result.hasErrors()) {
			return "editTrip.jsp";
		} else {
			tripService.saveTrip(trip);
			return "redirect:/dashboard";
		}
	}
	// =========================== New Trip Routes - Delete ===========================
	@RequestMapping(value="/trip/delete/{id}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id) {
        tripService.deleteTrip(id);
        return "redirect:/dashboard";
    }
	
	
	
}


