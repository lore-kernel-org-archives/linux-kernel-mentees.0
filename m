Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD3BCD4F32
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Sep 2023 08:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F7E83EA3;
	Fri, 22 Sep 2023 08:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F7E83EA3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1djs0c5X;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ZxSuylr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RillepMfKQ6k; Fri, 22 Sep 2023 08:51:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6EB1583CC2;
	Fri, 22 Sep 2023 08:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB1583CC2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44636C0071;
	Fri, 22 Sep 2023 08:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EAB0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 08:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 556CD414D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 08:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556CD414D8
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1djs0c5X; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9ZxSuylr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A61j_Q1c7b1f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 08:51:55 +0000 (UTC)
X-Greylist: delayed 327 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Sep 2023 08:51:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01C1640407
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01C1640407
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 08:51:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BF53210E3;
 Fri, 22 Sep 2023 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695372387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ON/OW1Xy96pmmIh9iQH0EYnMmcRVxL2Vh0r7llzp9N4=;
 b=1djs0c5XNN+vmZspCLNGUT4Flc/lK4+Vcj60TEytUP+26IU/edjfv0m3nGGWvxhV31lHTQ
 f8kfFi1EJjtY1Zt/ribacgZ1BMpLJgiTbxo5GpP0oxBUPhk/rCSJ54jnVKW3urNIy++YWH
 VGesuWuB14dX+Sb9+AnijF9zlQVIqQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695372387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ON/OW1Xy96pmmIh9iQH0EYnMmcRVxL2Vh0r7llzp9N4=;
 b=9ZxSuylrfh+nRjf+zrKiG/vQL25yb1BlSV1PqJ25EfnnsQwJXJ1ryZwSyMrJSHmdIw2B1A
 BxwDfhVM1C8ZdECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC09713597;
 Fri, 22 Sep 2023 08:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KQeyOGJUDWVjRgAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 08:46:26 +0000
Date: Fri, 22 Sep 2023 10:46:26 +0200
Message-ID: <87h6nmegt9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH] sound: usb: increase snd_card alloc size
In-Reply-To: <20230922005152.163640-1-ricardo@marliere.net>
References: <20230922005152.163640-1-ricardo@marliere.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com,
 Takashi Iwai <tiwai@suse.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, 22 Sep 2023 02:51:53 +0200,
Ricardo B. Marliere wrote:
> 
> Syzbot reports a slab-out-of-bounds read of a snd_card object. When
> snd_usb_audio_create calls snd_card_new, it passes sizeof(*chip) as the
> extra_size argument, which is not enough in this case.
> 
> Relevant logs below:
> 
> BUG: KASAN: slab-out-of-bounds in imon_probe+0x2983/0x3910
> Read of size 1 at addr ffff8880436a2c71 by task kworker/1:2/777
> (...)
> The buggy address belongs to the object at ffff8880436a2000
>  which belongs to the cache kmalloc-4k of size 4096
> The buggy address is located 1 bytes to the right of
>  allocated 3184-byte region [ffff8880436a2000, ffff8880436a2c70)
> 
> Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.co/m
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  sound/usb/card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 1b2edc0fd2e9..6578326d33e8 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -619,7 +619,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
>  	}
>  
>  	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
> -			   sizeof(*chip), &card);
> +			   sizeof(*chip) + 2, &card);

Sorry, it's no-no.  We have to fix the cause of the OOB access instead
of papering over with a random number of increase.

Unfortunately, most important piece of information is trimmed in the
changelog, so I can't judge what's going on.  The only useful info
there is that it's something to do with imon driver, but it's
completely independent from USB-audio.  How does it access to the
external memory allocated by snd-usb-audio driver at all?

Before jumping to the solution, we must understand the problem.


thanks,

Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
