package com.medico.backend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.medico.backend.models.Bacterium;
import com.medico.backend.service.bacterium.IBacteriumService;

import java.util.List;

@RestController
@RequestMapping("/bacterium")
public class BacteriumController {
    @Autowired
    private IBacteriumService bacteriumService;

    @GetMapping("/all")
    public List<Bacterium> getAll() {
        return bacteriumService.findAll();
    }

    @PostMapping("/save")
    public Bacterium save(@RequestBody Bacterium bacterium) {
        return bacteriumService.save(bacterium);
    }

    @GetMapping("/get/{id}")
    public Bacterium getById(@PathVariable Long id) {
        return bacteriumService.getById(id);
    }
}
