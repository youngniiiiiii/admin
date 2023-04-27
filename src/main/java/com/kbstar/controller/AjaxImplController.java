package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class AjaxImplController {
    @RequestMapping("/chartarea")
    public Object chartarea() {
        JSONArray ja = new JSONArray();

        for (int i = 1; i <= 20; i++) {

            Random r = new Random();
            int num = r.nextInt(100);

            JSONArray ja2 = new JSONArray();
            ja2.add("도시" + i);
            ja2.add(num);

            ja.add(ja2);
        }

        return ja;
    }

}
