package com.medico.backend.service.patient;
import java.util.List;

import com.medico.backend.models.Patient;

public interface IPatientService {
     public List<Patient> findAll();

    public Patient getById(Long id);

    public Patient save(Patient patient);
    
}
