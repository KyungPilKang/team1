package com.semi.api.naverapi;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Clova_CAPTCHA {
	// Client ID 와 Client Secret을 메소드에서 공통으로 사용하기 때문에 위로 빼준다.
    String clientId = "1x9sg4nwhp";
    String clientSecret = "1jgb6RPpdDSu6nPyuBFklewHfxAdo7PijkZbHSIY";
    
    // 메소드에서 공통으로 사용되는 key 값 초기화
    String key;
    
    // localhost:8090/captchaform 로 이동했을 때, captcha_img.jsp 페이지가 나타나도록 한다.
    @GetMapping("/captchaform")
    public String CaptchaForm() {
    	return "/login/captcha_img";
    }
    
    // captcha_img.jsp에 있는 <img src="/captcha">에서 이미지를 불러올 수 있도록 한다.
    
    @GetMapping("/captcha")
    public void reqCaptcha(HttpServletResponse res) {
    	try {
    		// getCode() 메소드를 통해 key값을 가져온다. (해당 파일 120번 라인)    		
    		// https://naveropenapi.apigw.ntruss.com/captcha/v1/nkey 호출로 받은 키값
            String key = getCode();
            String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha-bin/v1/ncaptcha?key=" + key + "&X-NCP-APIGW-API-KEY-ID" + clientId;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 가져온 이미지 데이터로 응답
                OutputStream outputStream = res.getOutputStream();
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // 전송 버튼을 클릭하였을 때 사용자가 입력한 값(userin)이 그림 문자와 내용과 동일한 지 확인
    @ResponseBody
    @PostMapping("/captchacheck")
    public String Captchacheck(@RequestParam(value="userin", required=false) String userin) {
    	boolean result = false;
    	
    	try {
            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String value = userin; // 사용자가 입력한 캡차 이미지 글자값
            System.out.println("value:"+value);
            System.out.println("key:"+key);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha/v1/nkey?code=" + code +"&key="+ key + "&value="+ value;

            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            // response는 {"result":true} 또는 {"result":false} 가 될 것이다.
            JSONObject jsonobj = new JSONObject(response.toString());
            // 이를 json 데이터에서 result 키를 통해 받아온 true, false의 값, String을 Boolean으로 변경
            result = (Boolean) jsonobj.get("result");  
    	}catch (Exception e) {
            System.out.println(e);
        }
    	return String.valueOf(result);
    }
    
    // key값을 가져오는 메소드
    private String getCode() {
		try {
            String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha/v1/nkey?code=" + code;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            // json 데이터에서 key 키를 통해 값을 받아와서 반환            
            JSONObject jsonobj = new JSONObject(response.toString());
            key = (String)jsonobj.getString("key");
        } catch (Exception e) {
            System.out.println(e);
        }
		return key;
    }
    
}
