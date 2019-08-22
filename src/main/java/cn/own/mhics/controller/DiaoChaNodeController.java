package cn.own.mhics.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import cn.own.mhics.entity.DiaoChaNode;
import cn.own.mhics.entity.DiaoChaPipe;
import cn.own.mhics.entity.Node;
import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.Pipe;
import cn.own.mhics.entity.Pipes;
import cn.own.mhics.entity.Project;
import cn.own.mhics.entity.Standard;
import cn.own.mhics.service.DiaoChaNodeService;
import cn.own.mhics.service.ImgUploadService;
import cn.own.mhics.service.PersonService;
import cn.own.mhics.service.PipeService;
import cn.own.mhics.service.ProjectService;
import cn.own.mhics.service.StandardService;
import cn.own.mhics.utils.PDFUtils;

@Controller
@RequestMapping(value="/diaochanode")
public class DiaoChaNodeController {
	@Autowired
	private DiaoChaNodeService diaoChaNodeService;
	@Autowired
	private StandardService standardService;
	@Autowired
	private PipeService pipeService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ImgUploadService imgus;
	@Autowired
	private PersonService personService;
	@Autowired 
	private PDFUtils pdfUtils;
	
	@RequestMapping(value="/dcnodeedit", method = RequestMethod.GET)
	public String getDiaoChaNode(@RequestParam(value = "dcnodeid", required = false) Long dcnodeId,Model model) {
		if (dcnodeId != null) {
			DiaoChaNode dcnode = diaoChaNodeService.getOneDiaoChaNode(dcnodeId);
			List<DiaoChaPipe> dcpipes = pipeService.findDiaoChaPipesByNode(dcnodeId);
			if (dcpipes.size() > 0) {
				model.addAttribute("dcpipes", dcpipes);
				System.out.println("nodeId为" + dcnodeId + "pipes有数据    " + dcpipes);
			}
			model.addAttribute("dcnode", dcnode);
			model.addAttribute("bodyone", "block");
			model.addAttribute("bodytwo", "none");
			model.addAttribute("bodythree", "none");
		} else {
			model.addAttribute("bodyone", "none");
			model.addAttribute("bodytwo", "none");
			model.addAttribute("bodythree", "block");
		}
		List<Standard> standards = standardService.findAllStandard();
		List<Project> projects = projectService.getAllProjects();
		model.addAttribute("standards", standards);
		model.addAttribute("projects", projects);
		return "investigation/investigationedit";
	}

