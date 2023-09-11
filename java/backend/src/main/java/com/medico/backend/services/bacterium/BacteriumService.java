package com.medico.backend.services.bacterium;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.dao.IBacteriumDAO;
import com.medico.backend.models.Bacterium;

@Service
public class BacteriumService implements IBacteriumService {
    @Autowired
    private IBacteriumDAO bacteriumDAO;

    @Override
    public List<Bacterium> findAll() {
        return bacteriumDAO.findAll();
    }

    @Override
    public Bacterium findById(Long id) {
        return bacteriumDAO.findById(id).orElse(null);
    }

    @Override
    public Bacterium save(Bacterium bacterium) {
        return bacteriumDAO.save(bacterium);
    }

    @Override
    public void deleteById(Long id) {
        bacteriumDAO.deleteById(id);
    }
}
