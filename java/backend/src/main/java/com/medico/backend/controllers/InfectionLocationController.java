package com.medico.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.medico.backend.models.InfectionLocation;
import com.medico.backend.service.infection_location.IInfectionLocationService;

@RestController
@RequestMapping("/infection_location")

public class InfectionLocationController {
    @Autowired
    private IInfectionLocationService infectionLocationService;

    @GetMapping("/all")
    public List<InfectionLocation> getAll() {
        return infectionLocationService.findAll();
    }

    @PostMapping("/save")
    public InfectionLocation save(@RequestBody InfectionLocation infection_location) {
        return infectionLocationService.save(infection_location);
    }

    @GetMapping("/get/{id}")
    public InfectionLocation getById(@PathVariable Long id) {
        return infectionLocationService.getById(id);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable Long id) {
        infectionLocationService.delete(id);
    }
}
