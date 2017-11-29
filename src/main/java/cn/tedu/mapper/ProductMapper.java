package cn.tedu.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tedu.pojo.ProductO;

public interface ProductMapper {
	@Select("select * from product where product_id=#{productid}")
	public ProductO findById(String productid);
	@Update("update pet set num=#{num} where pet_id=#{productid}")
	public void changeNum(@Param("productid")String productid, @Param("num")Integer num);

}
