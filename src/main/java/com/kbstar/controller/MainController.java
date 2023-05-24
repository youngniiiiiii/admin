package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {
    @Value("${adminserver}")
    String adminserver;
    @Autowired
    AdmService admService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/charts")
    public String charts(Model model) {
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/tables")
    public String tables(Model model) {
        model.addAttribute("center", "tables");
        return "index";
    }

    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "livechart");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model, String redirectURL) {
        model.addAttribute("redirectURL", redirectURL);
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session, String redirectURL) throws Exception {
        //log.info("----------------" + id + pwd);
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = admService.get(id);
            if (adm != null && encoder.matches(pwd, adm.getPwd())) {
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000);
                session.setAttribute("loginadm", adm);
                if (redirectURL == null || redirectURL.equals("")) {
                    return "redirect:/";
                } else {
                    return "redirect:" + redirectURL;
                }
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 잠시후 다시 로그인 하세요");
        }

        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(Model model, HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {

        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
//            회원가입 즉시 로그인처리 로그인된 화면 보여주기...
            session.setAttribute("loginadm", adm);

        } catch (Exception e) {
            throw new Exception("가입 오류");
        }

        model.addAttribute("radm", adm);
        model.addAttribute("center", "registerok");
//        다시 메인페이지로 이동한다
        return "redirect:/";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "websocket");
        return "index";
    }

    @RequestMapping("/callcenter")
    public String callcenter(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "callcenter");
        return "index";
    }
}

