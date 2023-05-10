Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA420C77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 08:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ABE5403BE;
	Wed, 10 May 2023 08:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ABE5403BE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BbnNMGSe;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=McdzanHv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrMls9T7hmKN; Wed, 10 May 2023 08:58:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 288B0400EA;
	Wed, 10 May 2023 08:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288B0400EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F17E7C0036;
	Wed, 10 May 2023 08:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42912C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 100F860B79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100F860B79
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BbnNMGSe; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=McdzanHv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ns7L4mxVMI6u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:58:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3250C60B3F
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3250C60B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:58:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA2BE1F74A;
 Wed, 10 May 2023 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683709117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+pKdoRXjFTokHx36S5rlRQ0bVRNe4462IaVe/BSSzeI=;
 b=BbnNMGSeZb1FrkH5JLEMqbX2SzAtDKpNxQuGfaSyM6zAL1a1rSPypm4IS3nMnVXxACYoxT
 OzkA3E7Wnu7gvxvk47MSZqFa60vj6346vY+ILX4lGHoeO3yyjPfeBV4TIpeEFSq8eMQg5Z
 TgchibqTPvK2CMICsRoX34SXB7krUPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683709117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+pKdoRXjFTokHx36S5rlRQ0bVRNe4462IaVe/BSSzeI=;
 b=McdzanHvyIte9tGDPaTHxyiczZ47nvJvleC66n8JqJvi2b+hoDU633dJDgswNdaNV31Xjh
 bdkP0jjXsOpRrYBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9414913519;
 Wed, 10 May 2023 08:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NR4sI71cW2RifQAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 10 May 2023 08:58:37 +0000
Date: Wed, 10 May 2023 10:58:36 +0200
Message-ID: <875y905zr7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
In-Reply-To: <ZFtT9J0DQI9uSd1x@ugly>
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
 <87a5yc626f.wl-tiwai@suse.de> <ZFtT9J0DQI9uSd1x@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: axboe@kernel.dk, alsa-devel@alsa-project.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, 42.hyeyoo@gmail.com, surenb@google.com,
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

On Wed, 10 May 2023 10:21:08 +0200,
Oswald Buddenhagen wrote:
> 
> On Wed, May 10, 2023 at 10:06:16AM +0200, Takashi Iwai wrote:
> > Also, if it's only about white space fix or some indent level issues,
> > that could be rather more noise and disturbs the git change history,
> > e.g. it makes difficult to find out the real code changes via git
> > blame, especially it touches a huge amount of lines like this.
> > 
> > That said, I'm not going to take such "coding style cleanup" patch
> > blindly.  If it's associated with other real fix or enhancement, I'll
> > happily take it.  Otherwise, I'd rather leave it.
> > 
> a maybe less confusing way to put it would be "do whitespace cleanups
> only on the lines that contain "real" changes, and maybe in their
> immediate proximity for consistency". that means that whitespace-only
> patches are by definition not acceptable.

Not only that, it's surely acceptable as a preliminary work for other
patches, for example, too.  Also, if the existing code is really ugly,
we can clean up, of course.

But majority of such whitespace fix patches have been just because
patchwork complains, and that's no right reason.


Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
