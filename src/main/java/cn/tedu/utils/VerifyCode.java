package cn.tedu.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;


public class VerifyCode {
	
	private static final int WIDTH = 120;
	private static final int HEIGHT = 30;
	private static String codes = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
	private static String[] fontNames = {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
	private static String text;
	
	public static void drawImage(OutputStream output) {
		//1.得到绘制环境
		BufferedImage bi = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		
		//2.得到画笔
		Graphics2D g = (Graphics2D) bi.getGraphics();
		
		//3.绘制图形
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, WIDTH, HEIGHT);
	    StringBuffer sb = new StringBuffer();
		for(int i=0;i<4;i++) {
			//设置随机颜色
			g.setColor(randomColor());
			//设置随机字体
			g.setFont(new Font(randomFont(), Font.BOLD, 22));
			//将图片旋转一定的度数，需要将度数转换为弧度
			double theta = getRandom(-45, 45) * Math.PI / 180;
			g.rotate(theta, i*30+5, HEIGHT-7);
			//设置随机字符
			String str = codes.charAt(getRandom(0, codes.length()))+"";
			g.drawString(str, i*30+5, HEIGHT-7);
			
			sb.append(str);
			
			//将图片在旋转过来
			g.rotate(-theta, i*30+5, HEIGHT-7);
		}
		//画干扰线
		drawLine(g);
		
		text = sb.toString();
		
		g.setColor(Color.GRAY);
		g.drawRect(0, 0, WIDTH-1, HEIGHT-1);
		
		//4.保存图片到指定的路劲下
		try {
			ImageIO.write(bi, "jpeg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//5.释放资源
		g.dispose();
	}
	
	//生成一个随机数
	public static int getRandom(int start,int end) {
		Random random = new Random();
		return random.nextInt(end-start)+start;
	}
	
	public static String randomFont() {
		return fontNames[getRandom(0, fontNames.length)];
	}
	
	public static void drawLine(Graphics2D g) {
		for (int j = 0; j < 6; j++) {
			g.setColor(randomColor());
			g.drawLine(getRandom(0, WIDTH), getRandom(0, HEIGHT), getRandom(0, WIDTH), getRandom(0, HEIGHT));
		}
	}
	
	public static String getCodes() {
		System.out.println(text);
		return text;
	}
	
	public static Color randomColor() {
		return new Color(getRandom(0, 200), getRandom(0, 200), getRandom(0, 200));
	}
	
	public static void main(String[] args) throws FileNotFoundException {
		//VerifyCode.drawImage(new FileOutputStream("d:/aa.jpg"));
	}
}
