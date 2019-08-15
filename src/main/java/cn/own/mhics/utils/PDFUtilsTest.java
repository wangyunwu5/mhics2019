package cn.own.mhics.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

import cn.own.mhics.entity.DiaoChaNode;
import cn.own.mhics.entity.DiaoChaPipe;

@Component
public class PDFUtilsTest {
	
	@Value(value="File.path")
	private String imgPath;
	
	private Document document = null ;
	
	public static void main(String[] args) {
		PDFUtilsTest pdfUtils = new PDFUtilsTest();
		pdfUtils.initPDF(null,null,"D:/pdftest/");
	}
	
	public void initPDF(DiaoChaNode dcnode,List<DiaoChaPipe> dcpipes,String filePath) {
		try {
			document = new Document(PageSize.A4);
			document.setMargins(10,10,20,20);
			//String fileName = filePath + "\\"+ dcnode.getNodeNo()+dcnode.getDcNodeId();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String date = df.format(new Date());
			String fileName1 = filePath+date;
			OutputStream outPut = new FileOutputStream(fileName1 + ".pdf");
			PdfWriter writer = PdfWriter.getInstance(document,outPut);
			MyPageEvent header = new MyPageEvent();
			writer.setPageEvent(header);
			document.open();
			
			Font font10 = getFont(10, 1, null);
			Font font10_ = getFont(10, 2, null);
			Font font8 = getFont(8, 1, null);
			Font font8_ = getFont(8, 1|2, null);
			Font font6 = getFont(6, 1, null);
			Font font4 = getFont(4, 0, null);
			Font font4_ = getFont(4,0,new BaseColor(130,130,130));
			Font font5 = getFont(5, 1, null);
			//外边的表格
			PdfPTable tableOut =getTable(1,560,new int[]{1});
			tableOut.getDefaultCell().setBorderWidth(2);
			tableOut.getDefaultCell().setPadding(8);
			PdfPCell cell = null;
			//里面的表格
			int[] topwidth=new int[] {38,39,41,42,40,30,30,30,30,40,30,30,40,40,40};
			PdfPTable tableIn =getTable(15,540,topwidth);
			tableIn.getDefaultCell().setBorderWidth(0);
			Image img = Image.getInstance("src/main/resources/static/images/pdficon.png");
			img.scaleAbsolute(30f, 30f);
			//第一行
			cell = new PdfPCell(img);
			cell.setBorderWidth(0);// 无边框  
			tableIn.addCell(cell);
			cell = getCell("The UtilityINFO Group CO.,Ltd.(TUG)",font8,1,5,20,9,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("IDMS Manhole Record Card", font8_,1,5,20,5,0,new int[] {1,1,1,1});
			tableIn.addCell(cell);
			//第二行
			cell = getCell("",font6,1,5,15,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//第三行
			cell = getCell("",font4,1,5,20,12,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(1)Node ref.",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("F01",font4,1,5,20,2,0,new int[]{1,1,1,1});
			tableIn.addCell(cell);
			//第四行
			cell = getCell("(6)Project no.",font4,1,5,20,0,0,new int[] {1,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("Y19-P022-999",font4,1,5,20,3,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(8)IDMS Manhole ID.",font4,1,5,20,0,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("--",font4,1,5,20,4,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,3,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(2)Grid ref.",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("X:1232462352",font4,1,5,20,2,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			//第五行
			cell = getCell("(7)WO no.",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("T01",font4,1,5,20,3,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(9)DSD ref.",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("--",font4,1,5,20,4,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,3,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(3)Drainage area code",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("06SW19B",font4,1,5,20,2,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			//第六行
			cell = getCell("(10)Location",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("Tai Lam Correctional Institution Junior Staff Married Quarters Block B",font4,1,5,20,8,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,3,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(4)Survey by",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("K.Y.Chan",font4,1,5,20,2,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			//第七行
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(11)Year Laid(YYYY)",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("NA",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("(12)Status*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("PR",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(13)Function*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("F",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(14)Node type*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("M",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(dia.)(mm)",font4,1,6,20,0,0,new int[] {0,0,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,1,0});
			tableIn.addCell(cell);
			cell = getCell("(5)Survey date(DDMM/YYYY)",font4,1,5,20,0,0,new int[] {0,0,1,0});
			tableIn.addCell(cell);
			cell = getCell("2019-01-28",font4,1,5,20,2,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			//第八行
			cell = getCell("COVER",font5,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(15)Shape*",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("S",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("(16)Hinged*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("N",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(17)Lock*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("N",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(18)Duty*",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("M",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(19)Cover size",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("580",font4,1,5,20,0,0,new int[] {0,0,0,1});
			tableIn.addCell(cell);
			cell = getCell("X",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("580",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(29)Toxic atmospere",font4,1,5,20,0,0,new int[] {0,1,0,1});
			tableIn.addCell(cell);
			cell = getCell("N",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			//第九行
			cell = getCell("SHAFT",font5,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(20)Side entry",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("N",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("(21)Regular course",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("0",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(22)Depth(mm)",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("160",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(23)Shaft size",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("470",font4,1,5,20,0,0,new int[] {0,0,0,1});
			tableIn.addCell(cell);
			cell = getCell("X",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("630",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(30)Evidence of vermin",font4,1,5,20,0,0,new int[] {0,1,0,1});
			tableIn.addCell(cell);
			cell = getCell("N",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			//第十行
			cell = getCell("CHAMBER",font5,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(24)Soffit*",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("S",font4,1,5,20,0,0,new int[] {0,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("(25)Steps",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("3",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(26)Ladders",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("--",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(27)LNDGS",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("--",font4,1,5,20,0,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(28)Chamber size",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("730",font4,1,5,20,0,0,new int[] {0,0,1,1});
			tableIn.addCell(cell);
			cell = getCell("X",font4,1,5,20,0,0,new int[] {0,0,1,0});
			tableIn.addCell(cell);
			cell = getCell("800",font4,1,5,20,0,0,new int[] {0,0,1,0});
			tableIn.addCell(cell);
			cell = getCell("(31)Construct code*",font4,1,5,20,0,0,new int[] {0,1,0,1});
			tableIn.addCell(cell);
			cell = getCell("I",font4,1,5,20,0,0,new int[] {0,1,1,0});
			tableIn.addCell(cell);
			//第十一行
			cell = getCell("",font4,1,5,3,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//第十二行
			cell = getCell("",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("(32)Depth of flow(mm)*",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("0",font4,1,5,20,0,0,new int[] {1,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("(33)Depth of silt",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("50",font4,1,5,20,0,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(34)Height surch(mm)",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("0",font4,1,5,20,0,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(61)MH depth(m)",font4,1,5,20,0,0,new int[] {0,1,0,0});
			tableIn.addCell(cell);
			cell = getCell("1.73",font4,1,5,20,0,0,new int[] {1,1,1,0});
			tableIn.addCell(cell);
			cell = getCell("(35)Cover level(mPD)",font4,1,5,20,0,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			cell = getCell("8.09",font4,1,5,20,0,0,new int[] {1,1,1,1});
			tableIn.addCell(cell);
			cell = getCell("",font4,1,5,20,4,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//第十三行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//第十四行,incoming pipes表
			int[] ISWirdth = new int[] {38,40,40,40,16,40,40,39,39,39,40,39,45,45};
			PdfPTable tableInStream = getTable(14,540,ISWirdth);
			PdfPCell cellIn = null;
			//左
			PdfPTable tableInLeft =getTable(2,38,new int[] {19,19});
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("INCOMING PIPES",font5,1,5,120,0,8,new int[] {0,0,0,0});
			cellIn.setRotation(90);//旋转角度
			cellIn.setRowspan(8);
			tableInLeft.addCell(cellIn);
			cellIn = getCell("A",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("B",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("C",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("D",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("E",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("F",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("G",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn = getCell("H",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableInLeft.addCell(cellIn);
			cellIn.setBorder(0);
			cellIn.setRowspan(9);
			cellIn.addElement(tableInLeft);
			tableInStream.addCell(cellIn);
			//右
			PdfPTable tableInright = getTable(13,502,new int[]{40,40,40,16,40,40,39,39,39,40,39,45,45});
			//表头1
			cellIn = getCell("(36)Upstream",font4,1,5,15,0,0,new int[] {1,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("(37)Pipe shape*",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(38)Pipe size(mm)",font4,1,5,15,3,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(39)Backdrop",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(40)Pipe materal*",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(41)Lining",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(42)Pipe depth",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(43)Invert level(mPD)",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("(71)Photo no.",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableInright.addCell(cellIn);
			PdfPTable table63 = getTable(2,90,new int[] {45,45});
			cellIn = getCell("(63)For office use",font4,1,5,8,2,0,new int[] {0,0,0,0});
			table63.addCell(cellIn);
			cellIn = getCell("Wall No.",font4,1,6,7,0,0,new int[] {0,0,0,0});
			table63.addCell(cellIn);
			cellIn = getCell("Location(m)",font4,1,6,7,0,0,new int[] {0,0,0,0});
			table63.addCell(cellIn);
			cellIn.setColspan(2);
			cellIn.setBorderWidthTop(1);
			cellIn.setBorderWidthRight(1);
			cellIn.setBorderWidthBottom(1);
			cellIn.setBackgroundColor(new BaseColor(220,220,220));
			cellIn.addElement(table63);
			tableInright.addCell(cellIn);
			//A
			cellIn = getCell("GNA",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("C",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("100",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("X",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("CI",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("N",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("0.7",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("7.39",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//B
			cellIn = getCell("GNB",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("C",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("150",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("X",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("VC",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("N",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("1.62",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("7.39",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//C
			cellIn = getCell("GNC",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("C",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("150",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("X",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("VC",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("N",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("1.62",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("7.39",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//D
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//E
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//F
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//G
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			//H
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableInright.addCell(cellIn);
			cellIn.setRowspan(9);
			cellIn.setColspan(13);
			cellIn.setBorder(0);
			cellIn.addElement(tableInright);
			tableInStream.addCell(cellIn);
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(0.5f);
			cell.addElement(tableInStream);
			tableIn.addCell(cell);
			//十五行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//十六行
			PdfPTable tableMiddle = getTable(14,540,new int[]{38,40,40,16,40,40,40,39,39,39,40,39,45,45});
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("(44)CCTV COND",font4,1,5,15,0,0,new int[] {1,1,1,1});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("Y/N",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("(45)CRITY",font4,1,5,15,0,0,new int[] {1,1,1,1});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("Y/N",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableMiddle.addCell(cellIn);
			cellIn = getCell("",font4,1,5,15,8,0,new int[] {0,0,0,0});
			tableMiddle.addCell(cellIn);
			cell.setBorder(1);
			cell.setColspan(15);
			cell.setPaddingTop(-1.5f);
			cell.addElement(tableMiddle);
			tableIn.addCell(cell);
			//十七行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//十八行,OutComing pipes表
			int[] OSWirdth = new int[] {38,40,40,40,16,40,40,39,39,39,40,39,45,45};
			PdfPTable tableOutStream = getTable(14,540,OSWirdth);
			PdfPCell cellOut = null;
			//左
			PdfPTable tableOutLeft =getTable(2,38,new int[] {19,19});
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableOutLeft.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,0,0,0});
			tableOutLeft.addCell(cellOut);
			cellOut = getCell("OUTCOMING PIPES",font5,1,5,30,0,2,new int[] {0,0,0,0});
			cellOut.setRotation(90);//旋转角度
			cellOut.setNoWrap(false);
			cellOut.setFixedHeight(30);
			tableOutLeft.addCell(cellOut);
			cellOut = getCell("X",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableOutLeft.addCell(cellOut);
			cellOut = getCell("Y",font5,1,5,15,0,0,new int[] {0,0,0,0});
			tableOutLeft.addCell(cellOut);
			 
			cellOut.setBorder(0);
			cellOut.setRowspan(3);
			cellOut.addElement(tableOutLeft);
			tableOutStream.addCell(cellOut);
			//右
			PdfPTable tableOutright = getTable(13,502,new int[]{40,40,40,16,40,40,39,39,39,40,39,45,45});
			//表头1
			cellOut = getCell("(36)Upstream",font4,1,5,15,0,0,new int[] {1,1,1,1});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(37)Pipe shape*",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(38)Pipe size(mm)",font4,1,5,15,3,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(39)Backdrop",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(40)Pipe materal*",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(41)Lining",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(42)Pipe depth",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(43)Invert level(mPD)",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("(71)Photo no.",font4,1,5,15,0,0,new int[] {1,1,1,0});
			tableOutright.addCell(cellOut);
			PdfPTable table63_1 = getTable(2,90,new int[] {45,45});
			cellOut = getCell("(63)For office use",font4,1,5,8,2,0,new int[] {0,0,0,0});
			table63_1.addCell(cellOut);
			cellOut = getCell("Wall No.",font4,1,6,7,0,0,new int[] {0,0,0,0});
			table63_1.addCell(cellOut);
			cellOut = getCell("Location(m)",font4,1,6,7,0,0,new int[] {0,0,0,0});
			table63_1.addCell(cellOut);
			cellOut.setColspan(2);
			cellOut.setBorderWidthTop(1);
			cellOut.setBorderWidthRight(1);
			cellOut.setBorderWidthBottom(1);
			cellOut.setBackgroundColor(new BaseColor(220,220,220));
			cellOut.addElement(table63_1);
			tableOutright.addCell(cellOut);
			//X
			cellOut = getCell("GNX",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableOutright.addCell(cellOut);
			cellOut = getCell("C",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("300",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("X",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("VC",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("N",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("0.7",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("7.39",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("--",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			//Y
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,1});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			cellOut = getCell("",font4,1,5,15,0,0,new int[] {0,1,1,0});
			tableOutright.addCell(cellOut);
			
			cellOut.setRowspan(3);
			cellOut.setColspan(13);
			cellOut.setBorder(0);
			cellOut.addElement(tableOutright);
			tableOutStream.addCell(cellOut);
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(-1.5f);
			cell.addElement(tableOutStream);
			tableIn.addCell(cell);
			
			
			//十九行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//二十行
			PdfPTable tableCon = getTable(18,540,new int[]{38,40,40,5,40,40,5,40,40,5,40,40,5,40,39,5,39,39});
			PdfPCell cellCon = null;
			//1
			cellCon =getCell("Conditions(Y if attention required)",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(46)Cover",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(47)Iron/Ladder",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(48)Shaft",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(49)Chamber",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(50)Benching",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("(51)Others",font4,1,5,15,0,0,new int[]{1,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("Y/N",font4,1,5,15,0,0,new int[]{1,1,1,0});
			tableCon.addCell(cellCon);
			//2
			cellCon =getCell("(52)Photo no.",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			cellCon =getCell("",font4,1,5,15,0,0,new int[]{0,0,0,0});
			tableCon.addCell(cellCon);
			cellCon =getCell("N",font4,1,5,15,2,0,new int[]{0,1,1,1});
			tableCon.addCell(cellCon);
			
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(-1.5f);
			cell.addElement(tableCon);
			tableIn.addCell(cell);
			//二十一行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//二十二行 38,40,40,5,40,40
			PdfPTable table21 = getTable(12,540,new int[] {38,19,40,106,5,40,40,40,40,40,40,92});
			PdfPCell cell21 = null;
			cell21 = getCell("(53)UTR",font4,1,5,12,0,0,new int[] {1,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,12,0,0,new int[] {1,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(59)Location Photo no.",font4,1,5,24,0,2,new int[] {1,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("F01-p01",font4,1,5,24,0,2,new int[] {1,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("",font4,1,5,24,0,2,new int[] {0,0,0,0});
			table21.addCell(cell21);
			cell21 = getCell("(63)Remarks",font4,1,5,24,0,2,new int[] {1,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("--",font4,1,5,24,6,2,new int[] {1,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(54)UTL",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(55)UTGA",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(60)Internal Photo no.",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("F01-p01",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("",font4,1,5,24,0,2,new int[] {0,0,0,0});
			table21.addCell(cell21);
			cell21 = getCell("(64)Record plan defference",font4,1,5,24,0,2,new int[] {0,1,1,1});
			cellOut.setNoWrap(false);
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("--",font4,1,5,24,5,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(56)UTS",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table21.addCell(cell21);
			
			cell21 = getCell("(57)JETTING",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("Y",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("Slope no.",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("--",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("",font4,1,5,24,0,2,new int[] {0,0,0,0});
			table21.addCell(cell21);
			cell21 = getCell("(65)Cover Type",font4,1,5,24,0,2,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("Standard",font4,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("Standard-Large",font4,1,5,24,0,2,new int[] {0,1,1,0});
			cell21.setNoWrap(false);
			table21.addCell(cell21);
			cell21 = getCell("Multiple Cover",font4_,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("Large",font4_,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("With decoration cover",font4_,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("Other()",font4_,1,5,24,0,2,new int[] {0,1,1,0});
			table21.addCell(cell21);
			cell21 = getCell("(58)ON-SLOPE",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table21.addCell(cell21);
			cell21 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table21.addCell(cell21);
			
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(0f);
			cell.addElement(table21);
			tableIn.addCell(cell);
			//二十三行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//二十四行
			PdfPTable table24 = getTable(2,540,new int[] {270,270});
			PdfPCell cell24 = null;
			cell24 = getCell("(66)Location Sketch",font4,1,5,12,0,0,new int[] {1,1,1,1});
			table24.addCell(cell24);
			cell24 = getCell("(67)Plan of MH",font4,1,5,12,0,0,new int[] {1,1,1,0});
			table24.addCell(cell24);
			Image img1 = Image.getInstance("src/main/resources/static/images/locationsketch.png");
			cell24 = getCellImg(img1,1,5,265f,165f,0,0,new int[] {0,1,1,1});
			table24.addCell(cell24);
			Image img2 = Image.getInstance("src/main/resources/static/images/planofmh.png");
			cell24 = getCellImg(img2,1,5,265f,165f,0,0,new int[] {0,1,1,0});
			table24.addCell(cell24);
			
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(0f);
			cell.addElement(table24);
			tableIn.addCell(cell);
			//25行
			cell = getCell("",font4,1,5,0,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			//26行
			PdfPTable table26 = getTable(3,540,new int[]{58,40,442});
			PdfPCell cell26 = null;
			cell26 = getCell("(68)With Risk Assessment",font4,1,5,12,0,0,new int[] {1,1,1,1});
			table26.addCell(cell26);
			cell26 = getCell("N",font4,1,5,12,0,0,new int[] {1,1,1,0});
			table26.addCell(cell26);
			cell26 = getCell("",font4,1,5,12,0,0,new int[] {0,0,0,0});
			table26.addCell(cell26);
			cell26 = getCell("(69)With Permit towork",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table26.addCell(cell26);
			cell26 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table26.addCell(cell26);
			cell26 = getCell("",font4,1,5,12,0,0,new int[] {0,0,0,0});
			table26.addCell(cell26);
			cell26 = getCell("(70)With Traffic Permit",font4,1,5,12,0,0,new int[] {0,1,1,1});
			table26.addCell(cell26);
			cell26 = getCell("N",font4,1,5,12,0,0,new int[] {0,1,1,0});
			table26.addCell(cell26);
			cell26 = getCell("",font4,1,5,12,0,0,new int[] {0,0,0,0});
			table26.addCell(cell26);
			
			cell.setColspan(15);
			cell.setBorder(0);
			cell.setPaddingTop(0f);
			cell.addElement(table26);
			tableIn.addCell(cell);
			//27行
			cell =  getCell("Remarks:*-Code desription refers to Appendix-Quick Reference for Code in IDMS Manhole Card",font6,1,5,13,15,0,new int[] {0,0,0,0});
			tableIn.addCell(cell);
			
			cell.addElement(tableIn);
			tableOut.addCell(tableIn);
			document.add(tableOut);
			document.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private PdfPCell getCellImg(Image image,int horizonalign,int verticalalign,float width,float height,int colspan,int rowspan,int[] border) {
		image.scaleAbsolute(width, height-5);
		PdfPCell cell = new PdfPCell(image);
		cell.setHorizontalAlignment(horizonalign);
		cell.setVerticalAlignment(verticalalign);
	    cell.setMinimumHeight(height); 
        cell.setUseAscender(true); 
        if(colspan>1)
        	cell.setColspan(colspan);
        if(rowspan>1)
        	cell.setRowspan(rowspan);
        if(border.length>0) {
        	for(int i =0;i<border.length;i++) {
        		if(i==0)
        			cell.setBorderWidthTop(border[i]);
        		if(i==1)
        			cell.setBorderWidthRight(border[i]);
        		if(i==2)
        			cell.setBorderWidthBottom(border[i]);
        		if(i==3)
        			cell.setBorderWidthLeft(border[i]);
        	}
        }
		return cell;
	}
	
	private PdfPCell getCell(String text,Font font,int horizonalign,int verticalalign,int height,int colspan,int rowspan,int[] border) {
		Paragraph paragraph = getParagraph(text,font); 
		PdfPCell cell = new PdfPCell(paragraph);
		cell.setHorizontalAlignment(horizonalign);// 水平居中  012左中右
		cell.setVerticalAlignment(verticalalign);// 垂直居中  456上中下
	    cell.setMinimumHeight(height); // 设置单元格高度
        cell.setUseAscender(true); // 设置可以居中
        if(colspan>1)
        	cell.setColspan(colspan);
        if(rowspan>1)
        	cell.setRowspan(rowspan);
        if(border.length>0) {
        	for(int i =0;i<border.length;i++) {
        		if(i==0)
        			cell.setBorderWidthTop(border[i]);
        		if(i==1)
        			cell.setBorderWidthRight(border[i]);
        		if(i==2)
        			cell.setBorderWidthBottom(border[i]);
        		if(i==3)
        			cell.setBorderWidthLeft(border[i]);
        	}
        }
		return cell;
	}
	
	private Font getFont(int size, int bold, BaseColor color) {
		try {
			BaseFont baseFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", false);
			Font font = new Font(baseFont, size, bold);
			font.setFamily("Times New Roman");
			if (color != null)
				font.setColor(color);
			return font;
		} catch (DocumentException | IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	/** 创建表格 */
	private PdfPTable getTable(int colspan, float width, int[] widths) {
		try {
			PdfPTable table = new PdfPTable(colspan);
			table.setTotalWidth(width);
			table.setWidths(widths);
			table.setLockedWidth(true);
			return table;
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Paragraph getParagraph(String text, Font font) {
		Paragraph paragraph = new Paragraph(text, font);
		paragraph.setAlignment(Element.ALIGN_CENTER);//对齐方式
		return paragraph;
	}
	
	
}
/** 设置页面事件 */
/*
 * class MyPageEvent extends PdfPageEventHelper { public void
 * onEndPage(PdfWriter writer, Document document) { try { BaseFont bfChinese =
 * BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", false); Font font = new
 * Font(bfChinese, 8, 0); Phrase phrase = new Phrase(writer.getPageNumber() +
 * "", font); ColumnText.showTextAligned(writer.getDirectContent(), 1, phrase,
 * 300, 16, 0); } catch (IOException | DocumentException e) {
 * e.printStackTrace(); } } }
 */