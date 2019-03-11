{eval $file=$table.'.vue'}
<template>
    <section>
        <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
            <el-form :inline="true">
                <el-form-item>
                    <el-input v-model="search" placeholder="搜索"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="load_data">查询/刷新</el-button>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="row={},show_form=true,row.{$cols[0]['col_name_raw']}=0">新增</el-button>
                </el-form-item>
            </el-form>
        </el-col>
        <!--列表-->
        <el-table :data="rows"  style="width: 100%;" stripe border>
{foreach $cols $key $col}
            {if $col['extra']!='auto_increment'}
<el-table-column prop="{$col['col_name_raw']}" label="{$col['comment']}">
            </el-table-column>
            {else}
<el-table-column prop="{$col['col_name_raw']}" label="{$col['comment']}" width="80" >
            </el-table-column>
            {/if}
{/foreach}
            <el-table-column label="操作" width="230" fixed="right">
                <template scope="scope">
                    <el-button type="danger" size="small" @click="del(scope.row)">删除</el-button>
                    <el-button type="primary" size="small" @click="row=scope.row,show_form=true">修改</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-pagination
                background
                @current-change="handleCurrentChange"
                :current-page="pagenow"
                layout="total, prev, pager, next, jumper"
                :total="pagecount"
                :page-size="pagesize">
        </el-pagination>


        <el-dialog
                title="点击增加"
                :visible.sync="show_form"
                v-if="show_form"
                width="70%"
        >
            <el-form>
{foreach $cols $key $col}{if $col['extra']!='auto_increment'}
 <el-form-item label="{$col['comment']}">
                    <el-input v-model="row.{$col['col_name_raw']}" placeholder="{$col['comment']}"></el-input>
                </el-form-item>
            {else}
            {/if}
{/foreach}
                <!--
                    <el-upload
                            class="avatar-uploader"
                            :action="uploadimg"
                            :data="{field:''}"
                            :show-file-list="false"
                            :on-success="uploadsuccess"
                            >
                     <img v-if="row.icon" :src="static_base+row.icon" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>


           <template slot-scope="scope">
                <a target="_blank" :href="static_base+scope.row.icon"><img width="30" height="30" :src="static_base+scope.row.icon"/></a>
            </template>


            <template slot-scope="scope">
                {{scope.row.dateline | time('Y-m-d')}}
            </template>
                -->
                <el-form-item label="">
                    <el-button type="primary" @click="save">保存</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

    </section>

</template>
<script>
    import {API,static_base,uploadimg} from '../../api/api'
    export  default {
        data(){
            return {
                rows:[],
                pagesize:50,
                pagenow:1,
                pagecount:0,
                row:{},
                search:'',
                show_form:false,
                uploadimg:uploadimg,
                static_base:static_base
            };
        },
        methods:{
            load_data(){
                var dat = {}
                dat.pagesize = this.pagesize
                dat.p = this.pagenow
                dat.search = this.search
                API.query{$utable}(dat).then(res=>{
                    if(res.status==false){
                        this.$message({
                            message: res.msg,
                            type: 'error'
                        });
                    }else {
                        this.rows = res.data.result;
                        this.pagecount = parseInt(res.data.page.count)
                    }
                });
            },
            handleCurrentChange(page){
                this.pagenow = page;
                // this.pagenow++;
                this.load_data();
            },
            save(){
                if(!this.row.{$cols[0]['col_name_raw']}){
                    API.add{$utable}(this.row).then(res=>{
                        if(res.status==false){
                            this.$message({
                                message: res.msg,
                                type: 'error'
                            });
                    }else {
                        this.show_form = !this.show_form;
                        this.load_data();
                    }
                    })
                }else{
                    API.update{$utable}by{$cols[0]['colname']}(this.row).then(res=>{
                        if(res.status==false){
                            this.$message({
                                message: res.msg,
                                type: 'error'
                            });
                }
                 this.show_form = !this.show_form;
                 this.load_data();
            })

            }
        },
        del(dat){
            if(dat.{$cols[0]['col_name_raw']}){
                API.del{$utable}by{$cols[0]['colname']}(dat).then(res=>{
                  if(res.status==false){
                    this.$message({
                        message: res.msg,
                         type: 'error'
                         });
                  }
                  this.load_data();
                })
             }
        },
        uploadsuccess(res){
            if(res.status){
                this.row[res.data.param.field] = res.data.file.fullpath
            }
        },
    },
     mounted (){
        this.load_data();
     },
     components: {

     }
    }
</script>
