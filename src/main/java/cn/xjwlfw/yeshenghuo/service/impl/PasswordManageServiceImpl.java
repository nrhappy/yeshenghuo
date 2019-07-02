package cn.xjwlfw.yeshenghuo.service.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.service.PasswordManageService;

@Service
public class PasswordManageServiceImpl implements PasswordManageService {

	@Autowired
	private UserMapper userDao;

	@Override
	public String toPasswrodManage() {
		return "/passwordManage";
	}

	@Override
	public String doPasswordManage(String password, String newPassword, String reNewPassword, Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		if (password.length() < 1) {
			model.addAttribute("message", "原密码不能为空！");
		} else if (newPassword.length() < 1) {
			model.addAttribute("message", "新密码不能为空！");
		} else if (!newPassword.equals(reNewPassword)) {
			model.addAttribute("message", "两次输入的新密码不一致！");
		} else if (!currentUser.getPassword().equals(password)) {
			model.addAttribute("message", "原密码错误！");
		} else {
			currentUser.setPassword(newPassword);
			if (userDao.updateByPrimaryKeySelective(currentUser) == 1) {
				model.addAttribute("message", "密码修改成功，下次登录请使用新密码！");
			} else {
				model.addAttribute("message", "密码修改失败！");
			}
		}
		return "/passwordManage";
	}

}
