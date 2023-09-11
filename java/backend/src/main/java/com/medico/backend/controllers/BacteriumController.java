package com.medico.backend.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.medico.backend.models.Bacterium;
import com.medico.backend.services.bacterium.IBacteriumService;

@RestController
@RequestMapping("/bacterium")
public class BacteriumController {
    @Autowired
    private IBacteriumService bacteriumService;

    @GetMapping("/all")
    public String findAll() {
        return bacteriumService.findAll().toString();
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<?> findById(Long id) {
        Bacterium bacterium = bacteriumService.findById(id);
        Map<String, Object> response = new HashMap<>();
        if (bacterium == null) {
            response.put("message", "Bacterium not found");
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(bacterium);
    }

    @PostMapping("/create")
    public ResponseEntity<?> save(Bacterium bacterium) {
        Bacterium bacteriumNew = bacteriumService.save(bacterium);
        Map<String, String> response = new HashMap<>();
        if (bacteriumNew == null) {
            response.put("message", "Bacterium not created");
            return ResponseEntity.badRequest().body(response);
        }
        response.put("message", "Bacterium created");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
    public ResponseEntity<?> update(Bacterium bacterium) {
        Bacterium bacteriumUpdated = bacteriumService.save(bacterium);
        Map<String, String> response = new HashMap<>();
        if (bacteriumUpdated == null) {
            response.put("message", "Bacterium not updated");
            return ResponseEntity.badRequest().body(response);
        }
        response.put("message", "Bacterium updated");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteById(Long id) {
        Map<String, String> response = new HashMap<>();
        try {
            bacteriumService.deleteById(id);
        } catch (Exception e) {
            response.put("message", "Bacterium not deleted");
            return ResponseEntity.badRequest().body(response);
        }
        response.put("message", "Bacterium deleted");
        return ResponseEntity.ok(response);
    }

}
