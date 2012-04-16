package com.freewebsys.blog.page;

import java.io.Serializable;
import java.util.List;

/*
 * 分页类开始.*./ /** 排序字段.
 */
public class PageConf<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	private String sortField;

	/** 排序升降.des,aesc. */
	private String sortDir;

	/** 分页开始. */
	private int start;
	/** 分页结束. */
	private int end;
	/** 每页最大数. */
	private int limit;
	/** 分页总数. */
	private int total;

	private List<T> data;

	public List<T> getData() {
		return data;
	}

	public PageConf() {
		// GWT需要的默认的构造函数。
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getCurrentPage() {
		return (int) Math.floor((double) start / limit);
	}

	public int getTotalPage() {
		/** 取得总共的页数. */
		return (int) Math.ceil((double) total / limit);
	}

	public void getGo(int page) {/* 页面跳转函数.输入要跳转的页面. */
		System.out.println("page:[" + page);
		int totalPage = getTotalPage();
		int currentPage = getCurrentPage();
		if (page <= 1) {/* 如果小于1.跳到首页. */
			getFirst();
			return;
		} else if (page >= totalPage) {/* 如果大于总页数跳到末页. */
			getLast();
			return;
		} else if (page == currentPage) {/* 当前页返回. */
			return;
		} else {/* 否则进行页面跳转.也就是计算start和end. */
			this.start = (page - 1) * limit;
			this.end = Math.min(page * limit, total);
		}
		// System.out.println("getGo:[" + toString());
	}

	public void getNext() {
		// System.out.println("getNextPage");
		int currentPage = getCurrentPage();
		int tempStart = (currentPage + 1) * limit;
		if (tempStart >= total) {
			return;
		}
		this.start = tempStart;
		this.end = Math.min((currentPage + 2) * limit, total);
		// System.out.println("getNext" + toString());
	}

	public void getFirst() {
		// System.out.println("getFirst");
		this.start = 0;
		this.end = Math.min(limit, total);
		// System.out.println("getFirst" + toString());
	}

	public void getLast() {
		// System.out.println("getEnd");
		int lastPage = getTotalPage();
		/** 如果刚好总页数刚好被整除.就往前一页. */
		if ((lastPage * limit) >= total) {
			lastPage--;
		}
		this.start = lastPage * limit;
		this.end = Math.min((lastPage + 1) * limit, total);
		// System.out.println("getLast" + toString());
	}

	public void getPrevious() {
		// System.out.println("getPreviouspage");
		int currentPage = getCurrentPage();
		/** 前一页等于当前页数乘以每页记录数. */
		this.start = Math.max((currentPage - 1) * limit, 0);
		this.end = Math.max((currentPage) * limit, limit);
		// System.out.println("getPrevious" + toString());
	}

	public boolean hasNext() {
		// System.out.println("hasNext" + toString());
		if (this.end == this.total) {
			return false;
		} else if (this.getTotalPage() <= 1) {
			return false;
		} else {
			return true;
		}
	}

	public boolean hasPrevious() {
		// System.out.println("hasPrevious" + toString());
		if (this.start == 0) {
			return false;
		} else {
			return true;
		}
	}

	public PageConf(int start, int limit, int total) {/* 构造函数.设置开始.和分页数. */
		this.start = start;
		this.limit = limit;
		// 重新计算end.
		int currentPage = getCurrentPage();
		this.end = Math.min((currentPage + 1) * limit, total);
		this.total = total;
		// System.out.println("PageConf" + toString());
	}

	@Override
	public String toString() {
		return "PageConf [end=" + end + ", start=" + start + ", total=" + total
				+ "]getCurrentPage:[" + getCurrentPage() + "]";
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortDir() {
		return sortDir;
	}

	public void setSortDir(String sortDir) {
		this.sortDir = sortDir;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}