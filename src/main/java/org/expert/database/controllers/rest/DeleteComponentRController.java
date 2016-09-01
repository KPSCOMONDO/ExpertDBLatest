/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.controllers.rest;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author sokchanny
 */
@RestController
@RequestMapping(value = {"/rest/component"}, method = RequestMethod.DELETE)
@CrossOrigin
public class DeleteComponentRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    
    @RequestMapping(value = {"/skill/delete/{skillId}"})
    public ResponseEntity<Map<String, Object>> DeleteSkill(@PathVariable("skillId") int skillId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-skill/" + skillId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    @RequestMapping(value = {"/skill/category/delete/{categoryId}"})
    public ResponseEntity<Map<String, Object>> DeleteCategory(@PathVariable("categoryId") int categoryId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-category/" + categoryId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    
    @RequestMapping(value = {"/position/delete/{positionId}"})
    public ResponseEntity<Map<String, Object>> DeletePosition(@PathVariable("positionId") int positionId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-position/" + positionId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    
    @RequestMapping(value = {"/language/delete/{languageId}"})
    public ResponseEntity<Map<String, Object>> DeleteLanguage(@PathVariable("languageId") int languageId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-language/" + languageId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    @RequestMapping(value = {"/level/delete/{levelId}"})
    public ResponseEntity<Map<String, Object>> DeleteLevel(@PathVariable("levelId") int levelId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-level/" + levelId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
       
    @RequestMapping(value = {"/location/delete/{locationId}"})
    public ResponseEntity<Map<String, Object>> DeleteLocation(@PathVariable("locationId") int locationId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/delete-location/" + locationId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
}
