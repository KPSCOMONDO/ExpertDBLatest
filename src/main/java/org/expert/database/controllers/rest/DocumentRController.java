package org.expert.database.controllers.rest;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.expert.database.utilities.FileMessageResource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/rest/document")
@CrossOrigin
public class DocumentRController {

    @Autowired
    private String WS_URL;
    @Autowired
    private HttpHeaders header;
    @Autowired
    private RestTemplate rest;

    /*	@RequestMapping(method=RequestMethod.GET)
     public ResponseEntity<Map<String,Object>>expert(
     @RequestParam(value="page",required=false,defaultValue="1")int page,
     @RequestParam(value="item",required=false,defaultValue="10")int item){
     HttpEntity<Object>request=new HttpEntity<Object>(header);
     ResponseEntity<Map>response=rest.exchange(WSURL+"/expert?page="+page+"&item="+item, HttpMethod.GET, request, Map.class);
     return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
     }*/
 
    @RequestMapping(value = "/delete-upload-file/{key}", method = RequestMethod.DELETE)
    public ResponseEntity<Map<String, Object>> deleteUploadFile(
            @PathVariable("key") String key) {
        HttpEntity<Object> request = new HttpEntity<Object>(header);
        ResponseEntity<Map> response = rest.exchange(WS_URL + "/expert/delete-upload-file/" + key, HttpMethod.DELETE, request, Map.class);
        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = "/upload-file", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> uploadFile(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "expertName", required = false) String expertName) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic ZGV2OiFAIyQlYXBp");
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, Object> data = new LinkedMultiValueMap<String, Object>();
        ResponseEntity<Map> response = null;
        try {
            if (file != null) {
                data.add("file", new FileMessageResource(file.getBytes(), file.getOriginalFilename()));
            }

            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<MultiValueMap<String, Object>>(data, headers);

            response = restTemplate.exchange(WS_URL + "/expert/upload-file?expertName=" + expertName, HttpMethod.POST, requestEntity, new ParameterizedTypeReference<Map>() {
            });

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }

    @RequestMapping(value = "/upload-files", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> uploadFiles(
            @RequestParam(value = "files", required = false) List<MultipartFile> files,
            @RequestParam(value = "expertName", required = false) String expertName) {

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic ZGV2OiFAIyQlYXBp");

        RestTemplate restTemplate = new RestTemplate();

        MultiValueMap<String, Object> data = new LinkedMultiValueMap<String, Object>();

        ResponseEntity<Map> response = null;

        try {

            if (files != null) {
                if (!files.isEmpty()) {
                    for (MultipartFile item : files) {
                        data.add("files", new FileMessageResource(item.getBytes(), item.getOriginalFilename()));
                    }
                }
            }
            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<MultiValueMap<String, Object>>(data, headers);

            response = restTemplate.exchange(WS_URL + "/expert/upload-files?expertName=temp&files=" + expertName, HttpMethod.POST, requestEntity, new ParameterizedTypeReference<Map>() {
            });

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<Map<String, Object>>(response.getBody(), HttpStatus.OK);
    }
    
    @RequestMapping(value="/download/{documentId}",method=RequestMethod.POST)
	public ResponseEntity<byte[]> downloadDocument(@PathVariable("documentId")int documentId) throws IOException{
		
		HttpEntity<Object> request = new HttpEntity<Object>(header);

	    ResponseEntity<byte[]> response = rest.exchange(
	    		WS_URL+"/expert/download-document/"+documentId,
	            HttpMethod.POST, request, byte[].class);
	    
	    return response;
	}
}
