{eval $file=$table_seg_['end']['Name'].'Controller.java'}
/**
 *
 */
package {$package}.app.controller.def;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import {$package}.app.controller.base.BaseController;
import {$package}.base.domain.def.{$TableName};
import {$package}.base.pojo.base.PageDto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}Dto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}QueryDto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}Vo;
import {$package}.base.service.def.{$TableName}Service;
import {$package}.common.constants.EerrorCode;
import {$package}.common.dto.web.RequestObject;
import {$package}.common.dto.web.Result;
import {$package}.common.sequence.SequenceUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * All rights Reserved, Designed By lanxiushuang
 *
 * @Title: {$table_seg_['end']['Name']}Controller.java
 * @Package {$package}.app.controller.mall
 * @author: lanxiushuang
 * @date: 2019年1月18日 下午3:06:13
 * @version:
 */
@Api(tags = "{$table_des}相关API")
@RestController
@RequestMapping("/api/{$table_seg_['end']['name']}")
public class {$table_seg_['end']['Name']}Controller extends BaseController {

	@Autowired
	private {$TableName}Service {$tableName};

	/**
	 * 添加{$table_des}
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "添加{$table_des}")
	@PostMapping("/add{$table_seg_['end']['Name']}")
	public Result<Long> add{$table_seg_['end']['Name']}(@RequestBody RequestObject<{$table_seg_['end']['Name']}Dto> request) {
		System.out.println("dsfdfa");
		if (request == null || request.getData() == null) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
		{$table_seg_['end']['Name']}Dto {$table_seg_['end']['name']}Dto  = request.getData();
		{$TableName} def{$table_seg_['end']['Name']}Info = new {$TableName}();
		BeanUtils.copyProperties({$table_seg_['end']['name']}Dto,def{$table_seg_['end']['Name']}Info);
		def{$table_seg_['end']['Name']}Info.set{$table_seg_['end']['Name']}Id(SequenceUtil.getSeqId());
        def{$table_seg_['end']['Name']}.setCreateTime(new Date());
        def{$table_seg_['end']['Name']}.setCreateBy(getUserId());
        def{$table_seg_['end']['Name']}.setCreateByType(getUser().getUserType());
		{$tableName}.insertSelective(def{$table_seg_['end']['Name']}Info);
		return Result.success(request, "添加成功");
	}

	/**
	 * 修改{$table_des}
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "修改{$table_des}")
	@PostMapping("/update{$table_seg_['end']['Name']}")
	public Result<Long> update{$table_seg_['end']['Name']}(@RequestBody RequestObject<{$table_seg_['end']['Name']}Dto> request) {
		if (request == null || request.getData() == null) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
		{$table_seg_['end']['Name']}Dto {$table_seg_['end']['name']}Dto  = request.getData();
		{$TableName} def{$table_seg_['end']['Name']}Info = new {$TableName}();
		BeanUtils.copyProperties({$table_seg_['end']['name']}Dto,def{$table_seg_['end']['Name']}Info);
		{$tableName}.updateByPrimaryKeySelective(def{$table_seg_['end']['Name']}Info);
		return Result.success(request);
	}

	/**
	 * 删除{$table_des}
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "删除 {$table_des},传入{$table_des}ID")
	@PostMapping("/delete{$table_seg_['end']['Name']}")
	public Result<Void> delete{$table_seg_['end']['Name']}(@RequestBody RequestObject<Long> request) {
		if (request == null || request.getData() == null) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
		{$tableName}.deleteByPrimaryKey(request.getData());
		return Result.success(request);
	}

	/**
	 * 获取{$table_des}信息
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "获取{$table_des}信息，入参：{$table_des}ID")
	@PostMapping("/get{$table_seg_['end']['Name']}")
	public Result<{$table_seg_['end']['Name']}Vo> get{$table_seg_['end']['Name']}(@RequestBody RequestObject<Long> request) {
		if (request == null || request.getData() == null||request.getData()<=0) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
        {$TableName} data = new {$TableName}();
        data.set{$cols[0]['ColName']}(request.getData());
        data.setDeleteMark(DeleteMark.NOTDETETE.value());
        {$table_seg_['end']['Name']}Vo dat = {$tableName}.find{$TableName}(data);
        if(dat==null){
            return  Result.error(request,"未找到该条数据");
        }
		
		return Result.success(request,dat);
	}

	/**
	 * 分页查询 {$table_des}
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "分页查询 {$table_des}")
	@PostMapping("/page{$table_seg_['end']['Name']}s")
	public Result<PageInfo<{$table_seg_['end']['Name']}Vo>> page{$table_seg_['end']['Name']}s(@RequestBody RequestObject<PageDto<{$table_seg_['end']['Name']}QueryDto>> request) {

		if (request == null || request.getData() == null) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
		PageDto<{$table_seg_['end']['Name']}QueryDto> dto = request.getData();


		{$table_seg_['end']['Name']}QueryDto {$table_seg_['end']['name']}QueryDto = dto.getQuery();
		if ({$table_seg_['end']['name']}QueryDto == null) {
			{$table_seg_['end']['name']}QueryDto = new {$table_seg_['end']['Name']}QueryDto();
		}

		PageHelper.startPage(dto.getPageNum(), dto.getPageSize());
		List<{$table_seg_['end']['Name']}Vo> list = {$tableName}.query{$TableName}({$table_seg_['end']['name']}QueryDto);
		return Result.success(request, new PageInfo<>(list));
	}

	/**
	 * 获取{$table_des}树
	 *
	 * @param request
	 * @return
	 */
	@ApiOperation(value = "获取 {$table_des}树")
	@PostMapping("/select{$table_seg_['end']['Name']}s")
	public Result<List<{$table_seg_['end']['Name']}Vo>> select{$table_seg_['end']['Name']}s(@RequestBody RequestObject<{$table_seg_['end']['Name']}QueryDto> request) {
		if (request == null || request.getData() == null) {
			return Result.error(request, HttpStatus.BAD_REQUEST.value(), EerrorCode.PARMA_EMPTY.value(), EerrorCode.PARMA_EMPTY.desc());
		}
		{$table_seg_['end']['Name']}QueryDto query = request.getData();

		if (query.getUpperId() == null) {
			query.setUpperId(0L);
		}
		List<{$table_seg_['end']['Name']}Vo> {$table_seg_['end']['name']}Vos = {$tableName}.selectByQuery(query);
		for ({$table_seg_['end']['Name']}Vo vo : {$table_seg_['end']['name']}Vos) {
			query.setUpperId(vo.get{$table_seg_['end']['Name']}Id());
			setupSubTree(vo, query);
		}

		return Result.success(request, {$table_seg_['end']['name']}Vos);
	}


	/**
	 * 查询下级
	 *
	 * @param vo
	 * @param dto
	 */
	private void setupSubTree({$table_seg_['end']['Name']}Vo vo, {$table_seg_['end']['Name']}QueryDto dto) {
		List<{$table_seg_['end']['Name']}Vo> {$table_seg_['end']['name']}Vos = {$tableName}.selectByQuery(dto);
		for ({$table_seg_['end']['Name']}Vo sub : {$table_seg_['end']['name']}Vos) {
			dto.setUpperId(sub.get{$table_seg_['end']['Name']}Id());
			setupSubTree(sub, dto);
		}
		vo.setSub{$table_seg_['end']['Name']}s({$table_seg_['end']['name']}Vos);
	}

}
