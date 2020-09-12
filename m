Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A44BC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 07:38:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5BD208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 07:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZUPvkCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5BD208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 829568787F;
	Sat, 12 Sep 2020 07:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANzLXBtC9ljw; Sat, 12 Sep 2020 07:38:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E3D987841;
	Sat, 12 Sep 2020 07:38:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 446A8C0052;
	Sat, 12 Sep 2020 07:38:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D27ACC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC60387606
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXAo-6YZDXuV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0BFE2870C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:38:51 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EA2F208FE;
 Sat, 12 Sep 2020 07:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599896330;
 bh=MPMDt5Z8epGuIHo2C4//AAN0KMcXaQW71otdZM9TyLg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kZUPvkCl5qE6JkExxWKRHtiwDNr8PxJXPXR1i0x6qRGPIpSPzYYDmzw9kanqq734Z
 JzaR08D3QJEtMEtaRDMbCvZYERmV6jBICFctlD6lwpjWFA4OXpwWkfxWEr8q95HYXF
 8/ugsQhzteeELk7qj/aI5Ei2f3HiHrdadR2vNf6Q=
Date: Sat, 12 Sep 2020 09:38:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200912093845.6fdd7352@coco.lan>
In-Reply-To: <78C65222-868B-404B-974E-D8808586845A@getmailspring.com>
References: <20200911155640.79a15a14@coco.lan>
 <78C65222-868B-404B-974E-D8808586845A@getmailspring.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: " <skhan@linuxfoundation.org>, "@osuosl.org,
 "r.verdejo@samsung.com" <r.verdejo@samsung.com>, linux-kernel@vger.kernel.org,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 " <linux-kernel@vger.kernel.org>"@osuosl.org,
 "linux-media@vger.kernel.org\"
 <linux-media@vger.kernel.org@casper.infradead.org>, "@osuosl.org,
 "  <linux-kernel-mentees@lists.linuxfoundation.org>, "@osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
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

Em Fri, 11 Sep 2020 23:54:15 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro,
> 
> > Ok, I guess I got what should be done here. ETSI TS 102 154 says that
> > SMPTE 302M should use the "registration_descriptor".
> > 
> > From the specs, such descriptor should be filled with 
> > format_identifier = 0x42535344.
> > 
> > We need to add this on both at v4l-utils and at the vidtv driver.  
> 
> vidtv will already attach a registration descriptor for s302m audio, i.e.
> 
> dvb_parse_section: table 0x02, extension ID 0x0880: done
> PMT
> | table_id 0x02
> | section_length 24
> | one 2
> | zero 0
> | syntax 1
> | transport_stream_id 2176
> | current_next 1
> | version 1
> | one2 3
> | section_number 0
> | last_section_number 0
> |- pcr_pid 0200
> | reserved2 7
> | descriptor length 0
> | zero3 0
> | reserved3 15
> |\
> |- stream 0x0111: ISO/IEC 13818-1 Private Data (6)
> | descriptor length 6
> | 0x05: registration_descriptor
> | 42 53 53 44 BSSD <<<<<<<<<<< here it is
> |_ 1 streams
> 
> So I guess I need to add support for it on v4l-utils then? Any tips on
> how to get started?

This is easier if I do myself than to explain it, especially because
the registration descriptor is not decoded yet.

Just added support for decoding the registration descriptor:

	https://git.linuxtv.org/v4l-utils.git/commit/?id=d070107d6267f617bb7331d84507701c8e2d673c

The actual patch making dvbv5-scan libraries to support it is trivial:

	https://git.linuxtv.org/v4l-utils.git/commit/?id=fcbd7fae7c2208e01a7f670f8ba2f34d62ea6a4d

> 
> By the way,
> 
> > My plan is to write some patches on the top of yours, in order to
> > address the problems I'll find on it. If not something more critical
> > won't be solved in time, we may still add it at staging/media. 
> > Let's see.  
> 
> Can you teach me how this works in git? Am I supposed to cherry-pick
> your patches, or apply & rebase -i & squash, or something else?

Well, the basic stuff is all there: the driver loads and unloads
fine (after my patch), and it does what's expected. So, no need
to put it under staging. 

I'll just merge the 4 patches from you, plus the one I wrote fixing
unloading it at the media tree.

You can write any other patch on the top of it.

I'll do the same, c/c you on the patches I write afterwards.

> >Well, if you have some spare time, you could try to write
> >a debugfs binding for vidtv. The best would be to have it
> >on a separate file. Failing to bind debugfs should not
> >prevent loading the bridge driver.  
> 
> Sure, can you provide more details on how this and vidtv should play
> together? I will catch up on
> the documentation for debugfs in the meantime

I'm thinking on something like:

	echo 1 >/sys/kernel/debug/vidtv/discontinuity

to generate a frame numbering discontinuity

and other things like that, changing S/N ratio and other parameters
and injecting errors, in order to test the effects on user apps.

> 
> As for vidtv_s302m_write_frame:
> 
> >doing that didn't work. Yet, this check inside the driver:  
> 
> What didn't work? It didn't compile? I should have sent a proper diff
> but I was short on time, sorry...

No. I meant the audio was not a sinusoidal wave after such change.

-

Anyway, now that rmmod is working, modifying the driver is a lot
easier, as you don't need to reboot the Kernel every time.

you could just do something like this:

    $ sudo rmmod dvb_vidtv_bridge dvb_vidtv_demod dvb_vidtv_tuner; make drivers/media/test-drivers/ && sudo cp drivers/media/test-drivers/vidtv/*.ko /lib/modules/5.9.0-rc1+/kernel/drivers/media/test-drivers/vidtv/ && sudo modprobe dvb-vidtv-bridge && dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -P -v -t 4 -o pcm_audio.ts

which is a lot faster.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
