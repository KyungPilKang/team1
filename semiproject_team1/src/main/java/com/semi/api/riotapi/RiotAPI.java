package com.semi.api.riotapi;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

@Component
public class RiotAPI {
	private static String APIKEY = "RGAPI-f07d32e0-99f0-4d62-a323-53d475aadab7";
	private static String APIURL = "https://kr.api.riotgames.com/lol/";
	
	public String getIdCode(String mem_link_id) {
		String idCode=null;
		StringBuffer response = new StringBuffer();
		try {
			String apiURL = APIURL+"summoner/v4/summoners/by-name/"+mem_link_id;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36");
			con.setRequestProperty("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
			con.setRequestProperty("Accept-Charset", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setRequestProperty("Origin", "https://developer.riotgames.com");
			con.setRequestProperty("X-Riot-Token", APIKEY);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONParser temp=new JSONParser();
			JSONObject resultobj=(JSONObject)temp.parse(response.toString());
			idCode=(String)resultobj.get("id");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idCode;
	}
	
	public Map<String, String> status(String id){
		Map<String, String> map=new HashMap<>();
		StringBuffer response = new StringBuffer();
		try {
			String apiURL = APIURL+"league/v4/entries/by-summoner/"+id;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36");
			con.setRequestProperty("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
			con.setRequestProperty("Accept-Charset", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setRequestProperty("Origin", "https://developer.riotgames.com");
			con.setRequestProperty("X-Riot-Token", APIKEY);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONParser temp=new JSONParser();
			JSONArray resultarr=(JSONArray) temp.parse(response.toString());
			JSONObject resultobj=(JSONObject)resultarr.get(0);
			map.put("tier",(String)resultobj.get("tier"));
			map.put("rank",(String)resultobj.get("rank"));
			map.put("wins", String.valueOf(resultobj.get("wins")));
			map.put("losses", String.valueOf(resultobj.get("losses")));
			map.put("leaguePoints", String.valueOf(resultobj.get("leaguePoints")));
			System.out.println(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<Integer, String> mostChampion(String id){
		Map<Integer, String> map=new HashMap<>();
		StringBuffer response = new StringBuffer();
		try {
			String apiURL = APIURL+"champion-mastery/v4/champion-masteries/by-summoner/"+id;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36");
			con.setRequestProperty("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
			con.setRequestProperty("Accept-Charset", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setRequestProperty("Origin", "https://developer.riotgames.com");
			con.setRequestProperty("X-Riot-Token", APIKEY);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONParser temp=new JSONParser();
			JSONArray resultarr=(JSONArray) temp.parse(response.toString());
			for(int i=0;i<3;i++) {
				JSONObject resultobj=(JSONObject)resultarr.get(i);
				map.put(i,String.valueOf(resultobj.get("championId")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
