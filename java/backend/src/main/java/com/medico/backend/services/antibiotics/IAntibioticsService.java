package com.medico.backend.services.antibiotics;

import java.util.List;

import com.medico.backend.models.Antibiotics;

public interface IAntibioticsService {
    public List<Antibiotics> findAll();

    public Antibiotics findById(Long id);

    public Antibiotics save(Antibiotics antibiotics);

    public void deleteById(Long id);
}
