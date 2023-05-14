Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A51AC77B7F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 May 2023 09:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5EED41CF7;
	Sun, 14 May 2023 09:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5EED41CF7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QpgO/QJZ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ernnJwYM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2VroZaPYzBH; Sun, 14 May 2023 09:21:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 31CC641CE0;
	Sun, 14 May 2023 09:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CC641CE0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B30AC0037;
	Sun, 14 May 2023 09:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 814EDC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48D6F4287A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48D6F4287A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=QpgO/QJZ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ernnJwYM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUeQiF9QyZP3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A43742879
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A43742879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:21:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED0AD22043;
 Sun, 14 May 2023 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684056070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrSVGuN+ZkxpGnBq9VKUcBsPewYH/G3H0ud++SHyqbo=;
 b=QpgO/QJZg2n4S4sEymYKQ+VxgADrvGa1ctJTJRfJsTZIX3dMxhRsFq0NkVATQFCZXJh3Sb
 AMdI32XW2aMiLRODBHYAhrIqiL15afWYwy6uj/eH/kfF0/fNdsEiAvAeyawDkO7YOn/swW
 7r2bCaase5KBE8U76mljZZGO/r5MWwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684056070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrSVGuN+ZkxpGnBq9VKUcBsPewYH/G3H0ud++SHyqbo=;
 b=ernnJwYMplEK4bqZIK9iCYJ69gRhfvoYnM7M0SDoYFwZXFwDbEEv6VGuFKz1JMpAeklBih
 h9ZARNAI7gJW6zBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99E29138F5;
 Sun, 14 May 2023 09:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 52S+JAaoYGSxUAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 14 May 2023 09:21:10 +0000
Date: Sun, 14 May 2023 11:21:10 +0200
Message-ID: <877ctb8e0p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 1/3] docs: admin-guide: add valsa driver documentation
In-Reply-To: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Cc: alsa-devel@alsa-project.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
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

On Sat, 13 May 2023 22:20:35 +0200,
Ivan Orlov wrote:
> 
> Add documentation for the new Virtual ALSA driver. It covers all possible
> usage cases: errors and delay injections, random and pattern-based data
> generation, playback and ioctl redefinition functionalities testing.
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual ALSA
> Driver.
> 
> This new Virtual ALSA Driver has several features which can be useful
> during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
> of the PCM middle layer. Not all of them can be implemented using the
> existing virtual drivers (like dummy or loopback). Here is what can this
> driver do:
> 
> - Simulate both capture and playback processes
> - Check the playback stream for containing the looped pattern
> - Generate random or pattern-based capture data
> - Inject delays into the playback and capturing processes
> - Inject errors during the PCM callbacks
> 
> Also, this driver can check the playback stream for containing the
> predefined pattern, which is used in the corresponding selftest to check
> the PCM middle layer data transferring functionality. Additionally, this
> driver redefines the default RESET ioctl, and the selftest covers this PCM
> API functionality as well.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  Documentation/admin-guide/index.rst |   1 +
>  Documentation/admin-guide/valsa.rst | 114 ++++++++++++++++++++++++++++

We have already subdirectories for the sound stuff
(Documentation/sound/*), and this should go to there, I suppose
(unless there is somewhere dedicated for each selftest scenario).


thanks,

Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
