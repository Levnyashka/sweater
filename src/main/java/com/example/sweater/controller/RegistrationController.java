package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;
import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepo userRepo;

    // Дефолтный переход, когда пользователь переходит по ссылке Get-запрос
    @GetMapping("/registration")
    public String registration(Map<String,Object> model) {
        //
        model.put("message","Введите данные нового пользователя");
        return "registration";
    }

    // Ответ на запрос на регитсрацию
    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null){
            model.put("message","User exist");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);
        return "redirect:/login";
    }

}
