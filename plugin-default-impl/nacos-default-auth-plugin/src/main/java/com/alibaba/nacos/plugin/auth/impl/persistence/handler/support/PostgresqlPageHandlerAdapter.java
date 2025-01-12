package com.alibaba.nacos.plugin.auth.impl.persistence.handler.support;

import com.alibaba.nacos.persistence.constants.PersistenceConstant;
import com.alibaba.nacos.plugin.auth.impl.constant.AuthPageConstant;
import com.alibaba.nacos.plugin.auth.impl.model.OffsetFetchResult;
import com.alibaba.nacos.plugin.auth.impl.persistence.handler.PageHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * PostgresqlPageHandlerAdapter.
 * @date: 2025-01-12 12:52
 * @author: luozh.wanfeng
 */
public class PostgresqlPageHandlerAdapter implements PageHandlerAdapter {

    private static final Logger LOGGER = LoggerFactory.getLogger(PostgresqlPageHandlerAdapter.class);

    /**
     * Determine whether the current data source supports paging.
     *
     * @param dataSourceType data source type
     * @return true if the current data source supports paging
     */
    @Override
    public boolean supports(String dataSourceType) {
        LOGGER.info("[wanfeng-develop] try to match dataSourceType Postgresql, dataSourceType={}", dataSourceType);
        return PersistenceConstant.POSTGRESQL.equals(dataSourceType);
    }

    /**
     * Add offset and fetch next.
     *
     * @param fetchSql fetch sql.
     * @param arg      arguments.
     * @param pageNo   page number.
     * @param pageSize page size.
     * @return OffsetFetchResult
     */
    @Override
    public OffsetFetchResult addOffsetAndFetchNext(String fetchSql, Object[] arg, int pageNo, int pageSize) {
        if (fetchSql.contains(AuthPageConstant.LIMIT)) {
            return new OffsetFetchResult(fetchSql, arg);
        }
        //如果执行sql中没有分页语句，拼接postgresql分页语句
        fetchSql += " " + AuthPageConstant.OFFSET_LIMIT;
        //加入分页参数
        List<Object> newArgsList = new ArrayList<>(Arrays.asList(arg));
        newArgsList.add((pageNo - 1) * pageSize);
        newArgsList.add(pageSize);
        Object[] newArgs = newArgsList.toArray(new Object[newArgsList.size()]);
        return new OffsetFetchResult(fetchSql, newArgs);
    }
}
