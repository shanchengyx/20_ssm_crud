package com.gyx.domain;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MessageTest {

    @Test
    void add() {
        Message message = Message.fail().add("errorMsg", "用户名错误");
        System.out.println(message);
    }
}