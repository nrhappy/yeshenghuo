package cn.xjwlfw.yeshenghuo.service.corporation.impl;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.service.corporation.CorporationLoginService;

@Service
public class CorporationLoginServiceImpl implements CorporationLoginService {

	@Override
	public String toLogin() {
		return "/corporation/login";
	}

	@Override
	public String doLogin(String mobile, String password, Model model) {
		UsernamePasswordToken token = new UsernamePasswordToken(mobile, password);
		Subject subject = SecurityUtils.getSubject();
		
		try {
			subject.login(token);
			
			if (subject.isAuthenticated()) {				
				return "redirect:/corporation/manage";
			} else {
				return "/corporation/login";
			}
		} catch (IncorrectCredentialsException e) {
			e.printStackTrace();
			model.addAttribute("message", "用户名或密码错误，请重新输入！");
		} catch (AuthenticationException e) {
			e.printStackTrace();
			model.addAttribute("message", "用户名或密码错误，请重新输入！");
		}
		return "/corporation/login";
	}

}
