package com.movieportal.movieportal.controller;

import com.movieportal.movieportal.model.Movie;
import com.movieportal.movieportal.model.User;
import com.movieportal.movieportal.model.UserType;
import com.movieportal.movieportal.repository.*;
import com.movieportal.movieportal.security.CurrentUser;
import com.movieportal.movieportal.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserUtil userUtil;
    @Autowired
    private MovieRepository movieRepository;


    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String adminPage(ModelMap map) {
        map.addAttribute("user", userUtil.getPrincipal());
        map.addAttribute("newUser", new User());
        return "userprofile";
    }

    @GetMapping(value = "/Profile")
    public String userPage(@RequestParam("userId") int id) {
        User user = userRepository.findOne(id);
        if (user.getUserType() == UserType.ADMIN) {
            return "redirect:/admin";
        }
        return "redirect:/user";
    }

    @PostMapping("/changeUserDetails")
    public String changeUserDetails(@ModelAttribute("user") User user) {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        user.setPassword(principal.getPassword());
        userRepository.save(user);
        return "redirect:/user";
    }

    @GetMapping("/userFavoriteMovies")
    public String userFavoriteMovies(ModelMap map) {
        User user = userUtil.getPrincipal();

        return "userfavoritemovie";
    }

    @GetMapping("/addFavorite")
    public String addFavorite(@RequestParam("userId") int id, @RequestParam("movieId") int Id) {
        Movie favorite = movieRepository.findOne(Id);
        User currentUser = userRepository.findOne(id);
        currentUser.getMovies().add(favorite);
        return "redirect:/home";
    }
}
