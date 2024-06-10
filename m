Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430D200C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718006429; cv=none; b=ajAwXLEC+LWMoosJdIS2rX/cTH6NihMnRVYyXfIFm50huiQqiSf35SGuL4W+CJg5bX+obi1UAT32nkKrPGiipPLqp5XKAv5A4811PNR2Z2RPlUmOxnO1hm4qlUylFQPGMOe+vWBHnxsomIYEvTmICBY2agHLPTgpWXdVBpwV/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718006429; c=relaxed/simple;
	bh=8wxMSYoRONwrF9RsGHTh53kHDh3LzFcEbYhcNxkNjwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7wsySNKSAKKa8lL4+c9OYhmdyZ8X6wLW/DOP12JJ4Aj8YvkYQnGBKxevJP+aXP0Kmycnm8s+joBfBDuuRy0HOtDKqi54G/NbcAcwxw3iFVTmVdNJpU21j6nwJR9xMrV8t7uI8gXGrdALFR/yHn9v3bEEXhh1K3OkuuBdUtn1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BC+ZXPTL; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BC+ZXPTL"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8BF082153
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 08:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNtZbVY9MajV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jun 2024 08:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C42F881BA8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C42F881BA8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BC+ZXPTL
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C42F881BA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Jun 2024 08:00:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 944D6CE10C9;
	Mon, 10 Jun 2024 08:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83604C2BBFC;
	Mon, 10 Jun 2024 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718006421;
	bh=8wxMSYoRONwrF9RsGHTh53kHDh3LzFcEbYhcNxkNjwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BC+ZXPTL+jwX4mfe92NOxrgQvbL+EdnWkjljsQog0TJyWKhZXb9lai3UkJ/Q2nPHO
	 xmE+466/LRVFUHawik9RphG7uFt8WhUP9R3Q75m81o+TBs9VIPedcJRs90CdpahcNL
	 uVksCmlxY7jOlnlo4KtrmN62Y2ioB+rSUDMeB/8c=
Date: Mon, 10 Jun 2024 10:00:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Evgeniy Dushistov <dushistov@mail.ru>,
	Shuah Khan <skhan@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fs/ufs: Use LUT for dir entry types
Message-ID: <2024061008-granddad-aspirin-4208@gregkh>
References: <20240610034219.14711-1-luis.hernandez093@gmail.com>
 <0485dd2d-488a-40e9-b0f7-24236b9c00ab@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0485dd2d-488a-40e9-b0f7-24236b9c00ab@web.de>

On Mon, Jun 10, 2024 at 09:48:09AM +0200, Markus Elfring wrote:
> > As per the original TODO, replacing the switch statement with a lookup
> > table results in more concise mapping logic and improved performance.
> …
> 
> Can imperative wordings be relevant for another improved change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc2#n94
> 
> 
> …
> > +++ b/fs/ufs/util.h
> …
> >  static inline void
> >  ufs_set_de_type(struct super_block *sb, struct ufs_dir_entry *de, int mode)
> …
> > +	if (mode_index < ARRAY_SIZE(ufs_mode_to_dt))
> > +		de->d_u.d_44.d_type = ufs_mode_to_dt[mode_index];
> > +	else
> >  		de->d_u.d_44.d_type = DT_UNKNOWN;
> …
> 
> May a conditional operator expression be applied at this source code place?
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
