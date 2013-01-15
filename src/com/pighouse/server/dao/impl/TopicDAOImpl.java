package com.pighouse.server.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.pighouse.server.constants.Page;
import com.pighouse.server.dao.TopicDAO;
import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.converter.TopicConverter;
import com.pighouse.server.domain.vo.TopicVO;

public class TopicDAOImpl implements TopicDAO {
	
	private static final String GET_TOPICS_BY_LASTUPDATETIME = "from Topic t " +
			"left join fetch t.comments " +
			"left join fetch t.pictures " +
			"left join fetch t.createUser " +
			"order by t.lastUpdateTime desc";
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	/**
	 * 根据当前页数和最后更新时间得到列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TopicVO> getTopicsByLastUpdateTime(final Integer pageNumber) 
	{
		List<Topic> list = hibernateTemplate.execute(new HibernateCallback<List<Topic>>() {
			@Override
			public List<Topic> doInHibernate(Session session) throws HibernateException,SQLException 
			{
				Query q = session.createQuery(GET_TOPICS_BY_LASTUPDATETIME);
				q.setFirstResult((pageNumber - 1) * Page.pageSize);
				q.setMaxResults(Page.pageSize);
				List<Topic> list = q.list();
				return list;
			}
		});
		return TopicConverter.converter(list);
	}

	/**
	 * 根据当前页数和创建时间得到列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TopicVO> getTopicsByCreateTime(final Integer pageNumber) 
	{
		List<Topic> list = hibernateTemplate.execute(new HibernateCallback<List<Topic>>() {
			@Override
			public List<Topic> doInHibernate(Session session) throws HibernateException,SQLException 
			{
				Query q = session.createQuery("from Topic t order by t.createTime desc");
				q.setFirstResult((pageNumber - 1) * Page.pageSize);
				q.setMaxResults(Page.pageSize);
				List<Topic> list = q.list();
				return list;
			}
		});
		return TopicConverter.converter(list);
	}

	/**
	 * 获取所有的TopicType
	 * 一般用于缓存类CommonCache
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TopicType> getAllTopicTypes() 
	{
		return (List<TopicType>) hibernateTemplate.find("from TopicType order by displayOrder");
	}

	/**
	 * 新增一个主题
	 */
	@Override
	public Topic addTopic(Topic topic) {
		hibernateTemplate.save(topic);
		return topic;
	}

	@Override
	public Topic updateTopic(Topic topic) {
		hibernateTemplate.update(topic);
		return topic;
	}

	@Override
	public TopicPicture getPictureById(int id) {
		return hibernateTemplate.get(TopicPicture.class, (long)id);
	}
}
