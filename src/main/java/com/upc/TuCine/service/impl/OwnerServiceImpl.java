package com.upc.TuCine.service.impl;

import com.upc.TuCine.dto.OwnerDto;
import com.upc.TuCine.model.BusinessType;
import com.upc.TuCine.model.Gender;
import com.upc.TuCine.model.Owner;
import com.upc.TuCine.model.Person;
import com.upc.TuCine.repository.OwnerRepository;
import com.upc.TuCine.repository.PersonRepository;
import com.upc.TuCine.service.OwnerService;
import com.upc.TuCine.shared.exception.ResourceValidationException;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    private OwnerRepository ownerRepository;

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private ModelMapper modelMapper;

    OwnerServiceImpl(){
        this.modelMapper = new ModelMapper();
    }

    private OwnerDto EntityToDto(Owner owner){
        return modelMapper.map(owner, OwnerDto.class);
    }

    private Owner DtoToEntity(OwnerDto ownerDto){
        return modelMapper.map(ownerDto, Owner.class);
    }

    @Override
    public List<OwnerDto> getAllOwners() {
        List<Owner> owners= ownerRepository.findAll();
        return owners.stream()
                .map(this::EntityToDto)
                .collect(Collectors.toList());
    }

    @Override
    public OwnerDto createOwner(OwnerDto ownerDto) {

        validateOwner(ownerDto);
        existsPersonById(ownerDto.getPerson().getId());
        existsOwnerByAccountNumber(ownerDto.getBankAccount());

        Person person = personRepository.findById(ownerDto.getPerson().getId()).orElse(null);
        ownerDto.setPerson(person);

        Owner owner = DtoToEntity(ownerDto);
        return EntityToDto(ownerRepository.save(owner));
    }

    void validateOwner(OwnerDto owner) {
        if (owner.getPerson() == null) {
            throw new ResourceValidationException("El person es obligatorio");
        }
        if(owner.getBankAccount()==null || owner.getBankAccount().isEmpty()){
            throw new ResourceValidationException("La cuenta bancaria es obligatoria");
        }
    }

    void existsOwnerByAccountNumber(String accountNumber) {
        if (ownerRepository.existsOwnerByBankAccount(accountNumber)) {
            throw new ResourceValidationException("Ya existe un owner con el numero de cuenta: " + accountNumber);
        }
    }

    void existsPersonById(Integer id) {
        if (!personRepository.existsById(id)) {
            throw new ResourceValidationException("No existe el person con ID: " + id+" para crear el owner");
        }
    }
}
