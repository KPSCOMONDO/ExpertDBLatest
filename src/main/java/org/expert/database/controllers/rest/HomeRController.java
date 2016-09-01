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
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author sokchanny
 */
@RestController
@RequestMapping(value = {"/rest/home"})
@CrossOrigin
public class HomeRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    @RequestMapping(value = {"/category/findall"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> findAllFilter() {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        
        String URL = WS_URL +"/component/skill-categories";
        
        ResponseEntity<Map> response = rest.exchange(URL,HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/expert/find-by-skill-id/{skill_id}"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> findExpertBySkillId(@PathVariable("skill_id") int skill_id) {
        
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        
        String URL = WS_URL + "/expert/find-by/skill-id/{skillId}?";
        
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(URL);
        builder.queryParam("skillId", skill_id);
        
        ResponseEntity<Map> response = rest.exchange(
                builder.build()
                .encode()
                .toUri(), HttpMethod.GET, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
}
