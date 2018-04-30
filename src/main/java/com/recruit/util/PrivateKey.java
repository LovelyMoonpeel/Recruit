package com.recruit.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class PrivateKey{
	
	
	PrivateKey(){
		try{
			
			//String aa = readFile("c:\\zzz\\PrivateKey.txt");
			String aa = readFile("/Users/hoonys/sts-bundle/PrivateKey.txt");
			
			accessKey = aa.substring(0, 20);
			secretKey = aa.substring(21);
			System.out.println(accessKey);
			System.out.println(secretKey);
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	private String accessKey;
	private String secretKey;
	
	public String getAccessKey() {
		return accessKey;
	}
	public void setAccessKey(String accessKey) {
		this.accessKey = accessKey;
	}
	public String getSecretKey() {
		return secretKey;
	}
	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	
	@Override
	public String toString() {
		return "PrivateKey [accessKey=" + accessKey + ", secretKey=" + secretKey + "]";
	}
	
	private String readFile(String file) throws IOException {
	    BufferedReader reader = new BufferedReader(new FileReader (file));
	    String         line = null;
	    StringBuilder  stringBuilder = new StringBuilder();
	    String         ls = System.getProperty("line.separator");

	    try {
	        while((line = reader.readLine()) != null) {
	            stringBuilder.append(line);
	            stringBuilder.append(ls);
	        }

	        return stringBuilder.toString();
	    } finally {
	        reader.close();
	    }
	}
}
