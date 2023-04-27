package com.kbstar.controller;

import com.kbstar.dto.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());


    //127.0.0.1/item
    @RequestMapping("/tables")
    public String itemtables(Model model) {
        List<Item> list = new ArrayList<>();
        list.add(new Item(100, "pants1", 1000, "a.jpeg", new Date()));
        list.add(new Item(101, "pants2", 2000, "b.jpeg", new Date()));
        list.add(new Item(102, "pants3", 3000, "c.jpeg", new Date()));
        list.add(new Item(103, "pants4", 4000, "d.jpeg", new Date()));
        list.add(new Item(104, "pants5", 5000, "e.jpeg", new Date()));
        list.add(new Item(105, "pants1", 1000, "a.jpeg", new Date()));
        list.add(new Item(106, "pants2", 2000, "b.jpeg", new Date()));
        list.add(new Item(107, "pants3", 3000, "c.jpeg", new Date()));
        list.add(new Item(108, "pants4", 4000, "d.jpeg", new Date()));
        list.add(new Item(109, "pants5", 5000, "e.jpeg", new Date()));
        list.add(new Item(110, "pants1", 1000, "a.jpeg", new Date()));
        list.add(new Item(111, "pants2", 2000, "b.jpeg", new Date()));
        list.add(new Item(112, "pants3", 3000, "c.jpeg", new Date()));
        list.add(new Item(133, "pants4", 4000, "d.jpeg", new Date()));
        list.add(new Item(114, "pants5", 5000, "e.jpeg", new Date()));
        list.add(new Item(115, "pants1", 1000, "a.jpeg", new Date()));
        list.add(new Item(116, "pants2", 2000, "b.jpeg", new Date()));
        list.add(new Item(117, "pants3", 3000, "c.jpeg", new Date()));
        list.add(new Item(118, "pants4", 4000, "d.jpeg", new Date()));
        list.add(new Item(119, "pants5", 5000, "e.jpeg", new Date()));

        model.addAttribute("allitem", list);
        model.addAttribute("contents", "tables");

        return "index";
    }
}
