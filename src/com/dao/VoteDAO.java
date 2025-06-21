package com.dao;
import com.entity.*;

import java.util.*;
public interface VoteDAO {
	List<Vote> selectOne(HashMap map);
	void add(Vote vote);
}
