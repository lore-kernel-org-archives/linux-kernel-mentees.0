Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F9C7EE22
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 May 2023 09:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD9F141CE0;
	Sun, 14 May 2023 09:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD9F141CE0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YYzOgtkI;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SUM2jczq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bz9rODh0IntG; Sun, 14 May 2023 09:18:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A305B4013C;
	Sun, 14 May 2023 09:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A305B4013C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78B78C0037;
	Sun, 14 May 2023 09:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7E15C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BADB40510
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BADB40510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhJL_beU09wd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:18:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8CC4013C
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F8CC4013C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 09:18:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9297D21FF0;
 Sun, 14 May 2023 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684055901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YbTG3QHxp4xkrUDBC3uMLRB5y/TSfnVZ4mREVa2fxCE=;
 b=YYzOgtkIKMTo5ApVh3WkkM+zMdRBiHBYGIEQHqaspfVEWEuuJxHfHDRYelInR7fW3ujizU
 hWBBTFGjbvE6kRCdpsFGU6m2V+IEjJvi56IKO7NyCL5FVwdEsUQpcSNMCLOEBWm/oCGYh8
 xBYsbKQv9Jtq92G+ahsmj0KKO/XE4RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684055901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YbTG3QHxp4xkrUDBC3uMLRB5y/TSfnVZ4mREVa2fxCE=;
 b=SUM2jczqVqNtlR26shiac1QIfpQGMBoUdxPlIfI+gXnnxU1iHIBbsLc5qryuKg6PQ51cLi
 vS/KJrldFTlDp4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41991138F5;
 Sun, 14 May 2023 09:18:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8IUQD12nYGTNTwAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 14 May 2023 09:18:21 +0000
Date: Sun, 14 May 2023 11:18:20 +0200
Message-ID: <878rdr8e5f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 2/3] ALSA: Implement the new virtual driver
In-Reply-To: <20230513202037.158777-2-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-2-ivan.orlov0322@gmail.com>
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

On Sat, 13 May 2023 22:20:36 +0200,
Ivan Orlov wrote:
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
> Pattern-based capture stream data generation works in the following way:
> user can set the pattern by writing to the 'fill_pattern' debugfs file.
> After that, the capture stream in case of reading will be filled with this
> pattern (for example, if the pattern is 'abc', the capture stream will
> contain 'abcabcabc...'). The pattern itself can be up to 4096 bytes long.
> 
> After all, I think this driver would be a good start, and I believe in the
> future we will see more virtual sound drivers.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

The idea is interesting, and it's a definitely good thing to have.

I wonder, though, whether it could be better provided as an extention
to the existing snd-dummy driver.  The advantage of extending
snd-dummy driver would be that it already supports different formats,
etc.  OTOH, if we create an individual driver, the pro side is the
simpleness of the code.

I'm inclined to go with a separate driver, but I'm open about this.
Maybe Jaroslav and Mark have some opinions?

About this patch set: the driver name should be a bit more specific,
as this isn't a generic virtual driver that is used for general
purpose but it's only for testing.  And it's only for testing PCM.
So, a name like snd-test-pcm would be more appropriate, IMO.

And, we want the coverage of different formats, channels, rates and
accesses (interleaved vs non-interleaved).  How can we extend somehow
more for that?


thanks,

Takashi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
