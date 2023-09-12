package com.medico.backend.service.patient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medico.backend.models.Patient;
import com.medico.backend.dao.IPatientDAO;

@Service
public class PatientService implements IPatientService {
    @Autowired
    private IPatientDAO patientRepository;

    @Override
    public List<Patient> findAll() {
        return patientRepository.findAll();
    }

    @Override
    public Patient getById(Long id) {
        return patientRepository.findById(id).orElse(null);
    }

    @Override
    public Patient save(Patient patient) {
        return patientRepository.save(patient);
    }

    @Override
    public void delete(Long id) {
        patientRepository.deleteById(id);
    }
}
