{assign var="oUser" value=$oTopic->getUser()}

<article class="topic topic-type-{$oTopic->getType()}">
	<header class="topic-header">
		<h1 class="topic-title">
			{$oTopic->getTitle()|escape:'html'}
		</h1>

		<div class="topic-info">
			<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" pubdate title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
			{date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}
			</time>
		</div>
	</header>

	<div class="topic-content text">
		{hook run='topic_preview_content_begin' topic=$oTopic}

		{$oTopic->getText()}

		{hook run='topic_preview_content_end' topic=$oTopic}
	</div>

	<footer class="topic-footer">
		<ul class="topic-tags">
			<li>{$aLang.block_tags}:</li>
			{strip}
				{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
					<li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
				{/foreach}
			{/strip}
		</ul>

		<ul class="topic-info">
			<li class="topic-info-author"><a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
			{hook run='topic_preview_show_info' topic=$oTopic}
		</ul>

		{hook run='topic_preview_show_end' topic=$oTopic}
	</footer>
</article>

<hr/>

<button name="submit_topic_publish" class="button button-primary" onclick="jQuery('#submit_topic_publish').trigger('click');">{$aLang.topic_create_submit_publish}</button>
<button name="submit_preview" onclick="jQuery('#text_preview').html('').parent().hide(); return false;" class="button">{$aLang.topic_create_submit_preview_close}</button>
<button name="submit_topic_save" class="button" onclick="jQuery('#submit_topic_save').trigger('click');">{$aLang.topic_create_submit_save}</button>