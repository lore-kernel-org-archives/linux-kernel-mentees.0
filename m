Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90791E4AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755843998; cv=none; b=t+ZazwdPIPzD3NhsaB1vVNfq1oiJXNVVzJD6/esDsOwv5v5wWLnevcfKowd6PcPyJePRfWh2zlbXoXc6pb7nble1fvZuWyM0/H4MD56KJGZ0Of+AJGNa+diQNikoWjaD2HGTae2d12CMvazNL326UuBC10YmsDvbKub2ewcx1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755843998; c=relaxed/simple;
	bh=oRDP0YB3OQl6oeFNLyUe94ReJ4n6giFLUwfWL61Z5Sw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFOe9eUIWadAtU2QCw4PIw4Srnm9hJ2KFg4MMGZNSMqzop9OnoXiGJVhIjS0wmiwsG2xkLRrtnof6vJt4AP9DrZRJTEyKCSabzuwJQQhbDGFGdt9SDAMIcQqxBZEvSm+hG8pbGXWKf2IfOHKKQ/TwoBhHgDXpSQxPaX7wQztFqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=veqYoiyQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1qfcXQSw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QIRj/Hid; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NQGCrAMZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="veqYoiyQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1qfcXQSw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QIRj/Hid";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NQGCrAMZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74105608BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 06:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul9Y9LzdkT2G for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Aug 2025 06:26:36 +0000 (UTC)
X-Greylist: delayed 321 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 22 Aug 2025 06:26:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2363608BE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=suse.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2363608BE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=veqYoiyQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1qfcXQSw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QIRj/Hid;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NQGCrAMZ
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=<UNKNOWN> 
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C2363608BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 06:26:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC1AB1F460;
	Fri, 22 Aug 2025 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755843669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41INJ0v8EWhcsBrvx4Frea3INbUx7hn68vuS+MWYl68=;
	b=veqYoiyQ78qZbymoYIqE8heurRWbhI7HnLQIL9+VUYLRXr3GZ6k2JKr/HQzFM2XyRGs1zW
	6jKfJnA76Ezvz7ZIK4IynNVwUNbvOungAVfZfMT2b+34MY/vsrRuvL0KUXdId2tXxfChr2
	Wr88oP/sLHQxV/vhaW2krL59HhV2/lY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755843669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41INJ0v8EWhcsBrvx4Frea3INbUx7hn68vuS+MWYl68=;
	b=1qfcXQSwb+Nl4Q5EpX4UKop2NqEHgwzp1dXOB375D2MeoJdyM9XP3MgOB1yRUbxyFqVe7N
	6AmYyDcDdH6ombBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755843667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41INJ0v8EWhcsBrvx4Frea3INbUx7hn68vuS+MWYl68=;
	b=QIRj/HidRGFboht6lxuyENjtGIIRT9lbqrvTi/2iru/0WbFZZmzUAOTvXEShiDpI2kmC0w
	w+VDCh++Nv5NeqKv6NDymcgCrQx9UgLViJm7+KffGjHxOZ8Oij6TDgW1FIClWm/2igvyvQ
	nl9tYKJB4+VbIGgGGyMthD5TiwCYLew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755843667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41INJ0v8EWhcsBrvx4Frea3INbUx7hn68vuS+MWYl68=;
	b=NQGCrAMZiQdEvWJWZ1SYAEOvoL4dWJPlmDzUo5kG/v9U5MZc6kQ4dQEXlZtxNcAXM62aMW
	4rmbjujyJ2NdR6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BCAD13931;
	Fri, 22 Aug 2025 06:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id twUhGVMMqGgkdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Aug 2025 06:21:07 +0000
Date: Fri, 22 Aug 2025 08:21:07 +0200
Message-ID: <87349j6fn0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
In-Reply-To: <20250821200132.1218850-1-zlatistiv@gmail.com>
References: <20250821200132.1218850-1-zlatistiv@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 21 Aug 2025 22:01:32 +0200,
Nikola Z. Ivanov wrote:
> 
> Remove 0/NULL global variable assignment in mixer-test.c and pcm-test.c
> 
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Applied now.  Thanks.


Takashi