	@RequestMapping(value="/dcnodesave",method = RequestMethod.POST)
	public String diaoChaNodeSave(HttpSession session, DiaoChaNode dcnode, @RequestParam(value = "zuobiao") String zuoBiao,
			@RequestParam(value = "projectId") Long projectId, Model model, HttpServletRequest request,
			@RequestParam(value = "locationphoto") MultipartFile[] locationPhoto,
			@RequestParam(value = "internalphoto") MultipartFile[] internalPhoto,
			@RequestParam(value = "locationsketch") MultipartFile[] locationSketch,
			@RequestParam(value = "planofmh") MultipartFile[] planofMh,
			@RequestParam(value = "coverphoto") MultipartFile[] coverPhoto,
			@RequestParam(value = "ladderphoto") MultipartFile[] ladderPhoto,
			@RequestParam(value = "shaftphoto") MultipartFile[] shaftPhoto,
			@RequestParam(value = "chamberphoto") MultipartFile[] chamberPhoto,
			@RequestParam(value = "benchingphoto") MultipartFile[] benchingPhoto,
			@RequestParam(value = "otherphoto") MultipartFile[] otherPhoto,
			@RequestParam(value = "lophopath", required = false) String lophoPath,
			@RequestParam(value = "lophodelpath", required = false) String lophodelPath,
			@RequestParam(value = "inphopath", required = false) String inphoPath,
			@RequestParam(value = "inphodelpath", required = false) String inphodelPath,
			@RequestParam(value = "loskepath", required = false) String loskePath,
			@RequestParam(value = "loskedelpath", required = false) String loskedelPath,
			@RequestParam(value = "pompath", required = false) String pomPath,
			@RequestParam(value = "pomdelpath", required = false) String pomdelPath,
			@RequestParam(value = "cophopath", required = false) String cophoPath,
			@RequestParam(value = "cophodelpath", required = false) String cophodelPath,
			@RequestParam(value = "laphopath", required = false) String laphoPath,
			@RequestParam(value = "laphodelpath", required = false) String laphodelPath,
			@RequestParam(value = "shphopath", required = false) String shphoPath,
			@RequestParam(value = "shphodelpath", required = false) String shphodelPath,
			@RequestParam(value = "chphopath", required = false) String chphoPath,
			@RequestParam(value = "chphodelpath", required = false) String chphodelPath,
			@RequestParam(value = "bephopath", required = false) String bephoPath,
			@RequestParam(value = "bephodelpath", required = false) String bephodelPath,
			@RequestParam(value = "otphopath", required = false) String otphoPath,
			@RequestParam(value = "otphodelpath", required = false) String otphodelPath, Pipes pipes,
			@RequestParam(value = "delpipe", required = false) String delPipe) throws IllegalStateException, IOException {
		System.out.println("当前的登录的用户id为：" + session.getAttribute("userId"));
		Long userId = (Long) session.getAttribute("userId");
		Person person = personService.getOneUser(userId);
		Project pro = projectService.findOne(projectId);
		// 修改
		if (dcnode.getDcNodeId() != null) {
			System.out.println("修改none" + dcnode.getDcNodeId());
			DiaoChaNode nodeNew = diaoChaNodeService.getOneDiaoChaNode(dcnode.getDcNodeId());
			nodeNew.setNodeNo(dcnode.getNodeNo());
			nodeNew.setProject(pro);
			nodeNew.setWorkNo(dcnode.getWorkNo());
			nodeNew.setIdmsManholeId(dcnode.getIdmsManholeId());
			nodeNew.setDsdRef(dcnode.getDsdRef());
			nodeNew.setDrainageAreaCode(dcnode.getDrainageAreaCode());
			if (!("".equals(zuoBiao))) {
				System.out.println("坐标值" + zuoBiao);
				String[] zb = zuoBiao.split(",");
				for (int i = 0; i < zb.length; i++) {
					nodeNew.setZbx(zb[i]);
					nodeNew.setZby(zb[i]);
				}
			}
			nodeNew.setYearLaid(dcnode.getYearLaid());
			nodeNew.setSurveyDate(dcnode.getSurveyDate());
			nodeNew.setStatus(dcnode.getStatus());
			nodeNew.setFunction(dcnode.getFunction());
			nodeNew.setNodeType(dcnode.getNodeType());
			nodeNew.setCoverType(dcnode.getCoverType());
			nodeNew.setCoverShape(dcnode.getCoverShape());
			nodeNew.setHinged(dcnode.getHinged());
			nodeNew.setLocked(dcnode.getLocked());
			nodeNew.setCoverDuty(dcnode.getCoverDuty());
			nodeNew.setCoverSizec(dcnode.getCoverSizec());
			nodeNew.setCoverSizek(dcnode.getCoverSizek());
			nodeNew.setCoverLevel(dcnode.getCoverLevel());
			nodeNew.setShaftSideEntry(dcnode.getShaftSideEntry());
			nodeNew.setShaftRegularCourse(dcnode.getShaftRegularCourse());
			nodeNew.setShaftDepth(dcnode.getShaftDepth());
			nodeNew.setShaftSizec(dcnode.getShaftSizec());
			nodeNew.setShaftSizek(dcnode.getShaftSizek());
			nodeNew.setChamberSoffit(dcnode.getChamberSoffit());
			nodeNew.setChamberSteps(dcnode.getChamberSteps());
			nodeNew.setChamberLadders(dcnode.getChamberLadders());
			nodeNew.setChamberLndgs(dcnode.getChamberLndgs());
			nodeNew.setChamberSizec(dcnode.getChamberSizec());
			nodeNew.setChamberSizek(dcnode.getChamberSizek());
			nodeNew.setToxic(dcnode.getToxic());
			nodeNew.setVermin(dcnode.getVermin());
			nodeNew.setConstructCode(dcnode.getConstructCode());
			nodeNew.setLocation(dcnode.getLocation());
			nodeNew.setLocationPhoto(dcnode.getLocationPhoto());
			nodeNew.setInternalPhoto(dcnode.getInternalPhoto());
			nodeNew.setLocationSketch(dcnode.getLocationSketch());
			nodeNew.setPlanOfMh(dcnode.getPlanOfMh());
			nodeNew.setDepthOfFlow(dcnode.getDepthOfFlow());
			nodeNew.setDepthOfSilt(dcnode.getDepthOfSilt());
			nodeNew.setHeightSurch(dcnode.getHeightSurch());
			nodeNew.setMhDepth(dcnode.getMhDepth());
			nodeNew.setUtr(dcnode.getUtr());
			nodeNew.setUtl(dcnode.getUtl());
			nodeNew.setUtga(dcnode.getUtga());
			nodeNew.setUts(dcnode.getUts());
			nodeNew.setJetting(dcnode.getJetting());
			nodeNew.setOnSlope(dcnode.getOnSlope());
			nodeNew.setSlopeNo(dcnode.getSlopeNo());
			nodeNew.setCoverCondition(dcnode.getCoverCondition());
			nodeNew.setLadderCondition(dcnode.getLadderCondition());
			nodeNew.setShaftCondition(dcnode.getShaftCondition());
			nodeNew.setChamberCondition(dcnode.getChamberCondition());
			nodeNew.setBenchingCondition(dcnode.getBenchingCondition());
			nodeNew.setOthersCondition(dcnode.getOthersCondition());
			nodeNew.setCctvCond(dcnode.getCctvCond());
			nodeNew.setCrity(dcnode.getCrity());
			nodeNew.setRecordPlanDifference(dcnode.getRecordPlanDifference());
			nodeNew.setRemark(dcnode.getRemark());
			nodeNew.setInsertDate(dcnode.getInsertDate());
			nodeNew.setInsertMan(person);
			String lophonewpath = imgus.uploadMore(locationPhoto, "locationPhoto");
			if (lophoPath != null && !lophoPath.trim().equals("")) {
				System.out.println("lophoPath有值");
				if (lophodelPath != null && !lophodelPath.trim().equals("")) {
					System.out.println("lophodelPath有值");
					imgus.deleteImg(lophodelPath);
					if (lophonewpath != null && !lophonewpath.trim().equals("")) {
						nodeNew.setLocationPhoto(delPathFromMysql(lophoPath, lophodelPath) + "," + lophonewpath);
					} else
						nodeNew.setLocationPhoto(delPathFromMysql(lophoPath, lophodelPath));
				} else {
					if (lophonewpath != null && !lophonewpath.trim().equals("")) {
						nodeNew.setLocationPhoto(lophoPath + "," + lophonewpath);
					} else
						nodeNew.setLocationPhoto(lophoPath);
				}
			} else {
				System.out.println("lophoPath无值");
				if (lophonewpath != null && !lophonewpath.trim().equals(""))
					nodeNew.setLocationPhoto(lophonewpath);
				else
					;
			}

			String inphonewpath = imgus.uploadMore(internalPhoto, "internalPhoto");
			if (inphoPath != null && !inphoPath.trim().equals("")) {
				System.out.println("inphoPath有值" + inphoPath + "啊啊啊啊");
				if (inphodelPath != null && !inphodelPath.trim().equals("")) {
					System.out.println("inphodelPath有值" + inphodelPath + "啊啊啊啊");
					imgus.deleteImg(inphodelPath);
					if (inphonewpath != null && !inphonewpath.trim().equals("")) {
						nodeNew.setInternalPhoto(delPathFromMysql(inphoPath, inphodelPath) + "," + inphonewpath);
					} else
						nodeNew.setInternalPhoto(delPathFromMysql(inphoPath, inphodelPath));
				} else {
					if (inphonewpath != null && !inphonewpath.trim().equals("")) {
						nodeNew.setInternalPhoto(inphoPath + "," + inphonewpath);
					} else
						nodeNew.setInternalPhoto(inphoPath);
				}
			} else {
				System.out.println("inphoPath无值");
				if (inphonewpath != null && !inphonewpath.trim().equals(""))
					nodeNew.setInternalPhoto(inphonewpath);
				else
					;
			}

			String loskenewpath = imgus.uploadMore(locationSketch, "locationSketch");
			if (loskePath != null && !loskePath.trim().equals("")) {
				System.out.println("loskePath有值");
				if (loskedelPath != null && !loskedelPath.trim().equals("")) {
					System.out.println("loskedelPath有值");
					imgus.deleteImg(loskedelPath);
					if (loskenewpath != null && !loskenewpath.trim().equals("")) {
						nodeNew.setLocationSketch(delPathFromMysql(loskePath, loskedelPath) + "," + loskenewpath);
					} else
						nodeNew.setLocationSketch(delPathFromMysql(loskePath, loskedelPath));
				} else {
					if (loskenewpath != null && !loskenewpath.trim().equals("")) {
						nodeNew.setLocationSketch(loskePath + "," + loskenewpath);
					} else
						nodeNew.setLocationSketch(loskePath);
				}
			} else {
				System.out.println("loskePath无值");
				if (loskenewpath != null && !loskenewpath.trim().equals(""))
					nodeNew.setLocationSketch(loskenewpath);
				else
					;
			}

			String plnewpath = imgus.uploadMore(planofMh, "planofMh");
			if (pomPath != null && !pomPath.trim().equals("")) {
				System.out.println("pomPath有值");
				if (pomdelPath != null && !pomdelPath.trim().equals("")) {
					System.out.println("pomdelPath有值");
					imgus.deleteImg(pomdelPath);
					if (plnewpath != null && !plnewpath.trim().equals("")) {
						nodeNew.setPlanOfMh(delPathFromMysql(pomPath, pomdelPath) + "," + plnewpath);
					} else
						nodeNew.setPlanOfMh(delPathFromMysql(pomPath, pomdelPath));
				} else {
					if (plnewpath != null && !plnewpath.trim().equals("")) {
						nodeNew.setPlanOfMh(pomPath + "," + plnewpath);
					} else
						nodeNew.setPlanOfMh(pomPath);
				}
			} else {
				System.out.println("lophoPath无值");
				if (plnewpath != null && !plnewpath.trim().equals(""))
					nodeNew.setPlanOfMh(plnewpath);
				else
					;
			}

			String conewpath = imgus.uploadMore(coverPhoto, "coverPhoto");
			if (cophoPath != null && !cophoPath.trim().equals("")) {
				System.out.println("cophoPath有值");
				if (cophodelPath != null && !cophodelPath.trim().equals("")) {
					System.out.println("cophodelPath有值");
					imgus.deleteImg(cophodelPath);
					if (conewpath != null && !conewpath.trim().equals("")) {
						nodeNew.setCoverPhoto(delPathFromMysql(cophoPath, cophodelPath) + "," + conewpath);
					} else
						nodeNew.setCoverPhoto(delPathFromMysql(cophoPath, cophodelPath));
				} else {
					if (conewpath != null && !conewpath.trim().equals("")) {
						nodeNew.setCoverPhoto(cophoPath + "," + conewpath);
					} else
						nodeNew.setCoverPhoto(cophoPath);
				}
			} else {
				System.out.println("cophoPath无值");
				if (conewpath != null && !conewpath.trim().equals(""))
					nodeNew.setCoverPhoto(conewpath);
				else
					;
			}

			String lanewpath = imgus.uploadMore(ladderPhoto, "ladderPhoto");
			if (laphoPath != null && !laphoPath.trim().equals("")) {
				if (laphodelPath != null && !laphodelPath.trim().equals("")) {
					imgus.deleteImg(laphodelPath);
					if (lanewpath != null && !lanewpath.trim().equals("")) {
						nodeNew.setCoverPhoto(delPathFromMysql(laphoPath, laphodelPath) + "," + lanewpath);
					} else
						nodeNew.setCoverPhoto(delPathFromMysql(laphoPath, laphodelPath));
				} else {
					if (lanewpath != null && !lanewpath.trim().equals("")) {
						nodeNew.setCoverPhoto(laphoPath + "," + lanewpath);
					} else
						nodeNew.setCoverPhoto(laphoPath);
				}
			} else {
				if (lanewpath != null && !lanewpath.trim().equals(""))
					nodeNew.setCoverPhoto(lanewpath);
				else
					;
			}

			String shnewpath = imgus.uploadMore(shaftPhoto, "shaftPhoto");
			if (shphoPath != null && !shphoPath.trim().equals("")) {
				if (shphodelPath != null && !shphodelPath.trim().equals("")) {
					imgus.deleteImg(shphodelPath);
					if (shnewpath != null && !shnewpath.trim().equals("")) {
						nodeNew.setLadderPhoto(delPathFromMysql(shphoPath, shphodelPath) + "," + shnewpath);
					} else
						nodeNew.setLadderPhoto(delPathFromMysql(shphoPath, shphodelPath));
				} else {
					if (shnewpath != null && !shnewpath.trim().equals("")) {
						nodeNew.setLadderPhoto(shphoPath + "," + shnewpath);
					} else
						nodeNew.setLadderPhoto(shphoPath);
				}
			} else {
				if (shnewpath != null && !shnewpath.trim().equals(""))
					nodeNew.setLadderPhoto(shnewpath);
				else
					;
			}

			String chnewpath = imgus.uploadMore(chamberPhoto, "chamberPhoto");
			if (chphoPath != null && !chphoPath.trim().equals("")) {
				if (chphodelPath != null && !chphodelPath.trim().equals("")) {
					imgus.deleteImg(chphodelPath);
					if (chnewpath != null && !chnewpath.trim().equals("")) {
						nodeNew.setChamberPhoto(delPathFromMysql(chphoPath, chphodelPath) + "," + chnewpath);
					} else
						nodeNew.setChamberPhoto(delPathFromMysql(chphoPath, chphodelPath));
				} else {
					if (chnewpath != null && !chnewpath.trim().equals("")) {
						nodeNew.setChamberPhoto(chphoPath + "," + chnewpath);
					} else
						nodeNew.setChamberPhoto(chphoPath);
				}
			} else {
				if (chnewpath != null && !chnewpath.trim().equals(""))
					nodeNew.setChamberPhoto(chnewpath);
				else
					;
			}

			String benewpath = imgus.uploadMore(benchingPhoto, "benchingPhoto");
			if (bephoPath != null && !bephoPath.trim().equals("")) {
				if (bephodelPath != null && !bephodelPath.trim().equals("")) {
					imgus.deleteImg(bephodelPath);
					if (benewpath != null && !benewpath.trim().equals("")) {
						nodeNew.setBenchingPhoto(delPathFromMysql(bephoPath, bephodelPath) + "," + benewpath);
					} else
						nodeNew.setBenchingPhoto(delPathFromMysql(bephoPath, bephodelPath));
				} else {
					if (benewpath != null && !benewpath.trim().equals("")) {
						nodeNew.setBenchingPhoto(bephoPath + "," + benewpath);
					} else
						nodeNew.setBenchingPhoto(bephoPath);
				}
			} else {
				if (benewpath != null && !benewpath.trim().equals(""))
					nodeNew.setBenchingPhoto(benewpath);
				else
					;
			}

			String otnewpath = imgus.uploadMore(otherPhoto, "otherPhoto");
			if (otphoPath != null && !otphoPath.trim().equals("")) {
				if (otphodelPath != null && !otphodelPath.trim().equals("")) {
					imgus.deleteImg(otphodelPath);
					if (otnewpath != null && !otnewpath.trim().equals("")) {
						nodeNew.setOthersPhoto(delPathFromMysql(otphoPath, otphodelPath) + "," + otnewpath);
					} else
						nodeNew.setOthersPhoto(delPathFromMysql(otphoPath, otphodelPath));
				} else {
					if (otnewpath != null && !otnewpath.trim().equals("")) {
						nodeNew.setOthersPhoto(otphoPath + "," + otnewpath);
					} else
						nodeNew.setOthersPhoto(otphoPath);
				}
			} else {
				if (otnewpath != null && !otnewpath.trim().equals(""))
					nodeNew.setOthersPhoto(otnewpath);
				else
					;
			}
			diaoChaNodeService.save(nodeNew);
			diaoChaPipeEdit(pipes, nodeNew, delPipe);
		}
		// 新增
		else {
			System.out.println("新增none" + dcnode.getDcNodeId());
			if (!("".equals(zuoBiao))) {
				String[] zb = zuoBiao.split(",");
				for (int i = 0; i < zb.length; i++) {
					dcnode.setZbx(zb[i]);
					dcnode.setZby(zb[i]);
				}
			}
			dcnode.setInsertMan(person);
			dcnode.setProject(pro);
			dcnode.setInsertDate(new Date());
			if (!locationPhoto.equals(null) && locationPhoto.length > 0) {
				System.out.println("locationPhoto进来了");
				dcnode.setLocationPhoto(imgus.uploadMore(locationPhoto, "locationPhoto"));
			}
			if (internalPhoto != null && internalPhoto.length > 0) {
				dcnode.setInternalPhoto(imgus.uploadMore(internalPhoto, "internalPhoto"));
			}
			if (locationSketch.length > 0 && locationSketch != null) {
				dcnode.setLocationSketch(imgus.uploadMore(locationSketch, "locationSketch"));
			}
			if (planofMh.length > 0 && planofMh != null) {
				dcnode.setPlanOfMh(imgus.uploadMore(planofMh, "planOfMh"));
			}
			if (coverPhoto.length > 0 && coverPhoto != null) {
				dcnode.setCoverPhoto(imgus.uploadMore(coverPhoto, "coverPhoto"));
			}
			if (ladderPhoto.length > 0 && ladderPhoto != null) {
				dcnode.setLadderPhoto(imgus.uploadMore(ladderPhoto, "ladderPhoto"));
			}
			if (shaftPhoto.length > 0 && shaftPhoto != null) {
				dcnode.setShaftPhoto(imgus.uploadMore(shaftPhoto, "shaftPhoto"));
			}
			if (chamberPhoto.length > 0 && chamberPhoto != null) {
				dcnode.setChamberPhoto(imgus.uploadMore(chamberPhoto, "chamberPhoto"));
			}
			if (benchingPhoto.length > 0 && benchingPhoto != null) {
				dcnode.setBenchingPhoto(imgus.uploadMore(benchingPhoto, "benchingPhoto"));
			}
			if (otherPhoto.length > 0 && otherPhoto != null) {
				dcnode.setOthersPhoto(imgus.uploadMore(otherPhoto, "otherPhoto"));
			}
			diaoChaNodeService.save(dcnode);
			DiaoChaNode nodeNew = diaoChaNodeService.getOneNodeDiaoChaByNo(dcnode.getNodeNo());
			diaoChaPipeEdit(pipes, nodeNew, delPipe);
		}
		return "redirect:getinvestigation";
	}
	

