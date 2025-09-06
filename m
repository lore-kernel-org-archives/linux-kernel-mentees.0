Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3626269AE9
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  6 Sep 2025 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757181396; cv=none; b=BkIDsTOudndyfp4eeeFLvM0JkDNUW9rWS4saNIUq4YxQDDQlW6mqSKa3UcbkmG+U5Ptf24UCtMeudpM0gPrPSKcDlywlZYgIBYGJlIhoLq+nbi5TGnXEcq20Cqvx6IRDMHqE9qambIExSKCX/+LMcRkleKWD4C5O1+HPymGU8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757181396; c=relaxed/simple;
	bh=TlJcoruACosi0GejVB8NJ5ytl3CI+BoRn7wrJ8aqlCA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ng1sNQCiCZvq/YkhpoT0FajwhVEC3iIkKGjt288GlAPalVij8qvriJRyCZbBkMrzCdXvWjqBuzv4vTjrgykA5C+0uIzt17w4hoF9/ilIgnMB4B1q+CLDbkge6HjBOjvizRYfqBM5RPNqKms2s9ZsLH+YQnizLexTQ3bNNSMjgIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=17Hj/bA3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KssCuVn7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vgHpmps+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kumzEqcE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="17Hj/bA3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KssCuVn7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vgHpmps+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kumzEqcE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C79201F399;
	Sat,  6 Sep 2025 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757181385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12F3kCW5CZb+l7AZVYonLaqzXLtYNBKs1C1YeZZwquE=;
	b=17Hj/bA3CqWGpIPtNnCeexEbNHNN8JQiIblLq3WTBTXF3FZ72UJpY4oC7rvtFlA7lOsLvy
	EB8Bm9mdLc7l5I5OZ+IJJp2Zo+hCLcQJ5CWQB0EbDkaIoRrz7HLiE55Wpk5wrCT0V2V6vI
	T61g6BFLavDZN4q/Zp+6oAjK4AMDkOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757181385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12F3kCW5CZb+l7AZVYonLaqzXLtYNBKs1C1YeZZwquE=;
	b=KssCuVn73OHy9jnk59XwaFu7PP2h9G0viFN7Sqe2N8ViwORb0b7Zt/xFPhMwHlDTBlXOGJ
	Ts4MnmCzoeb3XMDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vgHpmps+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kumzEqcE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757181384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12F3kCW5CZb+l7AZVYonLaqzXLtYNBKs1C1YeZZwquE=;
	b=vgHpmps+/C+LfEDzrW71V2ZM3lNz7ng6dsm5bFtfvy5Gov5lDAgoug1lV4BEj+sbxsJM/V
	O5tRW8rANYQN+sZyena0PvEJL2ILqEew5jMUewvPGZkOkZoDHDKKZ+Fu2e37BxAv3llIrC
	h4nWIt24aICfSVzwLOUIq8vesRTFTjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757181384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12F3kCW5CZb+l7AZVYonLaqzXLtYNBKs1C1YeZZwquE=;
	b=kumzEqcEwDUm7zX31tkB/9gjwc0KQtA0vCslzJg+eApk4nGCHlM3h+dd+bPFBOLTM24Dqi
	+/qASPSwP8sKNQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92DF7133F9;
	Sat,  6 Sep 2025 17:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P0hbIsh1vGhuFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Sep 2025 17:56:24 +0000
Date: Sat, 06 Sep 2025 19:56:24 +0200
Message-ID: <87ikhvmpmf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phasta@kernel.org,
	linux-sound@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] ALSA: cs4281: Send the PCM period elapsed notification properly
In-Reply-To: <20250906162158.564899-1-chandramohan.explore@gmail.com>
References: <20250906162158.564899-1-chandramohan.explore@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C79201F399
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

On Sat, 06 Sep 2025 18:21:54 +0200,
Chandra Mohan Sundar wrote:
> 
> As part of spin lock code cleanup using guard(), a new
> variable (period_elapsed) was introduced. However this variable
> is never set, causing period elapsed notification to be not sent.
> 
> Set the value of period_elapsed appropiately.
> 
> This issue was reported by static coverity analyzer.
> 
> Fixes: 7a5127c2c8a5a ("ALSA: cs4281: Use guard() for spin locks")
> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>

Thanks, applied now.


Takashi
