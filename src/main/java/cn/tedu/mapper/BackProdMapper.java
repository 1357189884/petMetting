package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.tedu.pojo.Product1;


public interface BackProdMapper {
	@Select("select * from product")
	List<Product1> findAll();

	@Select("select * from product where product_id=#{productId}")
	Product1 findOne(String productId);

	void add(Product1 prod);

	void removes(String[] ids);

	void updat(Product1 prod);
@Select("select imgurl from product where product_id=#{productId}")
	String findone(Product1 prod);


}