	@RequestMapping(value = "/getinvestigation", method = RequestMethod.GET)
	public String getNodeVestigation(@RequestParam(value = "nodeNo",required=false) String nodeNo, Model model) {
		if(nodeNo!=null && nodeNo !="") {
			List<DiaoChaNode> inves = diaoChaNodeService.getNodeDiaoChaByNo(nodeNo);
			if(inves.size()>0)
				model.addAttribute("inves", inves);
		}
		else {
			List<DiaoChaNode> inves = diaoChaNodeService.getNodeDiaoChaAll();
			if(inves.size()>0)
				model.addAttribute("inves", inves);
		}
		return "investigation/diaochanodes";
	}

	
	public void diaoChaPipeEdit(Pipes pipes, DiaoChaNode dcnode, String delpipe) {
		System.out.println("删除pipeID为"+delpipe);
		String[] delPipeId = null;
		if (!delpipe.trim().equals("") && delpipe != "" && delpipe != null) {
			delPipeId = delpipe.split(",");
		}
		List<DiaoChaPipe> pipeList = pipes.getDcpipe();
		if(pipeList!=null) {
			for (DiaoChaPipe dcpipe : pipeList) {
				System.out.println("管道数据为："+dcpipe);
				String flagPipeId = String.valueOf(dcpipe.getDcpipeId());
				if(dcpipe.getDcpipeId() == null) {
					  dcpipe.setDiaoChaNode(dcnode);
					  dcpipe.setInsertDate(new Date());
					  pipeService.saveDcpipe(dcpipe);
				}
				else{
					  if(delpipe.indexOf(flagPipeId)==-1) {
						  DiaoChaPipe pipeOld =pipeService.findOneDiaoChaPipe(dcpipe.getDcpipeId());
						  pipeOld.setPipeNo(dcpipe.getPipeNo());
						  pipeOld.setPipeType(dcpipe.getPipeType());
						  pipeOld.setPipeShape(dcpipe.getPipeShape());
						  pipeOld.setDiaoChaNode(dcnode);
						  pipeOld.setPipeSizec(dcpipe.getPipeSizec());
						  pipeOld.setPipeSizek(dcpipe.getPipeSizek());
						  pipeOld.setBackDrop(dcpipe.getBackDrop());
						  pipeOld.setPipeMaterial(dcpipe.getPipeMaterial());
						  pipeOld.setLining(dcpipe.getLining());
						  pipeOld.setPipeDepth(dcpipe.getPipeDepth());
						  pipeOld.setInvert(dcpipe.getInvert());
						  pipeOld.setPhoto(dcpipe.getPhoto());
						  pipeOld.setWallNo(dcpipe.getWallNo());
						  pipeOld.setLocation(dcpipe.getLocation());
						  pipeOld.setInsertDate(dcpipe.getInsertDate());
						  pipeService.saveDcpipe(pipeOld); 
						}
					  else  ;
				}
			}	 
		}
		if (delPipeId != null) {
			for (int i = 0; i < delPipeId.length; i++) {
				pipeService.deleteDiaoChaPipeById(Long.valueOf(delPipeId[i]));
			}
		}
	}
	@RequestMapping(value="tomap", method = RequestMethod.GET)
	public String tomap(Model model) {
		
		return "cesium/map";
	}
	
