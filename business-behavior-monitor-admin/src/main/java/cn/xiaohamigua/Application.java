package cn.xiaohamigua;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * @author 林圣涛
 */
@SpringBootApplication
@Configurable
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }
}
