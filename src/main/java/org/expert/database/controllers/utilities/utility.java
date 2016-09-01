/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.controllers.utilities;

import java.util.Map;
import org.expert.database.service.SendMailService;
import org.expert.database.utilities.Sendmail;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author sokchanny
 */
@Controller
@CrossOrigin
@RequestMapping(value = {"/utility"})
public class utility {

    SendMailService sendMail;

    @RequestMapping(value = {"/sendmail"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> SendMail(@RequestBody Sendmail mail) {
        
        try{
        sendMail.sendMaile(mail.getTarget(), mail.getSubject(), mail.getText());
        }catch(Exception ex){
            
        }
        return new ResponseEntity<Map<String, Object>>(HttpStatus.OK);
    }
}
