package com.snail.audio.admin.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.snail.audio.admin.entity.App;

public class MapperTest {

	@Test
	public void test() throws Exception {
		ClassPathXmlApplicationContext applicatioContext=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		SqlSessionFactory sessionFactoryBean=(SqlSessionFactory)applicatioContext.getBean("sqlSessionFactory");
		SqlSession session=sessionFactoryBean.openSession();
		AppMapperExt mapper=session.getMapper(AppMapperExt.class);
		List<App> result=mapper.getApplications(0,5);
		System.out.println(result);
	}

}
