Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92517C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 21:56:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E9E239EC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 21:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lw4joe8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E9E239EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C6AA12E113;
	Thu, 24 Sep 2020 21:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJbkbZT1ximK; Thu, 24 Sep 2020 21:56:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 795A8204B3;
	Thu, 24 Sep 2020 21:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70970C0859;
	Thu, 24 Sep 2020 21:56:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A883C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1088186E86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6G31IFtpGuNS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5661986E72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:16 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c9.dynamic.kabel-deutschland.de
 [95.90.213.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3363F206BE;
 Wed, 16 Sep 2020 07:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600239676;
 bh=L7oCfnb7lEbHdLKLiukpW+KCpdLJw0nUo40GHh0SkEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lw4joe8LKCkqV8IJyb1iQmNv0ta/uvx8FsMu8X1vcgC2vDAKQnn/bSg4riQZmEQv4
 Y5Iwvhp05ckwvW1k2LTAo6M9r9GsPnmuXBMhZA+qEfuWKGgtUbHXPRTYAPwndI6jjh
 Ia1xVsefs9m3xacGNvniuovmD+3U5+KSx2qO8Oag=
Date: Wed, 16 Sep 2020 09:01:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200916090111.7dcfa0fe@coco.lan>
In-Reply-To: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
 <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
 <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Sep 2020 21:56:14 +0000
Cc: "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
 linux-kernel@vger.kernel.org,
 "linux-kernel-mentees@lists.linuxfoundation.org\"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "@osuosl.org,
 " <linux-kernel@vger.kernel.org>"@osuosl.org,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [v10 3/4] media: vidtv: add a bridge
	driver
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

Hi Geert,

Em Tue, 15 Sep 2020 15:35:00 +0200
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> Hi Daniel,
> 
> On Tue, Sep 15, 2020 at 3:26 PM Daniel W. S. Almeida
> <dwlsalmeida@gmail.com> wrote:
> > >> +    u32 nbytes = 0;  /* the number of bytes written by this function */
> > >> +
> > >> +    u64 nbytes_expected; /* the number of bytes we should have written */
> > >> +    u64 nbytes_streamed; /* the number of bytes we actually wrote */
> > >> +    u32 num_null_pkts; /* number of null packets to bridge the gap */
> > >> +
> > >> +    u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> > >> +                                              m->timing.past_jiffies);
> > >> +
> > >> +    elapsed_time_msecs = min(elapsed_time_msecs,
> > >> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> > >> +    nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);  
> > >
> > > Seriously?!?
> > >
> > > You multiply by 1000 first, followed by a division by 1000 using an
> > > expensive 64-by-64 division?  
> >
> > This entire function is broken and needs a do-over :)
> >  
> > > using an expensive 64-by-64 division?  
> >
> > I am new to kernel development. I wasn't even aware that this was
> > expensive, to be honest.  
> 
> All divisions involving 64-bit data are expensive, especially on 32-bit
> platforms.  That's why we have the helpers in <linux/math.h>.  Most
> of them implement simplified variants, which are less expensive.

I agree that 64-bit math is something that should be used with some
care. However, it is almost unavoidable do to 64-bit divisions for
digital TV.

See, digital TV system deals with frequencies that go up to
2,150 GHz (and that's after converting them from ~10 GHz range,
which is done on userspace, on satellite systems).

Basically, most DVB drivers end using 64 bits math to setup clocks.
Although we converted most of those cases - I guess there are still
a few legacy drivers (written before 64bit archs) that use an
algorithm for 64 bits division with a 32 bits result. That should
be more expensive than a 64-bits division, specially on 64-bit archs.

Also, stream bit rates are at the order of up to 50 Mbits/s. So,
QoS stats usually need to do 64-bit math too, in order to avoid
overflows.

-

On the other hand, a few 64-bits math operations at Kernel side
means nothing in terms of the systems performance, as those are usually 
done  either at setup phase or when some data packets arrived. Most
of CPU cycles ended being spent at MPEG-TS decoding and at audio/video
codecs, with needs to be done for each sample, and usually spend
lots of CPU (and GPU) cycles doing math and copying big chunks of
data.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
