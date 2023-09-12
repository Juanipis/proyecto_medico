package com.medico.backend.service.bacterium;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.models.Bacterium;
import com.medico.backend.repository.IBacteriumRepository;

@Service
public class BacteriumService implements IBacteriumService {
    @Autowired
    private IBacteriumRepository bacteriumRepository;

    @Override
    public List<Bacterium> findAll() {
        return bacteriumRepository.findAll();
    }

    @Override
    public Bacterium getById(Long id) {
        return bacteriumRepository.findById(id).orElse(null);
    }

    @Override
    public Bacterium save(Bacterium bacterium) {
        return bacteriumRepository.save(bacterium);

    }

    @Override
    public void delete(Long id) {
        bacteriumRepository.deleteById(id);
    }
}