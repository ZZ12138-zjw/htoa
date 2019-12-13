package com.ht.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by shkstart on 2019/11/15
 * @author LaIWeiChun
 */
public class FileUpload{

    public static String upload(MultipartFile file, String dirName, HttpServletRequest request){
        //把文件保存到upload目录下
        //保存文件，这个文件名有时候可能会重复。你保存多了会把原来的图片给覆盖掉。
        //所以为每个文件生成一个新的文件名
        String picName= UUID.randomUUID().toString();
        //截取文件的扩展名
        //获取文件上传的时文件的名
        String originalFilename = file.getOriginalFilename();
        //截取后缀
        String extName=originalFilename.substring(originalFilename.lastIndexOf("."));

        //截取项目路径
        String path = request.getSession().getServletContext().getRealPath("\\");
        //String dirName="/upload"; //这里放置上传的年月日，如果全部放到同一个文件夹里。文件太多，不容易找。

        File dirFile=new File(path+dirName);
        //创建文件夹
        if (!dirFile.exists()){
            dirFile.mkdir();
        }
        //文件名加后缀名 组成新文件名
        String newFileName=picName+extName;
        File targetFile=new File(path+dirName,newFileName);
        System.out.println("路径"+path+dirName);
        try {
            //保存文件
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return newFileName;
    }
}
