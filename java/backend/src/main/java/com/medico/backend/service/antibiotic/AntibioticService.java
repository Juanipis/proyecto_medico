package com.medico.backend.service.antibiotic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.models.Antibiotic;
import com.medico.backend.repository.IAntibioticRepository;

@Service
public class AntibioticService implements IAntibioticService {
    @Autowired
    private IAntibioticRepository antibioticRepository;

    @Override
    public List<Antibiotic> findAll() {
        return antibioticRepository.findAll();
    }

    @Override
    public Antibiotic getById(Long id) {
        return antibioticRepository.findById(id).orElse(null);
    }

    @Override
    public Antibiotic save(Antibiotic antibiotic) {
        return antibioticRepository.save(antibiotic);
    }

    @Override
    public void delete(Long id) {
        antibioticRepository.deleteById(id);
    }

}
