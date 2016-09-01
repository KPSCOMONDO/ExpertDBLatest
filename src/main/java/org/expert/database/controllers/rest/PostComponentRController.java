package org.expert.database.controllers.rest;

import java.util.Map;
import org.expert.database.entities.AddCategory;
import org.expert.database.entities.AddLanguage;
import org.expert.database.entities.AddLevel;
import org.expert.database.entities.AddLocation;
import org.expert.database.entities.AddPosition;
import org.expert.database.entities.AddSkill;
import org.expert.database.utilities.FileMessageResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author sokchanny
 */
@RestController
@RequestMapping(value = {"/rest/component"}, method = RequestMethod.POST)
@CrossOrigin
public class PostComponentRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    @RequestMapping(value = {"/position/create"})
    public ResponseEntity<Map<String, Object>> CreatePosition(@RequestBody AddPosition addPosition) {
        HttpEntity<Object> request = new HttpEntity<Object>(addPosition, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/add-position";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/location/create"})
    public ResponseEntity<Map<String, Object>> CreateLanguage(@RequestBody AddLocation addLocation) {
        HttpEntity<Object> request = new HttpEntity<Object>(addLocation, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/add-location";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/language/create"})
    public ResponseEntity<Map<String, Object>> CreateLanguage(@RequestBody AddLanguage addLanguage) {
        HttpEntity<Object> request = new HttpEntity<Object>(addLanguage, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/add-language";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/skill/category/create"})
    public ResponseEntity<Map<String, Object>> CreateSkillCategory(@RequestBody AddCategory addCategory) {

        HttpEntity<Object> request = new HttpEntity<Object>(addCategory, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);

        String URL = WS_URL + "/component/add-skill-category";

        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/skill/create"})
    public ResponseEntity<Map<String, Object>> CreateSkill(@RequestBody AddSkill addSkill) {
        HttpEntity<Object> request = new HttpEntity<Object>(addSkill, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/add-skill";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = {"/level/create"})
    public ResponseEntity<Map<String, Object>> CreateLevel(@RequestBody AddLevel addLevel) {
        HttpEntity<Object> request = new HttpEntity<Object>(addLevel, header);
        header.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        String URL = WS_URL + "/component/add-level";
        ResponseEntity<Map> response = rest.exchange(URL, HttpMethod.POST, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

}
