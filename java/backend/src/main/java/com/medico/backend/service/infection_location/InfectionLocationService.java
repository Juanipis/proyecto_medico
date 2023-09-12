package com.medico.backend.service.infection_location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.dao.IInfectionLocationDAO;
import com.medico.backend.models.InfectionLocation;

@Service
public class InfectionLocationService implements IInfectionLocationService {

    @Autowired
    private IInfectionLocationDAO infectionDao;

    @Override
    public List<InfectionLocation> findAll() {
        return infectionDao.findAll();
    }

    @Override
    public InfectionLocation getById(Long id) {
        return infectionDao.findById(id).orElse(null);
    }

    @Override
    public InfectionLocation save(InfectionLocation infectionLocation) {
        return infectionDao.save(infectionLocation);
    }

    @Override
    public void delete(Long id) {
        infectionDao.deleteById(id);
    }

}
