package com.medico.backend.service.results;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.models.Results;
import com.medico.backend.repository.IResultsRepository;

@Service
public class ResultsService implements IResultsService {
    @Autowired
    private IResultsRepository resultsRepository;

    @Override
    public List<Results> findAll() {
        return resultsRepository.findAll();
    }

    @Override
    public Results getById(Long id) {
        return resultsRepository.findById(id).orElse(null);
    }

    @Override
    public Results save(Results results) {
        return resultsRepository.save(results);
    }

    @Override
    public void delete(Long id) {
        resultsRepository.deleteById(id);
    }

}
