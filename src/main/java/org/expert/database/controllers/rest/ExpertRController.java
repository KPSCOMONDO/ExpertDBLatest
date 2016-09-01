/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.controllers.rest;

import java.util.Map;
import org.expert.database.entities.AddExpert;
import org.expert.database.entities.ModelWhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
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
@CrossOrigin
@RequestMapping(value = {"/rest/expert"})
public class ExpertRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> CreateExpert(@RequestBody AddExpert addExpert) {
        HttpEntity<Object> request = new HttpEntity<Object>(addExpert, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/add-expert";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/findall"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> FindAllExpert() {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/get-experts";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/find-by-id/{expertId}"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> FindExpertById(@PathVariable("expertId") int expertId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/find-by/expert-id/" + expertId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/delete/{expertId}"}, method = RequestMethod.DELETE)
    public ResponseEntity<Map<String, Object>> DeleteExpert(@PathVariable("expertId") int expertId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/delete-expert/" + expertId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/update/{expertId}"}, method = RequestMethod.PUT)
    public ResponseEntity<Map<String, Object>> UpdateExpert(@RequestBody AddExpert updateExpert, @PathVariable("expertId") int expertId) {
        HttpEntity<Object> request = new HttpEntity<Object>(updateExpert, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/update-expert/" + expertId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/update-state/{key}/{expertId}"}, method = RequestMethod.PUT)
    public ResponseEntity<Map<String, Object>> UpdateState(@PathVariable("key") boolean key, @PathVariable("expertId") int expertId) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/admin/change-state-expert?state=" + key + "&expertId=" + expertId;
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

//     @RequestMapping(value = {"/update"},method = RequestMethod.PUT)   
//    public ResponseEntity<Map<String, Object>> UpdateExpert(@RequestBody UpdateE @PathVariable("expertId")) {
//        HttpEntity<Object> request = new HttpEntity<Object>(header);
//        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
//        String URL = WS_URL + "/expert/update-expert/"+expertId;
//        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.PUT, request, Map.class);
//        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
//    }
    @RequestMapping(value = {"/expert/advancefind"},method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> findExpertAdvance(@RequestBody ModelWhere whereClause) {
        HttpEntity<Object> request = new HttpEntity<Object>(whereClause, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/expert/find-by/advance-search";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
}
