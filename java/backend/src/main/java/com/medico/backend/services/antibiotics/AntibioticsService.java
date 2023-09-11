package com.medico.backend.services.antibiotics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.dao.IAntibioticsDAO;
import com.medico.backend.models.Antibiotics;

@Service
public class AntibioticsService implements IAntibioticsService {
    @Autowired
    private IAntibioticsDAO antibioticsDAO;

    @Override
    public List<Antibiotics> findAll() {
        return antibioticsDAO.findAll();
    }

    @Override
    public Antibiotics findById(Long id) {
        return antibioticsDAO.findById(id).orElse(null);

    }

    @Override
    public Antibiotics save(Antibiotics antibiotics) {
        return antibioticsDAO.save(antibiotics);
    }

    @Override
    public void deleteById(Long id) {
        antibioticsDAO.deleteById(id);
    }
}
