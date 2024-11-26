Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE281DFDBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732657984; cv=none; b=qDJmytYy0Rlc+0M8R3mRvbXire25h5wlQdG/FU0D7WVMlS94XIlgIEAUTiJoVfwd1tHJ/9pemOHS243GvCAPEY6sp+PNIxrJXZJoGIQ8gpUgREYWf33QR6dcNoFir4XfdixzDO6YN8ZQ16ZNigdRpTyjhiJ3Qc297mRqp/x5vcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732657984; c=relaxed/simple;
	bh=69DPGXRRD6vnJLCIbhUorKtysrQega8K0jloXx4xx5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sxtmqo0TrPrRvoQK9K6mb3P+XDtwDDgcg2a5UhfT3qIgNRhMz+TPnSz+wKKIcoTEMWpjaCa2Abklwykp2VVFu5l5f118b99FIG3M6ENj48itBXh/UM0mS1Qhvwxhdwz3nnxFqdO9D4iQvkglWdXG561YOyj6TZd5Zdt3ERfEKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XGh6OLvY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=H44sR6X+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XGh6OLvY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=H44sR6X+; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XGh6OLvY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="H44sR6X+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XGh6OLvY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="H44sR6X+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C51985432
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 21:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vah1aHuD-67q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2024 21:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85C7284C72
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=suse.cz
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C7284C72
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=XGh6OLvY;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H44sR6X+;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=XGh6OLvY;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H44sR6X+
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 85C7284C72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 21:53:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C1721F74C;
	Tue, 26 Nov 2024 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732657979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUwnW+riNOlPcoIf5dTIXLLyN6QLQwQ56rLHFvxfGJE=;
	b=XGh6OLvY83bNwtrgfeYifzBtlsll5XYGLZx9JGykkfnp+wTlxS17OJXqu15ES7MOY2J/kD
	n3pWaeKVkIe7Uao2B6QSsbUgFzJvnryulEBb3ubh87j39fIXpIwIbJQm6kAFUZtVq5aahk
	tjxpjtW/QJD1f92yfcQrL0MihSa1DD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732657979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUwnW+riNOlPcoIf5dTIXLLyN6QLQwQ56rLHFvxfGJE=;
	b=H44sR6X+PyFxEgWia7pkNehDcty+Nlx4zGjCW2MYXtlgKH8CR9Mp41/F70j9YTaFbAZLWF
	yJs/L2cYGwHrmSDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732657979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUwnW+riNOlPcoIf5dTIXLLyN6QLQwQ56rLHFvxfGJE=;
	b=XGh6OLvY83bNwtrgfeYifzBtlsll5XYGLZx9JGykkfnp+wTlxS17OJXqu15ES7MOY2J/kD
	n3pWaeKVkIe7Uao2B6QSsbUgFzJvnryulEBb3ubh87j39fIXpIwIbJQm6kAFUZtVq5aahk
	tjxpjtW/QJD1f92yfcQrL0MihSa1DD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732657979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUwnW+riNOlPcoIf5dTIXLLyN6QLQwQ56rLHFvxfGJE=;
	b=H44sR6X+PyFxEgWia7pkNehDcty+Nlx4zGjCW2MYXtlgKH8CR9Mp41/F70j9YTaFbAZLWF
	yJs/L2cYGwHrmSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C6E913890;
	Tue, 26 Nov 2024 21:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QfGLFjtDRmfbfwAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 26 Nov 2024 21:52:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 014AAA08CA; Tue, 26 Nov 2024 22:52:54 +0100 (CET)
Date: Tue, 26 Nov 2024 22:52:54 +0100
From: Jan Kara <jack@suse.cz>
To: Leo Stone <leocstone@gmail.com>
Cc: Jan Kara <jack@suse.cz>,
	syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com,
	brauner@kernel.org, quic_jjohnson@quicinc.com,
	viro@zeniv.linux.org.uk, sandeen@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, shuah@kernel.org,
	anupnewsmail@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hfs: Sanity check the root record
Message-ID: <20241126215254.aw7l7k3tgx2tawzu@quack3>
References: <67400d16.050a0220.363a1b.0132.GAE@google.com>
 <20241123194949.9243-1-leocstone@gmail.com>
 <20241126093313.2t7nu67e6cjvbe7b@quack3>
 <wzxs6mjqlpf2eszoaw2ozvocqg3lpaqx7mzog4tygxexugrbsu@3pxs2vthfagb>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wzxs6mjqlpf2eszoaw2ozvocqg3lpaqx7mzog4tygxexugrbsu@3pxs2vthfagb>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[2db3c7526ba68f4ea776];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,syzkaller.appspotmail.com,kernel.org,quicinc.com,zeniv.linux.org.uk,redhat.com,vger.kernel.org,googlegroups.com,gmail.com,lists.linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue 26-11-24 09:21:50, Leo Stone wrote:
> Hello,
> 
> On Tue, Nov 26, 2024 at 10:33:13AM +0100, Jan Kara wrote:
> > 
> > This certainly won't hurt but shouldn't we also add some stricter checks
> > for entry length so that we know we've loaded enough data to have full info
> > about the root dir?
> 
> Yes, that would be a good idea. Do we want to keep the existing checks
> and just make sure we have at least enough to initialize the struct:
> 
> if (fd.entrylength > sizeof(rec) || fd.entrylength < 0 ||
>     fd.entrylength < sizeof(rec.dir)) {
> 	res = -EIO;
> 	goto bail_hfs_find;
> }
> 
> Or be even stricter and only accept the exact length:
> 
> if (fd.entrylength != sizeof(rec.dir)) {
> 	res = -EIO;
> 	goto bail_hfs_find;
> }

Yes, this strict check would make sense to me. I just don't know HFS good
enough whether this is a safe assumption to make so it would be good to
test with some HFS filesystem.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
