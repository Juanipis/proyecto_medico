package com.medico.backend.models;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "results")
public class Results {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @Getter
    @Setter
    @JoinColumn(name = "bacterium_id", referencedColumnName = "id")
    private Bacterium bacterium;

    @Column
    @Getter
    @Setter
    private String result;

    @Column(columnDefinition = "TEXT")
    private String antibioticsInfoJson;

    public Map<String, Map<String, Object>> getAntibioticsInfoJson() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readValue(this.antibioticsInfoJson,
                    new TypeReference<Map<String, Map<String, Object>>>() {
                    });
        } catch (IOException e) {
            e.printStackTrace();
            return new HashMap<>();
        }
    }

    public void setAntibioticsInfoJson(Map<String, Map<String, Object>> antibioticsInfoJson) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            this.antibioticsInfoJson = objectMapper.writeValueAsString(antibioticsInfoJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    public Results() {
    }

}
