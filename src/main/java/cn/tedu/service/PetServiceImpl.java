package cn.tedu.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.PetMapper;
import cn.tedu.pojo.Pet;

@Service
public class PetServiceImpl implements PetService {
	@Autowired
	private PetMapper petMapper;



	@Override
	public Pet findOne(String petId) {
		return petMapper.findOne(petId);
	}

	@Override
	public void delete(String[] petIds) {
		petMapper.delete(petIds);

	}
	/**
	 * 在数据库中进行插入
	 */
	@Override
	public void save(Pet pet) {
		pet.setPetId(UUID.randomUUID().toString());
		petMapper.save(pet);

	}

	@Override
	public void update(Pet pet) {
		petMapper.update(pet);
		
	}

	@Override
	public void changeHealth(int i, String[] petIds) {
		petMapper.changeHealth(i,petIds);

	}

	@Override
	public long getPetCount() {
	
		return petMapper.findPetCount();
	}

	@Override
	public List<Pet> findAllPets(Integer startPos, Integer pageSize) {
		
		return petMapper.findAllPets( startPos, pageSize);
	}

	@Override
	public List<Pet> findAll() {
		return petMapper.findAll();
	}



}
