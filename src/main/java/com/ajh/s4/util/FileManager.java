package com.ajh.s4.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	// fileSave
	// 파일저장

	public String fileSave(MultipartFile multipartFile, File file) throws Exception {
		// 파일명 생성
		String fileName = UUID.randomUUID().toString();
		fileName = fileName + "_" + multipartFile.getOriginalFilename();

		if (!file.exists()) {
			file.mkdir();
		}

		file = new File(file, fileName);

		// 저장
		// 1. FileCopyUtils
		// FileCopyUtils.copy(multipartFile.getBytes(), file);
		// 2. MultipartFile의 transferTo 메서드 사용
		multipartFile.transferTo(file);

		return fileName;

	}


}
