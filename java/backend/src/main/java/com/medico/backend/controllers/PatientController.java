package com.medico.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.medico.backend.models.InfectionLocation;
import com.medico.backend.models.Patient;
import com.medico.backend.service.infection_location.IInfectionLocationService;
import com.medico.backend.service.patient.IPatientService;

@RestController
@RequestMapping("/patient")

public class PatientController {
    @Autowired
    private IPatientService patientService;

    @Autowired
    private IInfectionLocationService infectionService;

    @GetMapping("/all")
    public List<Patient> getAll() {
        return patientService.findAll();
    }
    @PostMapping("/save")
    public Patient save(@RequestBody Patient patient) {
        InfectionLocation infectionLocation = patient.getInfectionLocation();
        if (infectionLocation.getId() == null) {
            infectionLocation = infectionService.save(infectionLocation);
            patient.setInfectionLocation(infectionLocation);
        }
        return patientService.save(patient);

    }

    @GetMapping("/get/{id}")
    public Patient getById(@PathVariable Long id) {
        return patientService.getById(id);
    }
    
}
