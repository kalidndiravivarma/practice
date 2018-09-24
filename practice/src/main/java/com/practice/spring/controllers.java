package com.practice.spring;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.practice.DAO.studentDAO;
import com.practice.Entiry.student;

@Controller
public class controllers {

	@Autowired
	studentDAO stdao;
	
	@Autowired
	student std;
	
	static final Logger logr = Logger.getLogger(controllers.class.getName());
	
	@RequestMapping("/")
	public String home(){
		
		return"index";
	}
	
	@RequestMapping("/search")
	public String two(){
		
		return"two";
	}
	
	@RequestMapping("/three")
	public String three(){
		
		return"three";
	}
	
	@RequestMapping("/queueimp")
	public void QueueImp(){
		
		ArrayList<student> stds = stdao.getstudednts();
		
		Queue que = new Queue();
		
		for(int i=0; i<=stds.size(); i++){
			que.enQueue(stds.get(i).getName());
		}
		
		que.deQueue();
		
		que.enQueue("Madan");
		que.enQueue("Porvi");
		
		que.show();
		
		logr.info("Queue size : " +que.size);
	}
	
	@RequestMapping(value="/addstudent", method=RequestMethod.POST)
	public String adduser(@ModelAttribute("stdadding") student std, HttpSession sess){
		
		sess.setAttribute("uname", std.getName());
		stdao.addstudednt(std);
		
		return "redirect:/welcome";
	}
	
	@RequestMapping("/getstudentdata")
	public ModelAndView getusers(){
		
		ModelAndView mv = new ModelAndView("three");
		
		mv.addObject("studednts", stdao.getstudednts());
		
		return mv;
	}
	
	@RequestMapping("/getstudent")
	public ModelAndView getstudent(@RequestParam int id, HttpSession sess, HttpServletRequest request){
		
		sess.invalidate();
		
		logr.info("student id is :"+ id);
		
		
		ModelAndView mv = new ModelAndView("view");
		
		if(stdao.getstudednt(id).isEmpty()) throw new ResourceNotFoundException();
		
		sess = request.getSession();
		
		sess.setAttribute("user_id", id);
		
		logr.info("yes use");
		mv.addObject("studednt", stdao.getstudednt(id));
		
		return mv;
	}
	
	@RequestMapping(value="/Updatestudent", method=RequestMethod.POST)
	public ModelAndView getstudent(@ModelAttribute student std, HttpSession sess){
		
		int id = (Integer) sess.getAttribute("user_id");
		
		logr.info("student id is :"+ id);
		
		ModelAndView mv = new ModelAndView("view");
		
		stdao.updatestudent(std, id);
		
		if(stdao.updatestudent(std, id)>0){
			logr.info("Student Updated Successfully");
			mv.addObject("studednt", stdao.getstudednt(id));
			mv.addObject("updatestatus", "Student Updated Successfully");
		}else{
			logr.info("Something went wrong please try again");
			mv.addObject("updatestatus", "Something went wrong please try again");
		}		
		
		return mv;
	}
	
	@ResponseStatus
	@ExceptionHandler(value=Exception.class)
	public String exceptions(Exception ex){
		
		System.out.println("Exception message: "+ex.getCause());
		logr.info("Exception is : "+ex);
		
		return "error";
	}
	
	@ExceptionHandler(value=SQLException.class)
	public String SqlException(SQLException ex){
		logr.info("Exception is : "+ex);
		
		return "sqlException";
	}

    @ExceptionHandler(ResourceNotFoundException.class)
	public String notfound(){
				
		return "404_page";
	}
}
