package com.hk1.gallery.dao;

import java.util.List;

import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.RequestDto;

public interface IRequestDao {


	boolean insertRequest(RequestDto requestDto); 	//U , M

	boolean updateRequest(RequestDto requestDto); 	//U , M

	boolean deleteRequest(int r_no); 			//U , M

	RequestDto selectRequest(int r_no);			//U , M

	
	
	List<RequestDto> selectR_receiveRequestList(RequestDto requestDto);
	List<RequestDto> selectR_sendRequestList(RequestDto requestDto);
	
	List<RequestDto> selectRequestList();			//M
	
	public int requestpagenum_r(int r_receive);
	public int requestpagenum_s(int r_send);

}
