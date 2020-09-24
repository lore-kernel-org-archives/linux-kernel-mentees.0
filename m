Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA646C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 15:30:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF2D206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 15:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezNq1DHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CF2D206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B03B187506;
	Thu, 24 Sep 2020 15:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gj-esOJo-mup; Thu, 24 Sep 2020 15:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4708E874D8;
	Thu, 24 Sep 2020 15:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B211C0890;
	Thu, 24 Sep 2020 15:30:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A1BCC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 61D2486A3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGBWKk9rTmEY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:30:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C6C3381389
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 15:30:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f18so2103901pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yanHGoZJj/tcEI8AVG6llL0fhzRiqvwYaviiL5Ezz3E=;
 b=ezNq1DHk4aNb+MSOycaRr9VWUq1Qil3Y4UoOygCV1AX9tQN1xlt+KEI3xDsK4hm60D
 GFOugf47Qt1NC/tZueImMyAiEYCqCXEP26A9qXOgblPKBalIb6Fp+r87y8OkF24rtv2e
 1p8+WnTVov6uGi64oLAPHumRF4sskzWR3wFGEG7DiUIf0lWJQ/c9yG+61mFwp6K+kRct
 gm1ASwt/Tj9es80OzDDvf30uxyZ46OdNkhAIf6Md/MCZVpqREZu7gKj3fZk4H48JYKBB
 zbO82ZiSr+J1f1iAwv21h7zWDDL6cm1AKIL97ZEhHahS4+3ZCOZuy1sGWtGq/PVX+nZB
 nQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yanHGoZJj/tcEI8AVG6llL0fhzRiqvwYaviiL5Ezz3E=;
 b=ErO4ckxVNfGFHr3RWToKuQQvJMaRFyuMCdVqaQGHT7QOlxdmqw0y0YyS+zDoxyfh+7
 M5SK2LVX8S0u2ZyR42pGcqwj6xHkum165vFY+uvoMw6Wq2ch63LjNbDvM4HzuCtvIn5E
 SG7ZwGpK9jrhrTbrcrciWKj3TcqfCdn5E22UrMLZFytA4qOAMDljMGKZq7Dz2XzyJyfr
 Clx3Fh3z5NwgpdBm6bxwNQ+B2tsF24FRs0sJWX8RdwUpP03NM1VOBE6A8oBKQPJwvnwQ
 qXLi6G6CBk7vtBLpsYMMgmFBcMS2cr+kqT64VVVylBn2OEHm3DE1JbRK0uQhrjSDdArw
 Sagg==
X-Gm-Message-State: AOAM5336TAxtdkl/SQ3YX2osLo43E8kNa7TxpYP3TcV6eZ5XYG+C8Nuj
 yNzQ1jgsxkK9qaGg6+IdAQ==
X-Google-Smtp-Source: ABdhPJwqZfwiI24nj6maCQ3FVjnC1hLBovtP3quILpVSg5gXxUjuwWRHxbd90tmjpkb4DXHr/yYuNA==
X-Received: by 2002:a62:3812:0:b029:13e:d13d:a062 with SMTP id
 f18-20020a6238120000b029013ed13da062mr4689781pfa.40.1600961448347; 
 Thu, 24 Sep 2020 08:30:48 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id u2sm2825443pji.50.2020.09.24.08.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:30:47 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:30:35 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200924153035.GA879703@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
 <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

Hi!

On Thu, Sep 24, 2020 at 02:42:18PM +0000, David Laight wrote:
> > On Thu, Sep 24, 2020 at 09:38:22AM -0400, Peilin Ye wrote:
> > > Hi all,
> > >
> > > syzbot has reported [1] a global out-of-bounds read issue in
> > > fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
> > > value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
> > > font data buffers, declared in lib/fonts/font_*.c:
> ...
> > > (drivers/video/fbdev/core/fbcon.c)
> > >  	if (font->width <= 8) {
> > >  		j = vc->vc_font.height;
> > > +		if (font->charcount * j > FNTSIZE(fontdata))
> > > +			return -EINVAL;
> 
> Can that still go wrong because the multiply wraps?

Thank you for bringing this up!

The resizing of `vc_font.height` happened in vt_resizex():

(drivers/tty/vt/vt_ioctl.c)
	if (v.v_clin > 32)
		return -EINVAL;
	[...]
	for (i = 0; i < MAX_NR_CONSOLES; i++) {
			[...]
			if (v.v_clin)
				vcp->vc_font.height = v.v_clin;
				     ^^^^^^^^^^^^^^

It does check if `v.v_clin` is greater than 32. And, currently, all
built-in fonts have a `charcount` of 256.

Therefore, for built-in fonts and resizing happened in vt_resizex(), it
cannot cause an interger overflow.

However I am not very sure about user-provided fonts, and if there are
other functions that can resize `height` or even `charcount` to a really
huge value, but I will do more investigation and think about it.

Thank you,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
