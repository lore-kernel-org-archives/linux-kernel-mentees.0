Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75440374C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352720; cv=none; b=MvB2oFjDhoyffC2hUNJP1NTgVHEzT9wLLckX/KVKTUQJAl8smJpXZ5xY0ou7AcZymfDRqPS/uWhjSUibYwgaEBRvqtTBIk9N6sNpbUG/n6pgeUEWNMyVYistD4VVd01UfCyH1dssfO690GE5imfyggBNvP0Zoc3sC2l1+bXeK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352720; c=relaxed/simple;
	bh=9/YVrENp5xo6smDoABPBOIy/2FWLNBFj5gykPLh6BAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgR1JDQO+iIQ7+u/cJDDGIRzVYaCe2prRHmUD33nZf0UjKjGh4+InZADCBi+PtMGz4Hi71oDX8HsWn/rVf1e0KWyF7p3ZErvZnV0r14XMGYjlbzCljuHenfTt97IYPlCXNKsmdFutEkxf8/+REQFWZ2HGV3Ec8tuLndPUKXgUv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=omZdShmf; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=omZdShmf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="omZdShmf";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="omZdShmf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06862605C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 14:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN4_UVazWzmk
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 19 Feb 2024 14:25:18 +0000 (UTC)
X-Greylist: delayed 545 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 19 Feb 2024 14:25:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4192605AD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4192605AD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=omZdShmf;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=omZdShmf
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=mpdesouza@suse.com; receiver=<UNKNOWN> 
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E4192605AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 14:25:17 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3A66B1F800;
	Mon, 19 Feb 2024 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708352170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGi2qxr4MOWI0h/oxoHKd3Sk73dK3PGq7ebzjeQ1VJk=;
	b=omZdShmfA+3Rc+7JR/eARuSL3Qn6Se6zyJIvOgveHB8j+Dt5Qbgw+MaYSAROjzCe9Zekwy
	5jxK6ORrFOPk6CihITapc4gUKHY2re4OijPGDnqb3zghEJqbjvf8qfXrGKn78qD9SB5U26
	WzXs0UQeNK0Qtbbg5/xAP05Q476XqLI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708352170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGi2qxr4MOWI0h/oxoHKd3Sk73dK3PGq7ebzjeQ1VJk=;
	b=omZdShmfA+3Rc+7JR/eARuSL3Qn6Se6zyJIvOgveHB8j+Dt5Qbgw+MaYSAROjzCe9Zekwy
	5jxK6ORrFOPk6CihITapc4gUKHY2re4OijPGDnqb3zghEJqbjvf8qfXrGKn78qD9SB5U26
	WzXs0UQeNK0Qtbbg5/xAP05Q476XqLI=
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DAA613585;
	Mon, 19 Feb 2024 14:16:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 1hEUEali02X9EAAAn2gu4w
	(envelope-from <mpdesouza@suse.com>); Mon, 19 Feb 2024 14:16:09 +0000
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
Date: Mon, 19 Feb 2024 11:16:03 -0300
Message-ID: <20240219141606.6711-1-mpdesouza@suse.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240216225126.454999-1-shresthprasad7@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=omZdShmf
X-Spamd-Result: default: False [4.66 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.03)[56.20%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3A66B1F800
X-Spamd-Bar: ++++

On Sat, 17 Feb 2024 04:21:26 +0530 Shresth Prasad <shresthprasad7@gmail.com> wrote:

>     The function `klp_get_state` returns an `int` value, but the variable
>     `loglevel_state` is of type `struct klp_state *` and thus does an
>     implicit cast. Explicitly casting these values fixes:
> 
>             - warning: assignment to \u2018struct klp_state *\u2019 from \u2018int\u2019
> 	    makes pointer from integer without a cast [-Wint-conversion]
> 
>     on lines 38, 55, 68 and 80 of test_klp_state.c

I was unable to find where you saw the klp_get_state returning int. I tried
searching at the current master of live-patching repo[1], on linux-next. Can
you point where do you saw it? For me, klp_get_state return a pointer to klp_state.

Thanks,
  Marcos

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/tree/kernel/livepatch/state.c

> 
> Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> ---
>  .../selftests/livepatch/test_modules/test_klp_state.c     | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> index 57a4253acb01..ae6b1ca15fc0 100644
> --- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> @@ -35,7 +35,7 @@ static int allocate_loglevel_state(void)
>  {
>  	struct klp_state *loglevel_state;
>  
> -	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
> +	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>  	if (!loglevel_state)
>  		return -EINVAL;
>  
> @@ -52,7 +52,7 @@ static void fix_console_loglevel(void)
>  {
>  	struct klp_state *loglevel_state;
>  
> -	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
> +	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>  	if (!loglevel_state)
>  		return;
>  
> @@ -65,7 +65,7 @@ static void restore_console_loglevel(void)
>  {
>  	struct klp_state *loglevel_state;
>  
> -	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
> +	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>  	if (!loglevel_state)
>  		return;
>  
> @@ -77,7 +77,7 @@ static void free_loglevel_state(void)
>  {
>  	struct klp_state *loglevel_state;
>  
> -	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
> +	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>  	if (!loglevel_state)
>  		return;
>  
> -- 
> 2.43.1
