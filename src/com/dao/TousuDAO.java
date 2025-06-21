package com.dao;
import com.entity.*;

import java.util.*;
public interface TousuDAO {
	List<Tousu> selectAll(HashMap map);
	void add(Tousu tousu);
	Tousu findById(int id);
	void update(Tousu tousu);
	void delete(int id);
}
