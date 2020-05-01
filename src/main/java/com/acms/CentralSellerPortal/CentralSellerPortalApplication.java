package com.acms.CentralSellerPortal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;

@SpringBootApplication
@EnableJpaRepositories
@ConfigurationProperties(prefix="spring.datasource")
@EnableConfigurationProperties(DatasourceProperties.class)
public class CentralSellerPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(CentralSellerPortalApplication.class, args);
	}

}
