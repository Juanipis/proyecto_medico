package com.medico.backend.controllers;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.medico.backend.models.Antibiotic;
import com.medico.backend.models.Bacterium;
import com.medico.backend.models.Results;
import com.medico.backend.service.antibiotic.IAntibioticService;
import com.medico.backend.service.bacterium.IBacteriumService;
import com.medico.backend.service.results.IResultsService;

@RestController
@RequestMapping("/results")
public class ResultsController {
    @Autowired
    private IResultsService resultsService;

    @Autowired
    private IBacteriumService bacteriumService;

    @Autowired
    private IAntibioticService antibioticService;

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
        Map<String, Map<String, Object>> antibioticInfo = results.getAntibioticsInfoJson();

        Map<String, Map<String, Object>> reformattedAntibioticInfo = new HashMap<>();
        for (String antibioticID : antibioticInfo.keySet()) {
            Antibiotic antibiotic = antibioticService.getById(Long.parseLong(antibioticID));
            if (antibiotic != null) {
                Map<String, Object> antibioticData = new HashMap<>();
                antibioticData.put("name", antibiotic.getName()); // Agrega el nombre del antibiótico
                antibioticData.put("quantity", antibioticInfo.get(antibioticID).get("quantity"));
                antibioticData.put("operator", antibioticInfo.get(antibioticID).get("operator"));
                reformattedAntibioticInfo.put(antibioticID, antibioticData);
            }
        }
        results.setAntibioticsInfoJson(reformattedAntibioticInfo);

        return resultsService.save(results);
    }

    @GetMapping("/get/{id}")
    public Results getById(@PathVariable Long id) {
        return resultsService.getById(id);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable Long id) {
        resultsService.delete(id);
    }

    @PostMapping("/uploadImage")
    public ResponseEntity<String> uploadImage(@RequestParam("image") MultipartFile imageFile) {
        try {
            // Aquí implementarías la lógica para procesar y almacenar el archivo
            String filename = imageFile.getOriginalFilename();
            // ... (Guardar archivo)

            return ResponseEntity.status(HttpStatus.OK).body("Imagen subida con éxito: " + filename);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al subir la imagen: " + e.getMessage());
        }
    }

}
