package cn.own.mhics.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.own.mhics.entity.DiaoChaNode;
import cn.own.mhics.entity.Node;
import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.Pipes;
import cn.own.mhics.entity.Project;
import cn.own.mhics.entity.Standard;
import cn.own.mhics.service.DiaoChaNodeService;
import cn.own.mhics.service.ImgUploadService;
import cn.own.mhics.service.NodeService;
import cn.own.mhics.service.PersonService;
import cn.own.mhics.service.ProjectService;
import cn.own.mhics.service.StandardService;

@Controller
@RequestMapping(value = "/node")
public class NodeController {

	@Autowired
	private NodeService nodeService;
	@Autowired
	private StandardService standardService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ImgUploadService imgus;
	@Autowired
	private PersonService personService;
	@Autowired
	private DiaoChaNodeService diaoChaNodeService;
	

	@RequestMapping(value = "/nodemanage")
	public String getAllNodes(Model model) {
		List<Node> nodeList = nodeService.getAllNode();
		model.addAttribute("nodes", nodeList);
		return "node/nodemanage";
	}
	
	 @RequestMapping(value="/nodeedit",method=RequestMethod.GET)
	 public String nodeEdit(@RequestParam(value="nodeid",required=false)Long nodeId,Model model)
	 {
		 if(nodeId!=null) {
			 Node node = nodeService.getOneNode(nodeId);
			 model.addAttribute("node",node);
			 model.addAttribute("bodyone","block");
			 model.addAttribute("bodytwo","none");
			 model.addAttribute("bodythree","none");
		 } else {
			 model.addAttribute("bodyone","none");
			 model.addAttribute("bodytwo","none");
			 model.addAttribute("bodythree","block");
		 }
		 List<Standard> standards = standardService.findAllStandard();
		 List<Project> projects = projectService.getAllProjects();
		 model.addAttribute("standards",standards);
		 model.addAttribute("projects",projects);
		 return "node/nodeedit";
	 }
	 @RequestMapping(value="/nodesave",method=RequestMethod.POST)
	 public String nodeSave(HttpSession session,Node node,@RequestParam(value="zuobiao")String zuoBiao,@RequestParam(value="projectId")Long projectId,Model model,HttpServletRequest request,
			 @RequestParam(value = "locationphoto") MultipartFile[] locationPhoto,@RequestParam(value = "internalphoto") MultipartFile[] internalPhoto,
			 @RequestParam(value = "locationsketch") MultipartFile[] locationSketch,@RequestParam(value = "planofmh") MultipartFile[] planofMh,
			 @RequestParam(value = "coverphoto") MultipartFile[] coverPhoto,@RequestParam(value = "ladderphoto") MultipartFile[] ladderPhoto,
			 @RequestParam(value = "shaftphoto") MultipartFile[] shaftPhoto,@RequestParam(value = "chamberphoto") MultipartFile[] chamberPhoto,
			 @RequestParam(value = "benchingphoto") MultipartFile[] benchingPhoto,@RequestParam(value = "otherphoto") MultipartFile[] otherPhoto,Pipes pipes) throws IllegalStateException, IOException {
		 System.out.println("当前的登录的用户id为："+session.getAttribute("userId"));

		 System.out.println("node"+node.getShaftSizek());
		 Long userId =(Long) session.getAttribute("userId"); 
		 Person person = personService.getOneUser(userId);
		 Project pro = projectService.findOne(projectId);
		 zuoBiao=zuoBiao.replace("--","");
		 if(!("".equals(zuoBiao))) {
			 String[] zb = zuoBiao.split(","); 
			 node.setZbx(zb[0]);
			 node.setZby(zb[1]); 
		 }
		 node.setInsertMan(person);
		 node.setProject(pro);
		 node.setInsertDate(new Date());
		 if(locationPhoto.length>0) {
			 node.setLocationPhoto(imgus.uploadMore(locationPhoto,"locationPhoto"));
		 }
		 if(internalPhoto.length>0) {
			 node.setInternalPhoto(imgus.uploadMore(internalPhoto,"internalPhoto"));
		 }
		 if(locationSketch.length>0) {
			 node.setLocationSketch(imgus.uploadMore(locationSketch,"locationSketch"));
		 }
		 if(planofMh.length>0) {
			 node.setPlanOfMh(imgus.uploadMore(planofMh,"planOfMh"));
		 }
		 if(coverPhoto.length>0) {
			 node.setCoverPhoto(imgus.uploadMore(coverPhoto,"coverPhoto"));
		 }
		 if(ladderPhoto.length>0) {
			 node.setLadderPhoto(imgus.uploadMore(ladderPhoto,"ladderPhoto"));
		 }
		 if(shaftPhoto.length>0) {
			 node.setShaftPhoto(imgus.uploadMore(shaftPhoto,"shaftPhoto"));
		 }
		 if(chamberPhoto.length>0) {
			 node.setChamberPhoto(imgus.uploadMore(chamberPhoto,"chamberPhoto"));
		 }
		 if(benchingPhoto.length>0) {
			 node.setBenchingPhoto(imgus.uploadMore(benchingPhoto,"benchingPhoto"));
		 }
		 if(otherPhoto.length>0) {
			 node.setOthersPhoto(imgus.uploadMore(otherPhoto,"otherPhoto"));
		 }
		 //nodeService.save(node);
		 return "redirect:nodemanage";
	 } 
	  @RequestMapping(value="/mynode") 
	 public String getMyNode(Model model) {
		  List<Node> nodeList=nodeService.getMyNode(1L);
		  model.addAttribute("nodes",nodeList);  
		  return "node/nodemanage";
	}
	@RequestMapping(value="/nodedetail",method=RequestMethod.GET)
	public String getNodeDetail(@RequestParam(value="nodeid")Long nodeId,Model model) {
		Node node = nodeService.getOneNode(nodeId);
		if(node!=null) {
			model.addAttribute("node",node);
		}
		List<Standard> standards = standardService.findAllStandard();
		 model.addAttribute("standards",standards);
		return "node/nodeedit";
	}
	@RequestMapping(value="/nodevestigation",method = RequestMethod.GET)
	public String getNodeVestigation(@RequestParam(value="nodeNo")String nodeNo,Model model) {
		List<DiaoChaNode> nodes = diaoChaNodeService.getNodeDiaoChaByNo(nodeNo);
		model.addAttribute("nodes",nodes);
		return "node/nodeinvestigations";
	}
	@RequestMapping(value="/onlynodeno",method = RequestMethod.POST)
	public @ResponseBody boolean onlyNodeNo(@RequestParam(value="nodeno")String nodeNo) {
		System.out.println("新添的沙井编号为"+nodeNo);
		Node node = nodeService.findOneByNo(nodeNo);
		System.out.println("查到的井对象为"+node);
		if(node==null) {
			return true;
		}
		else
			return false;
	}
	
	/**
	 * 将String转List
	 * @param photos
	 * @return
	 */
	public List<String> stringToList(String photos){
		List<String> photoNew = new ArrayList<>();
		String[] photoList = photos.split(",");
		System.out.println("图片数组为:"+photoList);
		Collections.addAll(photoNew,photoList);
		System.out.println("图片的List为:"+photoNew);
		return photoNew;
	}
	@RequestMapping(value="/imagedelete",method = RequestMethod.POST)
	public void deleteimge(@RequestParam(value="imgpath")String imgPath,@RequestParam(value="nodeno",required=false)String nodeNo,Model model) {
		
		System.out.println("传来的参数图片路径和nodeid为："+imgPath+"+"+nodeNo);
	}
	
}
