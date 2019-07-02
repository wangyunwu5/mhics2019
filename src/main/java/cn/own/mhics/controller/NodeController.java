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
import cn.own.mhics.entity.Pipe;
import cn.own.mhics.entity.Pipes;
import cn.own.mhics.entity.Project;
import cn.own.mhics.entity.Standard;
import cn.own.mhics.service.DiaoChaNodeService;
import cn.own.mhics.service.ImgUploadService;
import cn.own.mhics.service.NodeService;
import cn.own.mhics.service.PersonService;
import cn.own.mhics.service.PipeService;
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
	@Autowired
	private PipeService pipeService;

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
			 List<Pipe> pipes = pipeService.findPipesByNode(nodeId);
			 if(pipes.size()>0) {
				 model.addAttribute("pipes",pipes);
				 System.out.println("nodeId为"+nodeId+"pipes有数据    "+pipes);
			 }
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
			 @RequestParam(value = "benchingphoto") MultipartFile[] benchingPhoto,@RequestParam(value = "otherphoto") MultipartFile[] otherPhoto,@RequestParam(value="lophopath",required=false)String lophoPath,
			 @RequestParam(value="lophodelpath",required=false)String lophodelPath,@RequestParam(value="inphopath",required=false)String inphoPath,@RequestParam(value="inphodelpath",required=false)String inphodelPath,
			 @RequestParam(value="loskepath",required=false)String loskePath,@RequestParam(value="loskedelpath",required=false)String loskedelPath,@RequestParam(value="pompath",required=false)String pomPath,@RequestParam(value="pomdelpath",required=false)String pomdelPath,
			 @RequestParam(value="cophopath",required=false)String cophoPath,@RequestParam(value="cophodelpath",required=false)String cophodelPath,@RequestParam(value="laphopath",required=false)String laphoPath,
			 @RequestParam(value="laphodelpath",required=false)String laphodelPath,@RequestParam(value="shphopath",required=false)String shphoPath,@RequestParam(value="shphodelpath",required=false)String shphodelPath,
			 @RequestParam(value="chphopath",required=false)String chphoPath,@RequestParam(value="chphodelpath",required=false)String chphodelPath,@RequestParam(value="bephopath",required=false)String bephoPath,
			 @RequestParam(value="bephodelpath",required=false)String bephodelPath,@RequestParam(value="otphopath",required=false)String otphoPath,@RequestParam(value="otphodelpath",required=false)String otphodelPath,Pipes pipes) throws IllegalStateException, IOException {
		 System.out.println("当前的登录的用户id为："+session.getAttribute("userId"));
		 Long userId =(Long) session.getAttribute("userId");
		 Person person = personService.getOneUser(userId);
		 Project pro = projectService.findOne(projectId);
		 //修改
		 if(node.getNodeId()!=null) {
			 System.out.println("修改none"+node.getNodeId());
			 Node nodeNew = nodeService.getOneNode(node.getNodeId());
			 nodeNew.setNodeNo(node.getNodeNo());
			 nodeNew.setProject(pro);
			 nodeNew.setWorkNo(node.getWorkNo());
			 nodeNew.setIdmsManholeId(node.getIdmsManholeId());
			 nodeNew.setDsdRef(node.getDsdRef());
			 nodeNew.setDrainageAreaCode(node.getDrainageAreaCode());
			 if(!("".equals(zuoBiao))) {
				 System.out.println("坐标值"+zuoBiao);
				 String[] zb = zuoBiao.split(","); 
					 for(int i=0;i<zb.length;i++) {
						 nodeNew.setZbx(zb[i]);
						 nodeNew.setZby(zb[i]); 
					 }
			 }
			 nodeNew.setYearLaid(node.getYearLaid());
			 nodeNew.setStatus(node.getStatus());
			 nodeNew.setFunction(node.getFunction());
			 nodeNew.setNodeType(node.getNodeType());
			 nodeNew.setCoverType(node.getCoverType());
			 nodeNew.setCoverShape(node.getCoverShape());
			 nodeNew.setHinged(node.getHinged());
			 nodeNew.setLocked(node.getLocked());
			 nodeNew.setCoverDuty(node.getCoverDuty());
			 nodeNew.setCoverSizec(node.getCoverSizec());
			 nodeNew.setCoverSizek(node.getCoverSizek());
			 nodeNew.setCoverLevel(node.getCoverLevel());
			 nodeNew.setShaftSideEntry(node.getShaftSideEntry());
			 nodeNew.setShaftRegularCourse(node.getShaftRegularCourse());
			 nodeNew.setShaftDepth(node.getShaftDepth());
			 nodeNew.setShaftSizec(node.getShaftSizec());
			 nodeNew.setShaftSizek(node.getShaftSizek());
			 nodeNew.setChamberSoffit(node.getChamberSoffit());
			 nodeNew.setChamberSteps(node.getChamberSteps());
			 nodeNew.setChamberLadders(node.getChamberLadders());
			 nodeNew.setChamberLndgs(node.getChamberLndgs());
			 nodeNew.setChamberSizec(node.getChamberSizec());
			 nodeNew.setChamberSizek(node.getChamberSizek());
			 nodeNew.setToxic(node.getToxic());
			 nodeNew.setVermin(node.getVermin());
			 nodeNew.setConstructCode(node.getConstructCode());
			 nodeNew.setLocation(node.getLocation());
			 nodeNew.setLocationPhoto(node.getLocationPhoto());
			 nodeNew.setInternalPhoto(node.getInternalPhoto());
			 nodeNew.setLocationSketch(node.getLocationSketch());
			 nodeNew.setPlanOfMh(node.getPlanOfMh());
			 nodeNew.setDepthOfFlow(node.getDepthOfFlow());
			 nodeNew.setDepthOfSilt(node.getDepthOfSilt());
			 nodeNew.setHeightSurch(node.getHeightSurch());
			 nodeNew.setMhDepth(node.getMhDepth());
			 nodeNew.setUtr(node.getUtr());
			 nodeNew.setUtl(node.getUtl());
			 nodeNew.setUtga(node.getUtga());
			 nodeNew.setUts(node.getUts());
			 nodeNew.setJetting(node.getJetting());
			 nodeNew.setOnSlope(node.getOnSlope());
			 nodeNew.setSlopeNo(node.getSlopeNo());
			 nodeNew.setCoverCondition(node.getCoverCondition());
			 nodeNew.setLadderCondition(node.getLadderCondition());
			 nodeNew.setShaftCondition(node.getShaftCondition());
			 nodeNew.setChamberCondition(node.getChamberCondition());
			 nodeNew.setBenchingCondition(node.getBenchingCondition());
			 nodeNew.setOthersCondition(node.getOthersCondition());
			 nodeNew.setCctvCond(node.getCctvCond());
			 nodeNew.setCrity(node.getCrity());
			 nodeNew.setRecordPlanDifference(node.getRecordPlanDifference());
			 nodeNew.setRemark(node.getRemark());
			 nodeNew.setInsertDate(node.getInsertDate());
			 nodeNew.setInsertMan(person);
			 String lophonewpath = imgus.uploadMore(locationPhoto, "locationPhoto");
			 if(lophoPath!=null && !lophoPath.trim().equals("")) {
				 System.out.println("lophoPath有值");
				 if(lophodelPath!=null && !lophodelPath.trim().equals("")) {
					 System.out.println("lophodelPath有值");
					 imgus.deleteImg(lophodelPath);
					 if(lophonewpath!=null && !lophonewpath.trim().equals("")) {
						 nodeNew.setLocationPhoto(delPathFromMysql(lophoPath,lophodelPath)+","+lophonewpath);
					 }
					 else
						 nodeNew.setLocationPhoto(delPathFromMysql(lophoPath,lophodelPath));
				 }
				 else {
					 if(lophonewpath!=null && !lophonewpath.trim().equals("")) {
						 nodeNew.setLocationPhoto(lophoPath+","+lophonewpath);
					 }
					 else
						 nodeNew.setLocationPhoto(lophoPath);
				 }
			 }
			 else {
				 System.out.println("lophoPath无值");
				 if(lophonewpath!=null && !lophonewpath.trim().equals("")) 
					 nodeNew.setLocationPhoto(lophonewpath);
				 else;
			 }
			 
			 String inphonewpath = imgus.uploadMore(internalPhoto, "internalPhoto");
			 if(inphoPath!=null && !inphoPath.trim().equals("")) {
				 System.out.println("inphoPath有值"+inphoPath+"啊啊啊啊");
				 if(inphodelPath!=null && !inphodelPath.trim().equals("")) {
					 System.out.println("inphodelPath有值"+inphodelPath+"啊啊啊啊");
					 imgus.deleteImg(inphodelPath);
					 if(inphonewpath!=null && !inphonewpath.trim().equals("")) {
						 nodeNew.setInternalPhoto(delPathFromMysql(inphoPath,inphodelPath)+","+inphonewpath);
					 }
					 else
						 nodeNew.setInternalPhoto(delPathFromMysql(inphoPath,inphodelPath));
				 }
				 else {
					 if(inphonewpath!=null && !inphonewpath.trim().equals("")) {
						 nodeNew.setInternalPhoto(inphoPath+","+inphonewpath);
					 }
					 else
						 nodeNew.setInternalPhoto(inphoPath);
				 }
			 }
			 else {
				 System.out.println("inphoPath无值");
				 if(inphonewpath!=null && !inphonewpath.trim().equals("")) 
					 nodeNew.setInternalPhoto(inphonewpath);
				 else;
			 }
			 
			 String loskenewpath = imgus.uploadMore(locationSketch, "locationSketch");
			 if(loskePath!=null && !loskePath.trim().equals("")) {
				 System.out.println("loskePath有值");
				 if(loskedelPath!=null && !loskedelPath.trim().equals("")) {
					 System.out.println("loskedelPath有值");
					 imgus.deleteImg(loskedelPath);
					 if(loskenewpath!=null && !loskenewpath.trim().equals("")) {
						 nodeNew.setLocationSketch(delPathFromMysql(loskePath,loskedelPath)+","+loskenewpath);
					 }
					 else
						 nodeNew.setLocationSketch(delPathFromMysql(loskePath,loskedelPath));
				 }
				 else {
					 if(loskenewpath!=null && !loskenewpath.trim().equals("")) {
						 nodeNew.setLocationSketch(loskePath+","+loskenewpath);
					 }
					 else
						 nodeNew.setLocationSketch(loskePath);
				 }
			 }
			 else {
				 System.out.println("loskePath无值");
				 if(loskenewpath!=null && !loskenewpath.trim().equals("")) 
					 nodeNew.setLocationSketch(loskenewpath);
				 else;
			 }
			 
			 String plnewpath = imgus.uploadMore(planofMh, "planofMh");
			 if(pomPath!=null && !pomPath.trim().equals("")) {
				 System.out.println("pomPath有值");
				 if(pomdelPath!=null && !pomdelPath.trim().equals("")) {
					 System.out.println("pomdelPath有值");
					 imgus.deleteImg(pomdelPath);
					 if(plnewpath!=null && !plnewpath.trim().equals("")) {
						 nodeNew.setPlanOfMh(delPathFromMysql(pomPath,pomdelPath)+","+plnewpath);
					 }
					 else
						 nodeNew.setPlanOfMh(delPathFromMysql(pomPath,pomdelPath));
				 }
				 else {
					 if(plnewpath!=null && !plnewpath.trim().equals("")) {
						 nodeNew.setPlanOfMh(pomPath+","+plnewpath);
					 }
					 else
						 nodeNew.setPlanOfMh(pomPath);
				 }
			 }
			 else {
				 System.out.println("lophoPath无值");
				 if(plnewpath!=null && !plnewpath.trim().equals("")) 
					 nodeNew.setPlanOfMh(plnewpath);
				 else;
			 }
			 
			 String conewpath = imgus.uploadMore(coverPhoto, "coverPhoto");
			 if(cophoPath!=null && !cophoPath.trim().equals("")) {
				 System.out.println("cophoPath有值");
				 if(cophodelPath!=null && !cophodelPath.trim().equals("")) {
					 System.out.println("cophodelPath有值");
					 imgus.deleteImg(cophodelPath);
					 if(conewpath!=null && !conewpath.trim().equals("")) {
						 nodeNew.setCoverPhoto(delPathFromMysql(cophoPath,cophodelPath)+","+conewpath);
					 }
					 else
						 nodeNew.setCoverPhoto(delPathFromMysql(cophoPath,cophodelPath));
				 }
				 else {
					 if(conewpath!=null && !conewpath.trim().equals("")) {
						 nodeNew.setCoverPhoto(cophoPath+","+conewpath);
					 }
					 else
						 nodeNew.setCoverPhoto(cophoPath);
				 }
			 }
			 else {
				 System.out.println("cophoPath无值");
				 if(conewpath!=null && !conewpath.trim().equals("")) 
					 nodeNew.setCoverPhoto(conewpath);
				 else;
			 }
			 
			 String lanewpath = imgus.uploadMore(ladderPhoto, "ladderPhoto");
			 if(laphoPath!=null && !laphoPath.trim().equals("")) {
				 if(laphodelPath!=null && !laphodelPath.trim().equals("")) {
					 imgus.deleteImg(laphodelPath);
					 if(lanewpath!=null && !lanewpath.trim().equals("")) {
						 nodeNew.setCoverPhoto(delPathFromMysql(laphoPath,laphodelPath)+","+lanewpath);
					 }
					 else
						 nodeNew.setCoverPhoto(delPathFromMysql(laphoPath,laphodelPath));
				 }
				 else {
					 if(lanewpath != null && !lanewpath .trim().equals("")) {
						 nodeNew.setCoverPhoto(laphoPath+","+lanewpath);
					 }
					 else
						 nodeNew.setCoverPhoto(laphoPath);
				 }
			 }
			 else {
				 if(lanewpath!=null && !lanewpath.trim().equals("")) 
					 nodeNew.setCoverPhoto(lanewpath);
				 else;
			 }
			 
			 String shnewpath = imgus.uploadMore(shaftPhoto, "shaftPhoto");
			 if(shphoPath!=null && !shphoPath.trim().equals("")) {
				 if(shphodelPath!=null && !shphodelPath.trim().equals("")) {
					 imgus.deleteImg(shphodelPath);
					 if(shnewpath!=null && !shnewpath.trim().equals("")) {
						 nodeNew.setLadderPhoto(delPathFromMysql(shphoPath,shphodelPath)+","+shnewpath);
					 }
					 else
						 nodeNew.setLadderPhoto(delPathFromMysql(shphoPath,shphodelPath));
				 }
				 else {
					 if(shnewpath!=null && !shnewpath.trim().equals("")) {
						 nodeNew.setLadderPhoto(shphoPath+","+shnewpath);
					 }
					 else
						 nodeNew.setLadderPhoto(shphoPath);
				 }
			 }
			 else {
				 if(shnewpath!=null && !shnewpath.trim().equals("")) 
					 nodeNew.setLadderPhoto(shnewpath);
				 else;
			 }
			 
			 String chnewpath = imgus.uploadMore(chamberPhoto, "chamberPhoto");
			 if(chphoPath!=null && !chphoPath.trim().equals("")) {
				 if(chphodelPath!=null && !chphodelPath.trim().equals("")) {
					 imgus.deleteImg(chphodelPath);
					 if(chnewpath!=null && !chnewpath.trim().equals("")) {
						 nodeNew.setChamberPhoto(delPathFromMysql(chphoPath,chphodelPath)+","+chnewpath);
					 }
					 else
						 nodeNew.setChamberPhoto(delPathFromMysql(chphoPath,chphodelPath));
				 }
				 else {
					 if(chnewpath!=null && !chnewpath.trim().equals("")) {
						 nodeNew.setChamberPhoto(chphoPath+","+chnewpath);
					 }
					 else
						 nodeNew.setChamberPhoto(chphoPath);
				 }
			 }
			 else {
				 if(chnewpath!=null && !chnewpath.trim().equals("")) 
					 nodeNew.setChamberPhoto(chnewpath);
				 else;
			 }
			 
			 String benewpath = imgus.uploadMore(benchingPhoto, "benchingPhoto");
			 if(bephoPath!=null && !bephoPath.trim().equals("")) {
				 if(bephodelPath!=null && !bephodelPath.trim().equals("")) {
					 imgus.deleteImg(bephodelPath);
					 if(benewpath!=null && !benewpath.trim().equals("")) {
						 nodeNew.setBenchingPhoto(delPathFromMysql(bephoPath,bephodelPath)+","+benewpath);
					 }
					 else
						 nodeNew.setBenchingPhoto(delPathFromMysql(bephoPath,bephodelPath));
				 }
				 else {
					 if(benewpath!=null && !benewpath.trim().equals("")) {
						 nodeNew.setBenchingPhoto(bephoPath+","+benewpath);
					 }
					 else
						 nodeNew.setBenchingPhoto(bephoPath);
				 }
			 }
			 else {
				 if(benewpath!=null && !benewpath.trim().equals("")) 
					 nodeNew.setBenchingPhoto(benewpath);
				 else;
			 }
			 
			 String otnewpath = imgus.uploadMore(otherPhoto, "otherPhoto");
			 if(otphoPath!=null && !otphoPath.trim().equals("")) {
				 if(otphodelPath!=null && !otphodelPath.trim().equals("")) {
					 imgus.deleteImg(otphodelPath);
					 if(otnewpath!=null && !otnewpath.trim().equals("")) {
						 nodeNew.setOthersPhoto(delPathFromMysql(otphoPath,otphodelPath)+","+otnewpath);
					 }
					 else
						 nodeNew.setOthersPhoto(delPathFromMysql(otphoPath,otphodelPath));
				 }
				 else {
					 if(otnewpath!=null && !otnewpath.trim().equals("")) {
						 nodeNew.setOthersPhoto(otphoPath+","+otnewpath);
					 }
					 else
						 nodeNew.setOthersPhoto(otphoPath);
				 }
			 }
			 else {
				 if(otnewpath!=null && !otnewpath.trim().equals("")) 
					 nodeNew.setOthersPhoto(otnewpath);
				 else;
			 }
			nodeService.save(nodeNew);
			pipeEdit(pipes,nodeNew);
		 }
		 //新增
		 else {
			 System.out.println("新增none"+node.getNodeId());
			 if(!("".equals(zuoBiao))) {
				 String[] zb = zuoBiao.split(","); 
					 for(int i=0;i<zb.length;i++) {
						 node.setZbx(zb[i]);
						 node.setZby(zb[i]); 
					 }
			 }
			 node.setInsertMan(person);
			 node.setProject(pro);
			 node.setInsertDate(new Date());
			 if(!locationPhoto.equals(null) && locationPhoto.length>0) {
				 System.out.println("locationPhoto进来了");
				 node.setLocationPhoto(imgus.uploadMore(locationPhoto,"locationPhoto"));
			 }
			 if(internalPhoto!=null && internalPhoto.length>0) {
				 node.setInternalPhoto(imgus.uploadMore(internalPhoto,"internalPhoto"));
			 }
			 if(locationSketch.length>0 && locationSketch!=null) {
				 node.setLocationSketch(imgus.uploadMore(locationSketch,"locationSketch"));
			 }
			 if(planofMh.length>0 && planofMh!=null) {
				 node.setPlanOfMh(imgus.uploadMore(planofMh,"planOfMh"));
			 }
			 if(coverPhoto.length>0 && coverPhoto!=null) {
				 node.setCoverPhoto(imgus.uploadMore(coverPhoto,"coverPhoto"));
			 }
			 if(ladderPhoto.length>0 && ladderPhoto!=null) {
				 node.setLadderPhoto(imgus.uploadMore(ladderPhoto,"ladderPhoto"));
			 }
			 if(shaftPhoto.length>0 && shaftPhoto!=null) {
				 node.setShaftPhoto(imgus.uploadMore(shaftPhoto,"shaftPhoto"));
			 }
			 if(chamberPhoto.length>0 && chamberPhoto!=null) {
				 node.setChamberPhoto(imgus.uploadMore(chamberPhoto,"chamberPhoto"));
			 }
			 if(benchingPhoto.length>0 && benchingPhoto!=null) {
				 node.setBenchingPhoto(imgus.uploadMore(benchingPhoto,"benchingPhoto"));
			 }
			 if(otherPhoto.length>0 && otherPhoto!=null) {
				 node.setOthersPhoto(imgus.uploadMore(otherPhoto,"otherPhoto"));
			 }
			 nodeService.save(node);
			 Node nodeNew = nodeService.findOneByNo(node.getNodeNo());
			 pipeEdit(pipes,nodeNew);
		 }
	
		 return "redirect:nodemanage";
	 } 
	  @RequestMapping(value="/mynode") 
	 public String getMyNode(Model model,HttpSession session) {
		  Long userId =(Long) session.getAttribute("userId");
		  List<Node> nodeList=nodeService.getMyNode(userId);
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
	
	public void pipeEdit(Pipes pipes,Node node) {
		System.out.println("进入pipe编辑方法");
		System.out.println("pipelist的数据为"+pipes.getPipe());
		List<Pipe> pipeList = pipes.getPipe();
		for (Pipe pipe : pipeList) {
			if(pipe.getPipeId()!=null) {
				System.out.println("管道编号为"+pipe.getPipeId());
				Pipe pipeOld = pipeService.findOnePipe(pipe.getPipeId());
				pipeOld.setPipeNo(pipe.getPipeNo());
				pipeOld.setPipeType(pipe.getPipeType());
				pipeOld.setPipeShape(pipe.getPipeShape());
				pipeOld.setNode(node);
				pipeOld.setPipeSizec(pipe.getPipeSizec());
				pipeOld.setPipeSizek(pipe.getPipeSizek());
				pipeOld.setBackDrop(pipe.getBackDrop());
				pipeOld.setPipeMaterial(pipe.getPipeMaterial());
				pipeOld.setLining(pipe.getLining());
				pipeOld.setPipeDepth(pipe.getPipeDepth());
				pipeOld.setInvert(pipe.getInvert());
				pipeOld.setPipePhoto(pipe.getPipePhoto());
				pipeOld.setWallNo(pipe.getWallNo());
				pipeOld.setPipeLocation(pipe.getPipeLocation());
				pipeService.savePipe(pipeOld);
			}
			else {
				System.out.println("该管道还不存在，正在添加");
				pipe.setNode(node);
				pipeService.savePipe(pipe);
			}
		}
		
		
	}
	//从数据库图片路径中删除掉已选择的路径
	public String delPathFromMysql(String sqlPath,String delPath) {
		String[] deletePath=delPath.split(",");
		String[] sqlpath = sqlPath.split(",");
		List<String> list = new ArrayList<String>();
		for(int j=0;j<sqlpath.length;j++) {
			list.add(sqlpath[j]);
		}
		for(int i =0; i<deletePath.length; i++) {
			list.remove(deletePath[i]);
		}
		String path =String.join(",",list);
		System.out.println("删除后剩余的图片地址为："+path);
		return path;
	}
	
	
}
