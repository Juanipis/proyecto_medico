package com.medico.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.medico.backend.models.Bacterium;
import com.medico.backend.models.Results;
import com.medico.backend.service.bacterium.IBacteriumService;
import com.medico.backend.service.results.IResultsService;

@RestController
@RequestMapping("/results")
public class ResultsController {
    @Autowired
    private IResultsService resultsService;

    @Autowired
    private IBacteriumService bacteriumService;

    @GetMapping("/all")
    public List<Results> getAll() {
        return resultsService.findAll();
    }

    @PostMapping("/save")
    public Results save(@RequestBody Results results) {
        Bacterium bacterium = results.getBacterium();
        if (bacterium.getId() == null) {
            bacterium = bacteriumService.save(bacterium);
            results.setBacterium(bacterium);
        }
        return resultsService.save(results);
    }

    @GetMapping("/get/{id}")
    public Results getById(@PathVariable Long id) {
        return resultsService.getById(id);
    }
}
