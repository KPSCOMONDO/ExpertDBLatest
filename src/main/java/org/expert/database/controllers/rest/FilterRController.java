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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping(value = {"/rest/filter"}, method = RequestMethod.GET)
public class FilterRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    // FILTER 
    @RequestMapping(value = {"/expert/find-by-expert-id/{expert_id}"})
    public ResponseEntity<Map<String, Object>> findExpertByExpertId(@PathVariable("expert_id") int expert_id) {

        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);

        String URL = WS_URL + "/expert/find-by/expert-id/" + expert_id;

        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    // FILTER 
    @RequestMapping(value = {"/expert/by-skill-id/{skillId}"})
    public ResponseEntity<Map<String, Object>> findExpertBySkillId(@PathVariable("skillId") int skillId) {

        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);

        String URL = WS_URL + "/expert/find-by/skill-id?skillId=" + skillId;

        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }   
}
