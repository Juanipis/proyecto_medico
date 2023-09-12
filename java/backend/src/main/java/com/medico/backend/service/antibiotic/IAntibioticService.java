package com.medico.backend.service.antibiotic;

import java.util.List;

import com.medico.backend.models.Antibiotic;

public interface IAntibioticService {
    public List<Antibiotic> findAll();

    public Antibiotic getById(Long id);

    public Antibiotic save(Antibiotic bacterium);
}
