package pe.utp.promocion_empresarial;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.SpringServletContainerInitializer;

@SpringBootApplication
public class PromocionEmpresarialApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(PromocionEmpresarialApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder springApplicationBuilder) {
    return springApplicationBuilder.sources(PromocionEmpresarialApplication.class);
  }

}
