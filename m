Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508FC40DB55
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494057; cv=none; b=P+KpBi3MOBI5B8Cd4WZi2/+112UNG5VivKs/Xn1cyVQqPqETLjE/gxmFLnviBoqx5jmnqQyPcAg9eBtfEsEZ/m7AX4MkpNqmEff2jBeM93Hm3oepq6oofyXJiTx1t78Gjv/BobR1GGdy+w85hZGO1mSI6Rr6pyzgXNicP9Pto24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494057; c=relaxed/simple;
	bh=QticbmrmsFCaqjWIRclND69z67UKpjqzMN0T2H6H7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEh21QfPsrZ6/AgLJqPoBZthriB39GL2H59NY4F38x6fukg+YO9TlPwTJzAXwqrgjENLgGwFsSvkOsV0a4LBORQ5MzEFzyTJS+pEXE5Bgo8mxQgLkPPDbfBvRoRCSpbwlPf/4OR/0Vplo2zVhVHwEkV6b5jC6GrqwPB9OXqRxmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YFZRFGWx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rPtVPnd1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rBFk2l+W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jZeW2oam; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YFZRFGWx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPtVPnd1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rBFk2l+W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jZeW2oam"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B483C7DECD;
	Fri, 31 Jul 2026 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785494034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZC7k+oGAkj/JK2smcgUp2lutIw7bxKHZY4CcCNLvaU=;
	b=YFZRFGWxWYTgW2zS+13Onzluo+QWNpBltz3MZGF+gk7CwU0HV1wYC46b24brNfKAKMYMIp
	PDaKsQl0GBCWMaTKLFx5G6pyqIUBwSvDwPbOwmUePCuAhzxFztRx+DG/iB4eMX83KyzLlW
	UUsLRKrPsPEm0ZBXsbLtnNtY2yiccl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785494034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZC7k+oGAkj/JK2smcgUp2lutIw7bxKHZY4CcCNLvaU=;
	b=rPtVPnd1JhnbXcHoaNs5ASzYbVkmSeU8P78F2CuJmCbGnWhVpdUBYyFpN5C5ssg2jwbDzp
	FOVEwWu/y094wuCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rBFk2l+W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jZeW2oam
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785494030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZC7k+oGAkj/JK2smcgUp2lutIw7bxKHZY4CcCNLvaU=;
	b=rBFk2l+Wj9o6Tx01eTcc0u1m/cobHu8HXJDaAznY4nfgnybOHcGr9ffSXEHEDl/6EIXvfD
	NbfltnA4lPy6PGwTzBlYWnB+LWXHDscT67jzX/JIPtemagONURWN8bgC9mT/n0iroTtQFc
	YuNB3OxaxxgFB1rDs1a/Smwh/kdkt/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785494030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZC7k+oGAkj/JK2smcgUp2lutIw7bxKHZY4CcCNLvaU=;
	b=jZeW2oam2wT8lmDRHuZozokpmGRbwOyhlHWXEglN+jsI8ULA2sQsBQdeo0R+I+wpMihADB
	jZgwwHqSyghHA/Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85F93779C6;
	Fri, 31 Jul 2026 10:33:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hjYoHQ16bGoRFgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 31 Jul 2026 10:33:49 +0000
Date: Fri, 31 Jul 2026 11:33:47 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Jakov Novak <jakovnovak30@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "\\  Liam R . Howlett \\ " <liam@infradead.org>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3] mm/khugepaged: replace mutex_lock/mutex_unlock usage
 with guard macro
Message-ID: <amx5XdMQ7S_krjNA@pedro-suse>
References: <20260730204724.16912-1-jakovnovak30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730204724.16912-1-jakovnovak30@gmail.com>
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,arm.com:email,linux-foundation.org:email]
X-Spam-Flag: NO
X-Spam-Score: -5.01
X-Spam-Level: 
X-Rspamd-Queue-Id: B483C7DECD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Thu, Jul 30, 2026 at 10:47:24PM +0200, Jakov Novak wrote:
> Currently, khugepaged locks the khugepaged_mutex in two functions:
> start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
> mutex_lock/mutex_unlock usage in these functions and replace it with the
> guard macro. This makes the code more readable (removing a goto statement)
> and makes it harder to introduce bugs in the future.
> No functional changes introduced.
> 
> Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>

Hmm, did Andrew actually give this R-b tag out? I can't find it on-list. 

-- 
Pedro
