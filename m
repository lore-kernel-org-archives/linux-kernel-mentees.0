Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E036C7EE22
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 May 2023 06:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA5F941C24;
	Wed,  3 May 2023 06:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5F941C24
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bgNahnK0;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fogcCL2i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4WD3nJClu0R; Wed,  3 May 2023 06:06:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 62E5C41AFD;
	Wed,  3 May 2023 06:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E5C41AFD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 395FDC0036;
	Wed,  3 May 2023 06:06:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1778C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 May 2023 06:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 880FF60AC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 May 2023 06:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 880FF60AC0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bgNahnK0; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fogcCL2i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miFAaaqvjQKP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 May 2023 06:06:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D80560A81
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D80560A81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 May 2023 06:06:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 198E81FFD8;
 Wed,  3 May 2023 06:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683094012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJyauCRKA1OKuD2J2BLjbo+7WdRbLAPXODKeyqBieVA=;
 b=bgNahnK0jIVhMQdwFI6wxSrA5z8mhlcU207HYujRgIwZ/+ar1qIoI8UvxTuEosCA81sM7D
 Se2gi2Aoc7w9u/DS5aCq6YAhw1GRaRsG+q8v+c3BgYyJ7B5PcgjFI03H+3m+mxokRgmK5I
 Q95bU+4Kf4ZkGpRvCJ40Xm8rjY1geh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683094012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJyauCRKA1OKuD2J2BLjbo+7WdRbLAPXODKeyqBieVA=;
 b=fogcCL2iwIwnpNvbJwTouByyjpBdGNss0x0Jr1gUDCt833IsJdqiRIS7P19jTUTaV0V8Yr
 lhQXN8IGLQ3P6lBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6DEC13584;
 Wed,  3 May 2023 06:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NyWKM/v5UWTiJQAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 03 May 2023 06:06:51 +0000
Date: Wed, 03 May 2023 08:06:51 +0200
Message-ID: <87ildane2s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] ALSA: docs: Extend module parameters description
In-Reply-To: <20230501101634.476297-1-ivan.orlov0322@gmail.com>
References: <20230501101634.476297-1-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: alsa-devel@alsa-project.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
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

On Mon, 01 May 2023 12:16:34 +0200,
Ivan Orlov wrote:
> 
> Common ALSA module parameters look a little bit confusing because of the
> description lacking, and it took me a while to understand the purpose of
> their existence. To figure it out I asked the question about them to the
> "alsa-devel" mailing list, and Takashi Iwai answered me with the text I
> appended to the ALSA documentation in this patch.
> 
> These common module parameters aren't used a lot nowadays, but as I
> understand they are important for providing compatibility with some
> existing user-space apps. So in my opinion it is a good idea to document
> why we need them.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Thanks, applied.


Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
