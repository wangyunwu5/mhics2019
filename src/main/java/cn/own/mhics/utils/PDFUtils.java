package cn.own.mhics.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.itextpdf.awt.geom.Rectangle;
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
public class PDFUtils {
	
	@Value(value="File.path")
	private String imgPath;
	
	private Document document = null ;
	
	public static void main(String[] args) {
		PDFUtils pdfUtils = new PDFUtils();
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
			
			Font font = getFont(12, 1, null);
			Paragraph paragraphone = getParagraph("The UtilityINFO Group CO.,Ltd.(TUG)",font); 
			Paragraph paragraph4 = getParagraph("IDMS Manhole Record Card", font);
			//外边的表格
			PdfPTable tableOut =getTable(1,560,new int[]{1});
			tableOut.getDefaultCell().setBorderWidth(2);
			tableOut.getDefaultCell().setPadding(12);
			
			//里面的表格
			PdfPTable tableIn =getTable(1,530,new int[] {1});
			tableIn.getDefaultCell().setBorderWidth(0);
			
			//头部的表格
			PdfPTable tableUp =getTable(3,530,new int[] {1,6,3});
			tableUp.getDefaultCell().setBorderWidth(1);
			
			Image img = Image.getInstance("src/main/resources/static/images/pdficon.png");
			img.scaleAbsolute(40f, 40f);
			PdfPCell cell = new PdfPCell(img);
			cell.setBorderWidth(0);// 无边框  
			tableUp.addCell(cell);
			cell = getCell(paragraphone);
			cell.setBorderWidth(0);// 无边框  
			tableUp.addCell(cell);
			cell = getCell(paragraph4);
			tableUp.addCell(cell);
			tableIn.addCell(tableUp);
			
			int[] topwidth=new int[] {30,30,30,30,30,30,30,30,30,30,30,30,30,30,30};
			PdfPTable tableTop = getTable(15,530,topwidth);
			tableTop.getDefaultCell().setBorderWidth(1);
			cell = getCell(paragraph4);
			tableTop.addCell(cell);
			PdfPTable tableTopLeft = getTable(1,300,new int[] {1});
			
			
			tableOut.addCell(tableIn);
			document.add(tableOut);
			document.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private PdfPCell getCell(Paragraph paragraph) {
		PdfPCell cell = new PdfPCell(paragraph);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中  
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中 
	    cell.setMinimumHeight(20); // 设置单元格高度
        cell.setUseAscender(true); // 设置可以居中
        cell.setBorder(0);
        cell.setColspan(2);
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
class MyPageEvent extends PdfPageEventHelper {
	public void onEndPage(PdfWriter writer, Document document) {
		try {
			BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", false);
			Font font = new Font(bfChinese, 8, 0);
			Phrase phrase = new Phrase(writer.getPageNumber() + "", font);
			ColumnText.showTextAligned(writer.getDirectContent(), 1, phrase, 300, 16, 0);
		} catch (IOException | DocumentException e) {
			e.printStackTrace();
		}
	}
}