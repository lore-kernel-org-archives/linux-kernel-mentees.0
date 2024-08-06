Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F7481A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722964832; cv=none; b=NPkBAaNAjC6BFLUEaJoqCwJFkmGhH6rnIr9V6pPVkWTBZrqxvsRjWAkbh+qldDCeEWmG5djsBG90WCf5iECRTBwr+wwh7Vhdjk2IvnzktlUElwuoztmWksaJR1Fig9SDUNQn1FRfvxHlmPvsnlTSFsfFd/dvWuuzJhwNQJhwFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722964832; c=relaxed/simple;
	bh=RF4+R4AYY88oE0qW9I2HnZL76wRUDyJ0GGKOQGzO1UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX+jYRvz6UbyG6OI1PA0d+0Y2RWcT9NxAr+TsG7ocZTWJMZAJw1v1Zma/jZ0GQJLE00LfEjrWd+PAu/uApvUQKdqxK6fRVpO/LLdngjuN1Wo48WKuj4xFCvsjg0kwECuYBc/ZQl7l3m0Ip7+vG+WZrR2E6Ug/l6PpWg65P4JKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ymn2bZiM; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ymn2bZiM"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B2854032B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8xNczImO86V for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Aug 2024 17:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F61B4011B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F61B4011B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ymn2bZiM
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5F61B4011B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:20:27 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc52394c92so9904435ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 06 Aug 2024 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722964827; x=1723569627; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKvy5s8I089cQ4Mv7A2bneNgkN9GheLOFUPEna3g4Is=;
        b=Ymn2bZiMKFj63yDtO85c/+gRsXysy5MbcGEwCqrCIhqTt4ZwuAk8jU1xD7YZBUpZQo
         3HhOsNz4Wpf5gR43M+jCybYw+R+6xlV6Ec/F+2nEC78lF9HoxCxXsmSRpN71o4CgcDLx
         dMZCHfq+/IzBOidQ0oBpakXxCpW6htn8282dOO0IEhyHk6ym2U9di8jFC1amtHFU+nuL
         d53t49Idg4zY48xeaBZTACqnnEyUbR2x2WlZ44N9vUer2WpRDaHS1TUXM1R5SD5eRshY
         /rbU5Rmm8eBBx5P6YtFetX2qFrbhvM+a37RS51Pzq27T1tdpc7G1SA5RcIfm77nPok2B
         tAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722964827; x=1723569627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKvy5s8I089cQ4Mv7A2bneNgkN9GheLOFUPEna3g4Is=;
        b=TFjQ6jPUF/6vMuWab6fZISdDxHJzU76X58o6GgB7gladRY6t9/dqFk9HBZHcsi8OeC
         4r0stS77mXjCtH3+ICSN8JeM6HKCgboB+QLxXQHdy+lnQ5XXX0wvfz9WB7+iDWf396fx
         2iApj059bljA7wrjn15UdkbGUogYqYml+WpSnNiAx4cXj62YYWhTSNRAGX6i6wL3qhgm
         23CqRuPiL4/9cM3brLISXLrxTI2ECvpEK3kr8yYb42pYczuWjKNraeQs7bFSQSAWdOmS
         RhL4jG1ZS9GJhkVf8hda0ad226g6iBzwSBPtHIPkwX5HQ3ANO41MJ0Y5Spcancp2Kvqd
         W5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSDYau4QioE8miSCRx2Z8Ov3nKnGAOuD02DWjXOVg0lRpwh2v5X8lzeOMuxUVhMrVLOGyecm8YsJOKu4wIOfR9EEQhVcOS2C42jM3eGYD51GlwR9E3NOaNQLwAMITs
X-Gm-Message-State: AOJu0YxgOSvtu801k1SqXsszEb0EGTM4u1bj1gFwrTCElCscsz/D5fjM
	FYEXxSj9Dxe26h7JbyeFA2iqQoLgHq8z3Sv/pdk1Bp7FgUyN0BwZ
