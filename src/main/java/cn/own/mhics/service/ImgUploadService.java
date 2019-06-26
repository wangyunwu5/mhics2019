package cn.own.mhics.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

@Service
@Transactional
public class ImgUploadService {
		
	@Value("${Img.path}")
	private String rootpath;
	/**
	 * 上传单张图片
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String uploadOne(MultipartFile file,String ziduanname) throws IllegalStateException, IOException{
		File dir=new File(rootpath);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String fileName=file.getOriginalFilename();
		if(!StringUtil.isEmpty(fileName)){
			String suffix=FilenameUtils.getExtension(fileName);//获取文件后缀名
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String date = df.format(new Date());
			String newFileName = "mhics"+date+ "a." + suffix;
			File targetFile = new File(dir,newFileName);
			file.transferTo(targetFile);
			return newFileName;
		}else{
			return null;
		}
	}
	/**
	 * 上传多张图片
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String uploadMore(MultipartFile[] file,String ziduanname) throws IllegalStateException, IOException{
		  File dir=new File(rootpath);
		  if(!dir.exists()){ dir.mkdirs(); } 
		  String  imgpath="";
		  for(int i =0;i<file.length;i++) {
			  String  fileName=file[i].getOriginalFilename(); 
			  if(!StringUtil.isEmpty(fileName)){
				  String suffix=FilenameUtils.getExtension(fileName);//获取文件后缀名
				  SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				  String date = df.format(new Date());
				  String newFileName = ziduanname+date+i+ "a." + suffix;
				  File targetFile = new File(dir,newFileName);
				  file[i].transferTo(targetFile);
				  if(i+1>=file.length)
				  {
					  imgpath+=newFileName;
				  }
				  else {
					  imgpath+=newFileName+",";
				  }
			  }
			  else ;
		  }
		  System.out.println("新添图片路径为为："+imgpath);
		  return imgpath;
	}
}
