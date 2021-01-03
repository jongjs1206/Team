package com.vitamin.service;

import java.util.List;

import com.vitamin.domain.GogaegVO;






public interface GogaegService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertGogaeg(GogaegVO vo);

	// 글 수정
	void updateGogaeg(GogaegVO vo);

	// 글 삭제
	void deleteGogaeg(GogaegVO vo);

	// 글 상세 조회
	GogaegVO getGogaeg(GogaegVO vo);

	// 글 목록 조회
	List<GogaegVO> getGogaegList();
	

}
