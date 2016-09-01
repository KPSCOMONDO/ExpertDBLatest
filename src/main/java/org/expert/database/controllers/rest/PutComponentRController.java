/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.controllers.rest;

import java.util.Map;
import org.expert.database.entities.AddCategory.UpdateCategory;
import org.expert.database.entities.AddLanguage.UpdateLanguage;
import org.expert.database.entities.AddLevel.UpdateLevel;
import org.expert.database.entities.AddLocation.UpdateLocation;
import org.expert.database.entities.AddPosition.UpdatePosition;
import org.expert.database.entities.AddSkill.UpdateSkill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author sokchanny
 */
@RestController
@RequestMapping(value = {"/rest/component/"}, method = RequestMethod.PUT)
@CrossOrigin
public class PutComponentRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    @RequestMapping(value = {"/skill/update"})
    public ResponseEntity<Map<String, Object>> UpdateSkill(@RequestBody UpdateSkill updateSkill) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateSkill, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-skill";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    @RequestMapping(value = {"/skill/category/update"})
    public ResponseEntity<Map<String, Object>> UpdateSkillCategory(@RequestBody UpdateCategory updateCategory) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateCategory, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-category";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/position/update"})
    public ResponseEntity<Map<String, Object>> UpdatePosition(@RequestBody UpdatePosition updatePosition) {
        HttpEntity<Object> request = new HttpEntity<Object>(updatePosition, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-position";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/location/update"})
    public ResponseEntity<Map<String, Object>> UpdateLocation(@RequestBody UpdateLocation updateLocation) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateLocation, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-location";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/language/update"})
    public ResponseEntity<Map<String, Object>> UpdateLanguage(@RequestBody UpdateLanguage updateLanguage) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateLanguage, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-language";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/level/update"})
    public ResponseEntity<Map<String, Object>> UpdateLevel(@RequestBody UpdateLevel updateLevel) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateLevel, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/update-language";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }        
}
