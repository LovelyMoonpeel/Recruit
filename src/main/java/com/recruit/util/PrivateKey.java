package com.recruit.util;

public class PrivateKey {

	private String accessKey = "_";
	private String secretKey = "_";
	
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
	
}
