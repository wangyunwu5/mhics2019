package cn.own.mhics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import cn.own.mhics.entity.DiaoChaNode;
import cn.own.mhics.service.DiaoChaNodeService;
import cn.own.mhics.utils.PdfUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
@Controller
@RequestMapping(value = "/pdf")
public class PdfController {
 
    @Autowired
    private FreeMarkerConfigurer configurer;
    
    @Autowired
    private DiaoChaNodeService dcNodeService;
 
    /**
     * pdf预览
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping(value = "/preview", method = RequestMethod.GET)
    public void preview(HttpServletRequest request, HttpServletResponse response) {
        // 构造freemarker模板引擎参数,listVars.size()个数对应pdf页数
        List<Map<String,Object>> listVars = new ArrayList<>();
        String dcNodeId = request.getParameter("dcnodeid");
        System.out.println("获取的调查id为 "+dcNodeId);
        DiaoChaNode dcNode = dcNodeService.getOneDiaoChaNode(Long.parseLong(dcNodeId));
        
        Map<String,Object> variables = new HashMap<>();
        variables.put("title","测试预览ASGX!");
        variables.put("dcnode",dcNode);
        listVars.add(variables);
 
        PdfUtils.preview(configurer,"/investigation/pdfPage.ftl",listVars,response);
    }
    /**
     * pdf下载
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response) {
        List<Map<String,Object>> listVars = new ArrayList<>();
        Map<String,Object> variables = new HashMap<>();
        variables.put("title","测试下载ASGX!");
        listVars.add(variables);
        PdfUtils.download(configurer,"pdfPage.ftl",listVars,response,"测试中文.pdf");
    }
}
