package com.file;

import java.io.FileOutputStream;
import java.io.InputStream;

public class FileUpload {
	
	public boolean addFile(InputStream inputStream, String path) {
		
		try {
			byte[] bytes= new byte[inputStream.available()];
			inputStream.read();
			FileOutputStream fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(bytes);
			fileOutputStream.flush();
			fileOutputStream.close();
		
			return true;
			
		} catch (Exception e) {
		System.out.println(e.getMessage());
			return false;
		}
	}

}
