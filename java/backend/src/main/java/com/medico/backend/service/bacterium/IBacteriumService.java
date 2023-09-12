package com.medico.backend.service.bacterium;

import java.util.List;

import com.medico.backend.models.Bacterium;

public interface IBacteriumService {
    public List<Bacterium> findAll();

    public Bacterium getById(Long id);

    public Bacterium save(Bacterium bacterium);
}
