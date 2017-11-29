package cn.tedu.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tedu.pojo.Pet;


public interface PetMapper {

	public List<Pet> findAllPets(@Param("startPos")Integer startPos,@Param("pageSize") Integer pageSize);

	public Pet findOne(String petId);

	public void delete(String[] petIds);

	public void save(Pet pet);

	public void update(Pet pet);

	public void changeHealth(@Param("health") int i, @Param("petIds") String[] petIds);


	@Select("select * from pet where pet_id=#{petid}")
	public Pet findById(String petid);
	@Update("update pet set num=#{num} where pet_id=#{petId}")
	public void changeNum(@Param("petId")String petId, @Param("num")Integer num);

	public long findPetCount();

	public List<Pet> findAll();

}
