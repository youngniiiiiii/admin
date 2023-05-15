package com.kbstar.controller;

import com.kbstar.dto.Msg;
import com.kbstar.util.ChatBotUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
public class ChatbotController {
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/chatbotme") // 고객이 챗봇메세지를 보내면.... 보낸사람에게 다시 메세지를 보내줌
    public void chatbotme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws IOException {
        //String id = msg.getSendid();
        String target = msg.getSendid();
        String txt = msg.getContent1();
        // 보낸사람 아이디를 끄집어내어 보낸사람이 target이 된다.
        // Naver Cloud Platform에 있는 Chatbot과 연동할꺼야..
        String result = ChatBotUtil.chat(txt);
        msg.setContent1(result);
        template.convertAndSend("/chsend/" + target, msg);
    }
}