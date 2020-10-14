Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED521C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:34:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3209E20B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg0yhHjG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3209E20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 902F587DFC;
	Wed, 14 Oct 2020 16:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0AFddYG4fzf; Wed, 14 Oct 2020 16:34:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E19CC87DE0;
	Wed, 14 Oct 2020 16:34:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC9F9C0052;
	Wed, 14 Oct 2020 16:34:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D72E0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFA4587DB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCHEubpNKeQw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:34:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1A3A987D9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:34:03 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t77so3863075oie.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DIEoiqLMaLoSOx4X+V1uBCmur2V5OdkLLdZqKbX2SnA=;
 b=rg0yhHjGil/dzr/a2r090Uzy71YZ6LwH6gb5YAXVZUcpNYYN6vJFrk24EdIm7N9glw
 Ej4mjIqOaGACI+im/P4GIz35o/hh54kfG+u6ovZPR7hzQ92sk2Ro7i5FtghwQ9cm1r55
 7jaYJJiq8Ck/k8U5xr8sY6WLoIJK3rxniMhyGPsKskNVv9nykI00cj73uZQ6/vxpieog
 sNCAYdNdgDjALkL3m9EiGUy1B9kPKnnQplvuzLodH8viOH1+PqmqNr1n5D+MzM3kEUa+
 C/BnXCE2Yk+AMyFUwMsqD5HvR7RFEw1ozrIrrm3fp4YXm3PaBF/H+ZB72CxV+c9+i2lR
 28uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIEoiqLMaLoSOx4X+V1uBCmur2V5OdkLLdZqKbX2SnA=;
 b=R9+I4H2/tyCsIq5HCzxQ8cVn4oQVMKSWy1LPeEaudIMLgxJrsDL/3aVeN4taHMRcYM
 5GOCY4EjGYMBZd9YJ9DCXqGLoRn1TM89tHIkkhtSAbliQQEL0Jn4GN62ZyHz4RNAAao6
 vAv/dEJY+I+gtKzuASaJ7niH/dCyuMu44/6iDEk1blxlH07EW3qURo8aWNnpyoAYbTRG
 SQ0BtnVmOT3wUflGnDFGLrrdxqZBWhF8hcb3q58kWBDlB9o6jwGcz7tZ4k6Icvw4POjK
 2uZkLsyrWo4TciiKFSuDf/7P/T4pSFQTAKc09VCkS4ofN7I655wGrjWVvOweGfJxDCOG
 4Avg==
X-Gm-Message-State: AOAM532j6cyFQhAF42KAccZJqsuW+Resf6hj6Ztssruo5Oi/eMa3ztxt
 MSmk3DagEnB9zD+dZzgjwcBcjU23p3TCYaxfuxQ=
X-Google-Smtp-Source: ABdhPJzVo0v65nl2zPlqkLM0/OOjzT9osCrWLOd4xBBJL/VL/iQz4IkzF4Aq4gIE3/eaagTLZrgyw2dwFbp+cuAqkKU=
X-Received: by 2002:aca:420a:: with SMTP id p10mr97960oia.117.1602693241890;
 Wed, 14 Oct 2020 09:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201014135637.92319-1-dwaipayanray1@gmail.com>
 <eb7e86171263a27e5c761bddf91439a5ec8c83e1.camel@perches.com>
In-Reply-To: <eb7e86171263a27e5c761bddf91439a5ec8c83e1.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 14 Oct 2020 22:03:35 +0530
Message-ID: <CABJPP5Cp7LNJhhNTtpoHidZEO1nXWL-+ZWijvOJ9EVQ4_cK_ng@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new exception to
	repeated word check
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

On Wed, Oct 14, 2020 at 9:47 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-14 at 19:26 +0530, Dwaipayan Ray wrote:
> > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > moved the repeated word test to check for more file types. But after
> > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > new warnings of the type:
> >
> > WARNING: Possible repeated word: 'git'
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3063,7 +3063,7 @@ sub process {
> >                               }
> >
> >                               next if ($first ne $second);
> > -                             next if ($first eq 'long');
> > +                             next if ($first =~ /(?:long|git)$/);
>
> Nak.  This needs a leading ^ otherwise words
> like "belong" and "digit" match as well.
>
>                                 next if ($first =~ /^(?:long|git)$/);
>
>

Yikes, that was silly of me. I will correct and send you the
updated version.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
