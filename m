Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31422CCB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722962166; cv=none; b=nUH78ipc9ke1l5dSuChvzHc+NU0Y/Y7Px/5tEkqyuoXRIdI5Gl0ziQVwFfnaPEQIUxoSEBG2xcq89yKwB933WLS9RdbRnjqOu8vyWN+K8vsf35ExMVfLXqbFwhl1Gft93ROm6GJyO3othXL2IM/TOJ55VOFyDjzarjSeWze/yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722962166; c=relaxed/simple;
	bh=sk0E9pXsc7mEmF6o2V1Ax5YG6xdVk9sgAWanYbJpMcw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNTYGGzWIFu0S79a+46Ia1cXHP7BBS6fJTEdMIG6RO6OYMd7lxnzcIr7+c5Fua0p7Y4cBRIOtGuqpycNb+Adwv8WzfvKI+7VUgWMvrahMgxMoDdb4HbuLGe/NLdgUS1KMvRKIqKJoXhTJEwwvIP9f/5rtv/SwTvJjnpx0reXZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pQ3U1uJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rOOxTuk9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pQ3U1uJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rOOxTuk9; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pQ3U1uJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rOOxTuk9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pQ3U1uJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rOOxTuk9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935FE60834
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.091
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_87fM6l3ZYr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Aug 2024 16:36:00 +0000 (UTC)
X-Greylist: delayed 437 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 06 Aug 2024 16:35:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C82160815
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=suse.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C82160815
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pQ3U1uJI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rOOxTuk9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pQ3U1uJI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rOOxTuk9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=<UNKNOWN> 
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8C82160815
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:35:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04EB71FDD5;
	Tue,  6 Aug 2024 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722961720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gmnc4h4upoiNRP7fRPVs2uQznB4Gy/iumz+fhcWuJ8Q=;
	b=pQ3U1uJICLuH3BgUlqVAY1gk5l2Q2Hf33qy3b8BR2xNddQsuWHDDVMN+D0Dw4hUeAtBSel
	OIpDbPSwePPYxVSx88mSueRSbkYzhCKF5f8xE2nnpfPFXTB8v2+LzGKkR+LKxX0254alVc
	C656Nok0ct5k79Ncyve432+QRzP8izI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722961720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gmnc4h4upoiNRP7fRPVs2uQznB4Gy/iumz+fhcWuJ8Q=;
	b=rOOxTuk9/K+eUSMRkK+nSvN4M14H5ru4awZ3o9nRsZ+kwL9ILPG42Cx50CegQePH3ptcWE
	/rzBlQBWzKCcpqBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pQ3U1uJI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rOOxTuk9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722961720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gmnc4h4upoiNRP7fRPVs2uQznB4Gy/iumz+fhcWuJ8Q=;
	b=pQ3U1uJICLuH3BgUlqVAY1gk5l2Q2Hf33qy3b8BR2xNddQsuWHDDVMN+D0Dw4hUeAtBSel
	OIpDbPSwePPYxVSx88mSueRSbkYzhCKF5f8xE2nnpfPFXTB8v2+LzGKkR+LKxX0254alVc
	C656Nok0ct5k79Ncyve432+QRzP8izI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722961720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gmnc4h4upoiNRP7fRPVs2uQznB4Gy/iumz+fhcWuJ8Q=;
	b=rOOxTuk9/K+eUSMRkK+nSvN4M14H5ru4awZ3o9nRsZ+kwL9ILPG42Cx50CegQePH3ptcWE
	/rzBlQBWzKCcpqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8E3113770;
	Tue,  6 Aug 2024 16:28:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cZLwKzdPsmaPfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 16:28:39 +0000
Date: Tue, 06 Aug 2024 18:29:17 +0200
Message-ID: <87cyml8vj6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	oswald.buddenhagen@gmx.de,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Fix coding style issues and warnings
In-Reply-To: <20240805155206.463035-1-abhishektamboli9@gmail.com>
References: <20240805155206.463035-1-abhishektamboli9@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmx.de,linuxfoundation.org,gmail.com,lists.linuxfoundation.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 04EB71FDD5

On Mon, 05 Aug 2024 17:52:06 +0200,
Abhishek Tamboli wrote:
> 
> Fix coding style errors and warnings in sound/pci/emu10k1/memory.c
> reported by checkpatch.pl. Changes includes:
> 
> - Add spaces after commas in macro definitions.
> - Insert blank lines after variable declarations.
> - Consistent spacing around operators.
> - Remove trailing whitespace.
> - Move EXPORT_SYMBOL declarations to immediately follow their
>   respective functions.
> - Correct spacing in conditional statements and type casts.
> 
> Fix the following errors and warnings:
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define __set_ptb_entry(emu,page,addr) \
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define __set_ptb_entry(emu,page,addr) \
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_silent_ptb(emu,page)
> 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_silent_ptb(emu,page)
> 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define set_silent_ptb(emu,page)
> 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> 
> WARNING: Missing a blank line after declarations
> +	int i;
> +	page *= UNIT_PAGES;
> 
> WARNING: Missing a blank line after declarations
> +	int i;
> +	page *= UNIT_PAGES;
> 
> ERROR: space required after that ',' (ctx:VxV)
> +#define get_emu10k1_memblk(l,member)
> 	list_entry(l, struct snd_emu10k1_memblk, member)
> 
> WARNING: space prohibited between function name and open parenthesis '('
> +	list_for_each (pos, &emu->mapped_link_head) {
> 
> WARNING: Missing a blank line after declarations
> +	struct snd_emu10k1_memblk *blk =
> 		get_emu10k1_memblk(pos, mapped_link);
> +	if (blk->mapped_page < 0)
> 
> ERROR: else should follow close brace '}'
> +		}
> +		else if (size > max_size) {
> 
> ERROR: need consistent spacing around '-' (ctx:WxV)
> +	psize = get_aligned_page(size + PAGE_SIZE -1);
>  	                                          ^
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> +EXPORT_SYMBOL(snd_emu10k1_memblk_map);
> 
> WARNING: Missing a blank line after declarations
> +		dma_addr_t addr;
> +		if (ofs >= runtime->dma_bytes)
> 
> ERROR: space prohibited after that '!' (ctx:BxW)
> +		if (! is_valid_page(emu, addr)) {
>  		    ^
> 
> ERROR: trailing whitespace
> +^Istruct snd_util_memhdr *hdr = hw->memhdr; $
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> +EXPORT_SYMBOL(snd_emu10k1_synth_alloc);
> 
> ERROR: trailing whitespace
> +^Istruct snd_util_memhdr *hdr = emu->memhdr; $
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> +EXPORT_SYMBOL(snd_emu10k1_synth_free);
> 
> WARNING: Missing a blank line after declarations
> +	int first_page, last_page;
> +	first_page = blk->first_page;
> 
> WARNING: Missing a blank line after declarations
> +	char *ptr;
> +	if (snd_BUG_ON(page < 0 || page >= emu->max_cache_pages))
> 
> ERROR: space prohibited after that '!' (ctx:BxW)
> +	if (! ptr) {
>  	    ^
> 
> ERROR: "(foo*)" should be "(foo *)"
> +	return (void*)ptr;
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> +EXPORT_SYMBOL(snd_emu10k1_synth_memset);
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> +EXPORT_SYMBOL(snd_emu10k1_synth_copy_from_user);
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Thanks for the patch.  But in general, I take this kind of
white-space-only patches as a preliminary only when coupled with some
other real fixes or improvement changes -- especially for old driver
code.  Otherwise it'd just scratch the git history.

So, if you have other actual fixes for this driver based on this clean
up, let me know.


Takashi
