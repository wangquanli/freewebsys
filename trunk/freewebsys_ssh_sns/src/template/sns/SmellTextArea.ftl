<#--
/*
 * $Id: a.ftl 753015 2009-03-12 21:00:23Z musachy $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<textarea id="<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id" 
	oninput="<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_onchange_id(this.value);" 
	onpropertychange="<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_onchange_id(this.value);" 
	name="<#if parameters.name??>${parameters.name?html}</#if>"
	style="<#if parameters.cssStyle??>${parameters.cssStyle?html}</#if>"
	class="<#if parameters.cssClass??>${parameters.cssClass?html}</#if>"
></textarea><#rt/>
                       
<script type="text/javascript">
$(document).ready(function(){<#rt/>
	$('#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id').bind('click',(function(){<#rt/>
		var offset = $(this).offset();<#rt/>
		/*alert(offset.left+"/"+offset.top);*/<#rt/>
		$("#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id").css("left",offset.left).css("top",offset.top+40);
		$('#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id').show();<#rt/>
		$("#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id .ke-plugin-emoticons-img").unbind('click');/**删除帮定*/<#rt/>
		$("#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id .ke-plugin-emoticons-img").bind('click',(function(){/**给连接添加事件*/<#rt/>
			/*alert($(this).attr("value"));*/<#rt/>
			$("#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id").val($("#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id").val()+"{表情"+$(this).attr("value")+"}");<#rt/>
			$("#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id").focus();<#rt/>
			<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_onchange_id($("#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id").val());<#rt/>
		}));<#rt/>
	}));<#rt/>
});<#rt/>
function <#if parameters.id??>${parameters.id?html}</#if>smell_textarea_onchange_id(val){/*更新显示数据*/<#rt/>
	if(val != null && val != undefined && val.length > 100){<#rt/>
		val = val.substr(0,100);<#rt/>
		try{<#rt/>
			$('#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id').val(val);<#rt/>
			alert("字数超出最大限制长度(100字符).");<#rt/>
		}catch(o){}<#rt/>
	}<#rt/>
	try{<#rt/>
	$('#<#if parameters.id??>${parameters.id?html}</#if>smell_show_count_id').action(val.length);<#rt/>
	}catch(o){}<#rt/>
}<#rt/>
</script>

<link type="text/css" rel="stylesheet" href="${ctx}/common/js/kindeditor/skins/default.css"></link>

<div class="ke-menu" id="<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id" style="display: none;"><#rt/>
<div class="ke-plugin-emoticons-wrapper"><#rt/>
<table cellspacing="0" cellpadding="0" border="0" class="ke-plugin-emoticons-table">
<tr><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: 0px 0px;" value="0"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -24px 0px;" value="1"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -48px 0px;" value="2"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -72px 0px;" value="3"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -96px 0px;" value="4"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -120px 0px;" value="5"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -144px 0px;" value="6"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -168px 0px;" value="7"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -192px 0px;" value="8"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1080px 0px;" value="45"></span></td>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1104px 0px;" value="46"></span></td>
</tr><#rt/>
<tr> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -216px 0px;" value="9"></span></td>  <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -240px 0px;" value="10"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -264px 0px;" value="11"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -288px 0px;" value="12"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -312px 0px;" value="13"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -336px 0px;" value="14"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -360px 0px;" value="15"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -384px 0px;" value="16"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -408px 0px;" value="17"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1128px 0px;" value="47"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1152px 0px;" value="48"></span></td><#rt/>
</tr><#rt/>
<tr> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -432px 0px;" value="18"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -456px 0px;" value="19"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -480px 0px;" value="20"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -504px 0px;" value="21"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -528px 0px;" value="22"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -552px 0px;" value="23"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -576px 0px;" value="24"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -600px 0px;" value="25"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -624px 0px;" value="26"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1176px 0px;" value="49"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1200px 0px;" value="50"></span></td><#rt/>
</tr><#rt/>
<tr> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -648px 0px;" value="27"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -672px 0px;" value="28"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -696px 0px;" value="29"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -720px 0px;" value="30"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -744px 0px;" value="31"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -768px 0px;" value="32"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -792px 0px;" value="33"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -816px 0px;" value="34"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -840px 0px;" value="35"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1224px 0px;" value="51"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1248px 0px;" value="52"></span></td><#rt/>
</tr><#rt/>
<tr> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -864px 0px;" value="36"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -888px 0px;" value="37"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -912px 0px;" value="38"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -936px 0px;" value="39"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -960px 0px;" value="40"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -984px 0px;" value="41"></span></td> <#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1008px 0px;" value="42"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1032px 0px;" value="43"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1056px 0px;" value="44"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1272px 0px;" value="53"></span></td><#rt/>
<td class="ke-plugin-emoticons-cell"><span class="ke-plugin-emoticons-img" style="background-position: -1296px 0px;" value="54"></span></td><#rt/>
</tr><#rt/>
<tr> <#rt/>
<td colspan="11" align="right"><a href="javaScript:$('#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id').hide();$('#<#if parameters.id??>${parameters.id?html}</#if>ke_menu_id .ke-plugin-emoticons-img').unbind('click');$('#<#if parameters.id??>${parameters.id?html}</#if>smell_textarea_id').focus();">关闭</a></td>
</tr>
</table>
</div>
</div>