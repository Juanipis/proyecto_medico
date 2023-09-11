package com.medico.backend.services.results;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.dao.IResultsDAO;
import com.medico.backend.models.Results;

@Service
public class ResultsService implements IResultsService {
    @Autowired
    private IResultsDAO resultsDAO;

    @Override
    public List<Results> findAll() {
        return resultsDAO.findAll();
    }

    @Override
    public Results findById(Long id) {
        return resultsDAO.findById(id).orElse(null);
    }

    @Override
    public Results save(Results results) {
        return resultsDAO.save(results);
    }

    @Override
    public void deleteById(Long id) {
        resultsDAO.deleteById(id);
    }

}
