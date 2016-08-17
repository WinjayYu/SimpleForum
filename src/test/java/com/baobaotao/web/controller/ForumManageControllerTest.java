package com.baobaotao.web.controller;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;
import java.util.List;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;
import org.unitils.spring.annotation.SpringBeanByType;
import com.baobaotao.domain.Board;
import com.baobaotao.domain.User;
import com.baobaotao.web.ForumManageController;


public class ForumManageControllerTest  extends BaseWebTest {
	@SpringBeanByType
	private ForumManageController controller;

	@Test
	public void listAllBoards()throws Exception {
		request.setRequestURI("/index");
		request.setMethod("GET");
		
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		List<Board> boards = (List<Board>)request.getAttribute("boards");
		
		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/listAllBoards");
		assertNotNull(boards);
		assertThat(boards.size(), greaterThan(1));
	}
	
	@Test
	public void addBoardPage()throws Exception {
		request.setRequestURI("/forum/addBoardPage");
		request.setMethod("GET");
		
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/addBoard");
	}
	
	@Test
	public void addBoard()throws Exception {
		request.setRequestURI("/forum/addBoard");
		request.addParameter("boardName", "育儿");
		request.addParameter("boardDesc", "育儿经验~~");
		request.setMethod("POST");
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/addBoardSuccess");
	}
	
	
	@Test
	public void setBoardManagerPage()throws Exception {
		request.setRequestURI("/forum/setBoardManagerPage");
		request.setMethod("GET");
		
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		List<Board> boards = 	(List<Board>)request.getAttribute("boards");;
		List<User> users = (List<User>)request.getAttribute("users");

		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/setBoardManager");
		
		assertNotNull(boards);
		assertNotNull(users);
	}
	
	
	@Test
	public void setBoardManager()throws Exception {
		request.setRequestURI("/forum/setBoardManager");
		request.setMethod("POST");
		request.addParameter("userName", "tom");
		request.addParameter("boardId", "1");
		
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/success");
	}
	
	
	@Test
	public void userLockManagePage()throws Exception {
		request.setRequestURI("/forum/userLockManagePage");
		request.setMethod("GET");
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		List<User> users = (List<User>)request.getAttribute("users");
		
		assertNotNull(mav);
		assertNotNull(users);
		assertEquals(mav.getViewName(), "/userLockManage");
	}
	
	@Test
	public void userLockManage()throws Exception {
		request.setRequestURI("/forum/userLockManage");
		request.addParameter("locked", "1");
		request.addParameter("userName", "tom");
		request.setMethod("POST");
		
		ModelAndView mav = handlerAdapter.handle(request, response, controller);
		assertNotNull(mav);
		assertEquals(mav.getViewName(), "/success");
	}
}
