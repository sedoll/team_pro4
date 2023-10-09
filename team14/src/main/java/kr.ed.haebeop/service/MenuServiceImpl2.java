package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Menu;
import kr.ed.haebeop.repository.MenuDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl2 implements MenuService{

    @Autowired
    private MenuDAO menuDAO;
    @Override
    public Menu getMenu(String sc_name) {
        return menuDAO.getMenu(sc_name);
    }
}
