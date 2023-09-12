package com.medico.backend.service.results;

import java.util.List;

import com.medico.backend.models.Results;

public interface IResultsService {
    public List<Results> findAll();

    public Results getById(Long id);

    public Results save(Results results);
}
