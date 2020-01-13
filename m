Return-Path: <SRS0=VDQn=3C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661E1C33CA8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 08:52:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D31D20678
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 08:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iUMNVIah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D31D20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2E3280ACD;
	Mon, 13 Jan 2020 08:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvFQibDQL8AU; Mon, 13 Jan 2020 08:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C1710849B8;
	Mon, 13 Jan 2020 08:52:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B019AC18DD;
	Mon, 13 Jan 2020 08:52:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B7A9C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 08:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2772E84E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 08:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPalOJ81WnKT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 08:52:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9ABB811F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 08:52:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c16so8930873ioh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WguZovr7w2m2X1zQC6+qX9nLM78GMuCabyk3ve+En7w=;
 b=iUMNVIahZJ+iYbyruFJTQpGPwrHA6AbG3SEi1ryfNGcBbqSZhlOZ972H5JVFhpaJu3
 SuxTyCywmNR32/JAz023KaCvReKJ2xvTMZkEU+2+rGlm/PxbAHWugOvhz1JzW5YAkn7w
 X1Y9vVnN8ThfKMFcwdJLuJhJhmVOchINsZaxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WguZovr7w2m2X1zQC6+qX9nLM78GMuCabyk3ve+En7w=;
 b=HlQ6Oiv1L12wwqb1gbTtbUef1aq3ER8ZfNOTGDsvi/qIO68/pgV2coBMCfs2T4PiYG
 F/keS/gZ3BISV0oHXBOnbVNGSelHb3Ns/65K/zw9ydWHDcJSi69RPV/ac/CCO9rBKevP
 sprICs0z35W0g5HuKfBH4wPuHkv98zcszy+KUC+TFOVTdoG4qr79VR61DgtMSPgTcYAI
 DUQzeKTY3ReGN2RteCX7B+K8Eo7ep+H0ZgtxEjfu1PyGrVG2g6iDAxx8uBkGKdLOFQKG
 fSAl7pCNt7enAaOQuLxH9kext0M4Bea55MEwSRUHEMIRhNJGoxvry9xk3B4U1ArJ1Fvw
 5bgg==
X-Gm-Message-State: APjAAAX+ZztXZHPoeX6h2dvCO1inRqpVGS7kBLKolFVTnXSqkyLcQoz/
 en+dvc6CX+AHf+0pG3nLdrqZQxkE/+HDqtVIb91w/g==
X-Google-Smtp-Source: APXvYqyD1z3AhO+BunsjSlb7c6IJA/YCCugP+yTkUD3iDk7YUduoV/eRTFouDc06SaotaswtXWIGMt+FAjQFrWE+B0I=
X-Received: by 2002:a02:6a10:: with SMTP id l16mr13056335jac.77.1578905527652; 
 Mon, 13 Jan 2020 00:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20191231185110.809467-1-dwlsalmeida@gmail.com>
 <20200110110923.31fc56e5@lwn.net>
In-Reply-To: <20200110110923.31fc56e5@lwn.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 13 Jan 2020 09:51:56 +0100
Message-ID: <CAJfpegsBbLWaF43WtyTo8y-_sUjLi=60sQoXHDatsSVg8m68PQ@mail.gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: markus.heiser@darmarit.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] Documentation: filesystems:
	convert fuse to RST
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

On Fri, Jan 10, 2020 at 7:09 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 31 Dec 2019 15:51:10 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:
>
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> >
> > Converts fuse.txt to reStructuredText format, improving the presentation
> > without changing much of the underlying content.
> >
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>
> So I note that the last non-typo-fix change to this document happened in
> 2006, which leads me to suspect that it might be just a wee bit out of
> date.  Miklos, what's the story here?  Should we put a warning at the top?

The document seems to be mostly valid still.

It would be good to have more documentation, though...

Thanks,
Miklos
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
