package com.recruit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.recruit.domain.CsqnaReplyVO;
import com.recruit.service.CsqnaReplyService;

@RestController
@RequestMapping("/replies")
public class CsqnareplyController {

	@Inject
	private CsqnaReplyService service;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CsqnaReplyVO vo){
		ResponseEntity<String> entity = null;
		try{
			service.addReply(vo);
			service.updateReply(vo.getBno());
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<CsqnaReplyVO>> list(@PathVariable("bno") Integer bno){
		ResponseEntity<List<CsqnaReplyVO>> entity = null;
		try{
			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody CsqnaReplyVO vo){
		ResponseEntity<String> entity = null;
		try{
			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{bno}/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("bno") Integer bno, @PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		try{
			service.removeReply(rno);
			service.deleteReply(bno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