	public String delPathFromMysql(String sqlPath, String delPath) {
		String[] deletePath = delPath.split(",");
		String[] sqlpath = sqlPath.split(",");
		List<String> list = new ArrayList<String>();
		for (int j = 0; j < sqlpath.length; j++) {
			list.add(sqlpath[j]);
		}
		for (int i = 0; i < deletePath.length; i++) {
			list.remove(deletePath[i]);
		}
		String path = String.join(",", list);
		return path;
	}
	
	@RequestMapping(value="/topdfreport",method = RequestMethod.GET)
	public String toReportPage(@RequestParam(value="dcnodeid")Long dcnodeId,Model model) {
		DiaoChaNode dcNode = diaoChaNodeService.getOneDiaoChaNode(dcnodeId);
		List<DiaoChaPipe> dcpipes = pipeService.findDiaoChaPipesByNode(dcnodeId);
		//model.addAttribute("dcnodeid",dcnodeId);
		pdfUtils.initPDF(dcNode,dcpipes,"d:/");
		return "success";
	}
	
	@RequestMapping(value="/getreport", method = RequestMethod.POST)
	public String getReport(@RequestParam(value="dcnodeid")Long dcnodeId, @RequestParam(value="reportway")Integer reportWay,Model model) {
		System.out.println("收到的数据为："+dcnodeId+"--"+reportWay);
		 return "redirect:/pdf/preview?dcnodeid="+dcnodeId; 
		/* return "investigation/pdfpage"; */
	}
}