X-Google-Smtp-Source: AGHT+IFsPaIm8ghmwUQ3CRGHxVOj1l+zaHds6DmBqTosUveeJiqHqLH9hMwgMdARJUDCiXVDp2vbBg==
X-Received: by 2002:a17:902:fb0b:b0:1fd:a1e9:29bb with SMTP id d9443c01a7336-1ff572ed65cmr146259685ad.38.1722964826755;
        Tue, 06 Aug 2024 10:20:26 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([122.169.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5905c86esm90069295ad.168.2024.08.06.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:20:26 -0700 (PDT)
Date: Tue, 6 Aug 2024 22:48:32 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, oswald.buddenhagen@gmx.de, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Fix coding style issues and warnings
Message-ID: <ZrJa6IahC6Edlitb@embed-PC.myguest.virtualbox.org>
References: <20240805155206.463035-1-abhishektamboli9@gmail.com>
 <87cyml8vj6.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyml8vj6.wl-tiwai@suse.de>

On Tue, Aug 06, 2024 at 06:29:17PM +0200, Takashi Iwai wrote:
> On Mon, 05 Aug 2024 17:52:06 +0200,
> Abhishek Tamboli wrote:
> > 
> > Fix coding style errors and warnings in sound/pci/emu10k1/memory.c
> > reported by checkpatch.pl. Changes includes:
> > 
> > - Add spaces after commas in macro definitions.
> > - Insert blank lines after variable declarations.
> > - Consistent spacing around operators.
> > - Remove trailing whitespace.
> > - Move EXPORT_SYMBOL declarations to immediately follow their
> >   respective functions.
> > - Correct spacing in conditional statements and type casts.
> > 
> > Fix the following errors and warnings:
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define __set_ptb_entry(emu,page,addr) \
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define __set_ptb_entry(emu,page,addr) \
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_ptb_entry(emu,page,addr)	__set_ptb_entry(emu,page,addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_silent_ptb(emu,page)
> > 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_silent_ptb(emu,page)
> > 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define set_silent_ptb(emu,page)
> > 	__set_ptb_entry(emu,page,emu->silent_page.addr)
> > 
> > WARNING: Missing a blank line after declarations
> > +	int i;
> > +	page *= UNIT_PAGES;
> > 
> > WARNING: Missing a blank line after declarations
> > +	int i;
> > +	page *= UNIT_PAGES;
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > +#define get_emu10k1_memblk(l,member)
> > 	list_entry(l, struct snd_emu10k1_memblk, member)
> > 
> > WARNING: space prohibited between function name and open parenthesis '('
> > +	list_for_each (pos, &emu->mapped_link_head) {
> > 
> > WARNING: Missing a blank line after declarations
> > +	struct snd_emu10k1_memblk *blk =
> > 		get_emu10k1_memblk(pos, mapped_link);
> > +	if (blk->mapped_page < 0)
> > 
> > ERROR: else should follow close brace '}'
> > +		}
> > +		else if (size > max_size) {
> > 
> > ERROR: need consistent spacing around '-' (ctx:WxV)
> > +	psize = get_aligned_page(size + PAGE_SIZE -1);
> >  	                                          ^
> > 
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > +EXPORT_SYMBOL(snd_emu10k1_memblk_map);
> > 
> > WARNING: Missing a blank line after declarations
> > +		dma_addr_t addr;
> > +		if (ofs >= runtime->dma_bytes)
> > 
> > ERROR: space prohibited after that '!' (ctx:BxW)
> > +		if (! is_valid_page(emu, addr)) {
> >  		    ^
> > 
> > ERROR: trailing whitespace
> > +^Istruct snd_util_memhdr *hdr = hw->memhdr; $
> > 
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > +EXPORT_SYMBOL(snd_emu10k1_synth_alloc);
> > 
> > ERROR: trailing whitespace
> > +^Istruct snd_util_memhdr *hdr = emu->memhdr; $
> > 
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > +EXPORT_SYMBOL(snd_emu10k1_synth_free);
> > 
> > WARNING: Missing a blank line after declarations
> > +	int first_page, last_page;
> > +	first_page = blk->first_page;
> > 
> > WARNING: Missing a blank line after declarations
> > +	char *ptr;
> > +	if (snd_BUG_ON(page < 0 || page >= emu->max_cache_pages))
> > 
> > ERROR: space prohibited after that '!' (ctx:BxW)
> > +	if (! ptr) {
> >  	    ^
> > 
> > ERROR: "(foo*)" should be "(foo *)"
> > +	return (void*)ptr;
> > 
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > +EXPORT_SYMBOL(snd_emu10k1_synth_memset);
> > 
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > +EXPORT_SYMBOL(snd_emu10k1_synth_copy_from_user);
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> 
> Thanks for the patch.  But in general, I take this kind of
> white-space-only patches as a preliminary only when coupled with some
> other real fixes or improvement changes -- especially for old driver
> code.  Otherwise it'd just scratch the git history.
> 
> So, if you have other actual fixes for this driver based on this clean
> up, let me know.

Hi Takashi,

Thank you for the feedback. I understand your point regarding
white-space-only patches and I'll keep this in mind for future
contributions. Unfortunately, I don't have any additional
fixes or improvements for this driver at the moment. 

Regards,
Abhishek
