package cn.tedu.service;


import java.util.List;

import cn.tedu.pojo.Pet;

public interface PetService {

	public List<Pet> findAllPets(Integer startPos, Integer pageSize);

	public Pet findOne(String petId);

	public void delete(String[] petIds);

	public void save(Pet pet);

	public void update(Pet pet);

	public void changeHealth(int i, String[] petIds);


	public long getPetCount();

	public List<Pet> findAll();


}
