package com.medico.backend.services.results;

import java.util.List;

import com.medico.backend.models.Results;

public interface IResultsService {
    public List<Results> findAll();

    public Results findById(Long id);

    public Results save(Results results);

    public void deleteById(Long id);
}
