package com.medico.backend.service.infection_location;

import java.util.List;

import com.medico.backend.models.InfectionLocation;

public interface IInfectionLocationService {
    public List<InfectionLocation> findAll();

    public InfectionLocation getById(Long id);

    public InfectionLocation save(InfectionLocation infectionLocation);

    public void delete(Long id);
}
