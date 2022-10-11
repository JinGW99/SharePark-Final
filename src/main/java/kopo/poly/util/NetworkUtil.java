package kopo.poly.util;

import org.springframework.lang.Nullable;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;


public class NetworkUtil {

    private static HttpURLConnection connect(String apiUrl){

        try {
            URL url = new URL(apiUrl);

            return (HttpURLConnection) url.openConnection();

        }catch (MalformedURLException e){
            throw new RuntimeException("API연결이 잘못되었습니다 :" + apiUrl, e);

        }catch (IOException e){
            throw new RuntimeException("연결이 실패했습니다 : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)){
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null){
                responseBody.append(line);
            }

            return responseBody.toString();
        }catch (IOException e){
            throw new RuntimeException("API 응답을 읽는데 실패하였습니다." + e);
        }
    }

    /**
     * Post방식으로 OpenAPI 호출하기
     * 네이버 API 전송 소스 참고하여 구현
     *
     * @param apiUrl
     * @param postParmas
     * @param requestHeaders
     */

    public static String post(String apiUrl, @Nullable Map<String, String> requestHeaders, String postParmas) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("POST");

            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParmas.getBytes());
                wr.flush();
            }
            int responseCode = con.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                return readBody(con.getInputStream());

            } else {
                return readBody(con.getErrorStream());
            }

        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답실패", e);
        } finally {
            con.disconnect();
        }

    }

}
