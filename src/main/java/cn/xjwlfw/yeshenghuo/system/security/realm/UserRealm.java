package cn.xjwlfw.yeshenghuo.system.security.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import cn.xjwlfw.yeshenghuo.mapper.RoleMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserRoleMapper;
import cn.xjwlfw.yeshenghuo.model.Role;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserRole;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	UserMapper userDao;
	
	@Autowired
	RoleMapper roleDao;
	
	@Autowired
	UserRoleMapper userRoleDao;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		User currentUser = userDao.selectByMobile((String) super.getAvailablePrincipal(principalCollection));
		UserRole userRole = userRoleDao.selectByUserId(currentUser.getId());
		Role role = roleDao.selectByPrimaryKey(userRole.getRoleId());
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.addRole(role.getName());
		
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		
		User currentUser = userDao.selectByMobile(token.getUsername());
		
		if (null == currentUser) { throw new AuthenticationException(); }
		
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(authenticationToken.getPrincipal(), currentUser.getPassword(), this.getName());
		
		return authenticationInfo;
	}

}
