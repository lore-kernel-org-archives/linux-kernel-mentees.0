Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0ACC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 08:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40D9642999;
	Wed, 10 May 2023 08:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40D9642999
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IwQ7Q0EQ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GMKQzn4m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCWNT7YVaABY; Wed, 10 May 2023 08:06:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1A1DA4011C;
	Wed, 10 May 2023 08:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1DA4011C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBA00C0037;
	Wed, 10 May 2023 08:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FEE1C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C5660FAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C5660FAE
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IwQ7Q0EQ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GMKQzn4m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnwgX2s_sfJT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D2B060F89
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D2B060F89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:06:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DB6D21ADC;
 Wed, 10 May 2023 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683705978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIn9dMlGX57qADgU5sVGhgMAmniYi84QyI4AhbTr4fo=;
 b=IwQ7Q0EQNrhrqdcBDRee3SUA+hYmy3U2txJFNueaQuzeQ/4sRA2e9vmX/Ab5RSZucCkHFn
 jFox3PUjR8zsrX65Zhj/xV3bnESrrg+2wdngbIJNRCXyKLbm98+E2kFOQOYNqSkKq398L7
 gxmj9bBEo5/j/wXPuCXe3LrTHC3mP5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683705978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIn9dMlGX57qADgU5sVGhgMAmniYi84QyI4AhbTr4fo=;
 b=GMKQzn4mT0Uj6ACH2YHTPFBRpwTBHx+Lmq0c5l50VooP8S5BLQgQvLmV0RAvSk0TjwHr66
 uBsuoWRycUAEhSDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6744313519;
 Wed, 10 May 2023 08:06:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K/pCGHlQW2SjXQAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 10 May 2023 08:06:17 +0000
Date: Wed, 10 May 2023 10:06:16 +0200
Message-ID: <87a5yc626f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
In-Reply-To: <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: axboe@kernel.dk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, 42.hyeyoo@gmail.com, oswald.buddenhagen@gmx.de,
 surenb@google.com, linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 10 May 2023 09:55:18 +0200,
Ivan Orlov wrote:
> 
> On 5/10/23 11:48, Greg KH wrote:
> > - Your patch did many different things all at once, making it difficult
> >    to review.  All Linux kernel patches need to only do one thing at a
> >    time.  If you need to do multiple things (such as clean up all coding
> >    style issues in a file/driver), do it in a sequence of patches, each
> >    one doing only one thing.  This will make it easier to review the
> >    patches to ensure that they are correct, and to help alleviate any
> >    merge issues that larger patches can cause.
> > 
> > If you wish to discuss this problem further, or you have questions about
> > how to resolve this issue, please feel free to respond to this email and
> > Greg will reply once he has dug out from the pending patches received
> > from other developers.
> > 
> > thanks,
> > 
> > greg k-h's patch email bot
> 
> Greg's Bot is right, it will be better as a sequence of patches. Sorry
> for bothering!

Also, if it's only about white space fix or some indent level issues,
that could be rather more noise and disturbs the git change history,
e.g. it makes difficult to find out the real code changes via git
blame, especially it touches a huge amount of lines like this.

That said, I'm not going to take such "coding style cleanup" patch
blindly.  If it's associated with other real fix or enhancement, I'll
happily take it.  Otherwise, I'd rather leave it.


thanks,

Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
