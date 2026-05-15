Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A263630A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826817; cv=none; b=ISuUK5VYYz6mIkfwpQOhX34aqz5wGpBdw8++maYKOS08FrNmwQoYjf0HOFL4twqdsNM79TXkyMygZfSqhSmak2NgGmYt4Uj0dewfVWPpGoS1o7hN8/of8VTik73o3KN3Z65Df/aOtD2ScdYfyabivphd0EOEZ2TOKq9XKhJxrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826817; c=relaxed/simple;
	bh=JOM4t1LJFrduQ1d+oo8VMt5nVxgzSutVaS0l6t/XJpc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nci92mYYNRATg3YFoRti/aoMVLvK6GG44bH+a2anl7HYx8Pd7wMQYx1j5PHGAV+2LWCimN6x0X3RkEIfGFNWlCIrFs9VPBMeDTsE1WBY+vV94FmnOM+85DXWVs5VPjbmu3f2f6yCM0Hk5LiXsP3ccKgTg4NU5qCb05gwoQBykBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VQDgu64w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iAc1iR7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VQDgu64w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iAc1iR7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VQDgu64w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iAc1iR7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VQDgu64w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iAc1iR7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC4C40BE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 06:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.091
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8Rhf3WYrt4p for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2026 06:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BACF140064
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=suse.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BACF140064
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VQDgu64w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7iAc1iR7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VQDgu64w;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7iAc1iR7
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BACF140064
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 06:33:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 960216A962;
	Fri, 15 May 2026 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=VQDgu64w8pCEjsaVL2cV3hzc9VTF8SweTwHDt6UK+Z8BQM1E57X+ikgQTDh+MbAbnwmgKi
	kIh9RqV2iIXzMyBk9hU/3ph5E0jpGBG4hf6jng71IeDgjc6O1GGZ+cYUIbvuxGZOevSfz2
	SCm0FBQcaQjZQgbLC/L1sarF2ng+JzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=7iAc1iR7NRAMvhKf4canaecm+YbTIXcSbZTIobmTSxuWsgwoxzTXO87+o2O2erzoo87U43
	49gF1rX3ZC8KitBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=VQDgu64w8pCEjsaVL2cV3hzc9VTF8SweTwHDt6UK+Z8BQM1E57X+ikgQTDh+MbAbnwmgKi
	kIh9RqV2iIXzMyBk9hU/3ph5E0jpGBG4hf6jng71IeDgjc6O1GGZ+cYUIbvuxGZOevSfz2
	SCm0FBQcaQjZQgbLC/L1sarF2ng+JzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=7iAc1iR7NRAMvhKf4canaecm+YbTIXcSbZTIobmTSxuWsgwoxzTXO87+o2O2erzoo87U43
	49gF1rX3ZC8KitBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 513E9593A9;
	Fri, 15 May 2026 06:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6NgVEji+BmqIPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:33:28 +0000
Date: Fri, 15 May 2026 08:33:27 +0200
Message-ID: <87o6ihuqq0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: Re: [PATCH RFT] ALSA: scarlett2: Add missing error check when initialise Autogain Status
In-Reply-To: <20260508033914.111596-1-robertusdchris@gmail.com>
References: <20260508033914.111596-1-robertusdchris@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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

On Fri, 08 May 2026 05:39:14 +0200,
Robertus Diawan Chris wrote:
> 
> When initialise new control with scarlett2_add_new_ctl() function for
> Autogain Status, scarlett2_add_new_ctl() might throw an error. So, add
> error check after initialise new control for Autogain Status.
> 
> This is reported by Coverity Scan with CID 1598781 as UNUSED_VALUE.
> 
> Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>

Applied now.  Thanks.


Takashi
