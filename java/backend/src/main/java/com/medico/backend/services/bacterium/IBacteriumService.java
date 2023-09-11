package com.medico.backend.services.bacterium;

import java.util.List;

import com.medico.backend.models.Bacterium;

public interface IBacteriumService {
    public List<Bacterium> findAll();

    public Bacterium findById(Long id);

    public Bacterium save(Bacterium bacterium);

    public void deleteById(Long id);
}
