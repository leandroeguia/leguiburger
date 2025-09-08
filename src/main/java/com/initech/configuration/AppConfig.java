package com.initech.configuration;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AppConfig {

    private static final Properties properties = new Properties();

    static {
        loadProperties();
    }

    private static void loadProperties() {
        String env = System.getenv().getOrDefault("APP_ENV", "local");
        String filename = "application-" + env + ".properties";

        try (InputStream input = AppConfig.class.getClassLoader().getResourceAsStream(filename)) {
            if (input == null) {
                log.error("Could not find properties file named: {}", filename);
            } else {
                properties.load(input);
                log.error("Configuration properties loaded from file: {}", filename);
            }
        } catch (IOException e) {
            throw new RuntimeException("Could not load configuration file: " + filename, e);
        }
    }

    public static String get(String key) {
        return properties.getProperty(key);
    }
}