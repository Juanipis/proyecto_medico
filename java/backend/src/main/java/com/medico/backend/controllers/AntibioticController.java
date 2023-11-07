package com.medico.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.medico.backend.models.Antibiotic;
import com.medico.backend.service.antibiotic.IAntibioticService;

@RestController
@RequestMapping("/antibiotic")
public class AntibioticController {
    @Autowired
    private IAntibioticService antibioticService;

    @GetMapping("/all")
    public List<Antibiotic> getAll() {
        return antibioticService.findAll();
    }

    @GetMapping("/get/{id}")
    public Antibiotic getById(Long id) {
        return antibioticService.getById(id);
    }

    @PostMapping("/save")
    public Antibiotic save(Antibiotic antibiotic) {
        return antibioticService.save(antibiotic);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(Long id) {
        antibioticService.delete(id);
    }
}
