package com.example.demo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-2", "회원가입이 완료되었습니다.", "id", id);

	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}

	public ResultData userCanDelete(int loginedMemberId, Member member) {

		if (member.getId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("해당 아이디에 대한삭제 권한이 없습니다"));
		}

		return ResultData.from("S-1", Ut.f("그동안 감사했습니다. 복구를 원한다면 문의부탁드립니다."));
	}

	public void deleteMember(int id) {
		memberRepository.deleteMember(id);

	}

}