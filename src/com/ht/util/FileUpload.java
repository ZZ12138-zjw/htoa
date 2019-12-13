package com.ht.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.UUID;

/**
 * Created by shkstart on 2019/11/15
 * @author LaIWeiChun
 */
public class FileUpload {

    public static String upload(MultipartFile file, String dirName, HttpServletRequest request) {

        String prefix = "";
        String dateStr = "";
        String newFileName = "";

        if (file != null) {
            //保存文件，这个文件名有时候可能会重复。你保存多了会把原来的图片给覆盖掉。
            //所以为每个文件生成一个新的文件名
            String picName = UUID.randomUUID().toString();
            //截取文件的扩展名
            //获取文件上传的时文件的名
            String originalFilename = file.getOriginalFilename();
            //截取后缀
            prefix = originalFilename.substring(originalFilename.lastIndexOf("."));
            Date date = new Date();
            dateStr = DateHelper.formatDate(date, "yyyyMMdd");
            //截取项目路径
            String path = request.getSession().getServletContext().getRealPath("\\");
            File dirFile = new File(dirName+"\\"+dateStr);
            //创建文件夹
            if (!dirFile.exists()) {
                dirFile.mkdir();
            }
            //文件名加后缀名 组成新文件名
            newFileName = picName + prefix;
            File targetFile = new File(dirName+"\\"+dateStr, newFileName);
            //打印上传路径
            System.out.println("路径"+ dirName+"/"+dateStr);
            try {
                //保存文件
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

        return dateStr+"\\"+newFileName;

    }
}