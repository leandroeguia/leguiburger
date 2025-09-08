package com.initech.core.enums;

public enum Env {
    LOCAL, DEV, PROD;

    public static Env from(String value) {
        try {
            return Env.valueOf(value.toUpperCase());
        } catch (Exception e) {
            return LOCAL;
        }
    }
}