package cn.own.mhics.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/")
public class ImgDisplayController {
	
	@Value("${Img.path}")
	private String imgPath;
	
	@RequestMapping(value="/image/**")
	public void image(HttpServletRequest request,Model model, HttpServletResponse response) throws Exception {
		System.out.println("图片路径方法");
		
		String projectPath = ClassUtils.getDefaultClassLoader().getResource("").getPath();
		String startpath = new String(URLDecoder.decode(request.getRequestURI(), "utf-8"));
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbb"+startpath);
		String path = startpath.replace("/image", "");
		File f = new File(imgPath, path);
		ServletOutputStream sos = response.getOutputStream();
		FileInputStream input = new FileInputStream(f.getPath());
		byte[] data = new byte[(int) f.length()];
		IOUtils.readFully(input, data);
		IOUtils.write(data, sos);
		input.close();
		sos.close();
	}

}
