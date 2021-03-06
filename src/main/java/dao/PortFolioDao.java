package dao;

import java.util.List;

import logic.History;
import logic.Project;
import logic.User;

public interface PortFolioDao {
	void insertHistory(History history);

	int maxHistoryno();

	void deleteHistory(int historyno);

	void updateHistory(History history);

	void updateUserAboutMe(User user);

	void deleteportfolio(String id);

	List<History> getHistory(String memberid,String searchType, String searchContent);

	List<Project> getProject(String id);

	Project getProjectone(String id, String projectno);

	void deleteProject(String projectno);

	void insertproject(Project project);

	int maxProjectno();

	void updateproject(Project project);

	int portfolioMax(String searchType, String searchContent, Integer createpf);

	List<User> portfoliolist(String searchType, String searchContent, Integer membergrade, Integer pageNum, int limit);

	List<User> portfoliodistinctlist(String searchType, String searchContent,int membergrade,Integer pageNum, Integer limit, int createpf);


}
