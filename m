Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24DDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:29:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F82620790
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPlgsoFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F82620790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9601A87A7A;
	Tue, 13 Oct 2020 06:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2SEA8PtvFMu; Tue, 13 Oct 2020 06:29:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 055D387A66;
	Tue, 13 Oct 2020 06:29:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA850C0052;
	Tue, 13 Oct 2020 06:29:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F14BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63B33869F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyHxtb7SD0L6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:29:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 24AA985625
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:29:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t9so22506954wrq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RYXc+EjcZCTB7jN33Zh8wrO64rTO2+WDSjyAxO/oHok=;
 b=gPlgsoFW5NYWrP189YegZnJKEQbuhZoElw4Ijv/l7yd3iQ1u4BbInTPtfd9SbstNAu
 mdnpNnRaKmIR34oso2so+znrE4j0XnhkolqdTmhsqs7uFdrb7JSqAgEFoYUbO+3u4H6D
 Qy9bo5M8n++j+wfbtjbUdYPmeaCqwY+YWnBqAb98QO6D9nNp7lZ6ty/Xl+nodhpC6751
 2YyPjsrkCE+dmNcRgRU0baOmMoYP1B+Rr2/lDQ0512p14msYKNzV/HuQ18q4HKwg+3fs
 ev9L0HALexdWW18K6pTIRYgzdaTOaZz1EMUAJxMQlGAk7sIo7WNcBSUY600qIm9rp4LZ
 meZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RYXc+EjcZCTB7jN33Zh8wrO64rTO2+WDSjyAxO/oHok=;
 b=bXyKYvQtVWhTCNnClWycdcmMlqQ+ETQa60ss+EdPk63p2qR8ikMfSdHWGLeR06a4hO
 LwsMdvboPDVqGYc2u87TiU9YGCU3Y25/Cz4p8/OQZxfxjuLlHS7IJI7uyAAKOBYeWAjs
 zzdvS8aIyciTBEM647jTaLQceSG/aH3FNp4Q3NE6mDiOAyBsY2qCoEfI2GNduH2n5E/A
 l0hl6iPJdlUqVypWoPOWh3Uzlzi660j1wRRKmYNewhJnVO1Zx4k53AOrZ09yShkYizX5
 YHsdHhV4I5JQlkEFvCLUOwpeUgEVeh9IFC05mqSaNfakwMFzS+ynhU38Q+9qPcokz6aK
 AQGQ==
X-Gm-Message-State: AOAM530TcOrcV6R73XA9v50h7HrKevHJxMblWLLl5lb/uKSA4fcZtyNd
 YVfZ7hcUM1+TyTuujbx5BAc=
X-Google-Smtp-Source: ABdhPJz40RGgwfM7JOBs4tFTgEix1bsxe0EefG3tKr3GZzmKtMSZoYJUFGLRvRwTdrDXctkv0mEyBA==
X-Received: by 2002:adf:97dd:: with SMTP id t29mr25624298wrb.322.1602570545486; 
 Mon, 12 Oct 2020 23:29:05 -0700 (PDT)
Received: from felia ([2001:16b8:2d05:8100:f946:8909:5b39:f23e])
 by smtp.gmail.com with ESMTPSA id d4sm27610750wrp.47.2020.10.12.23.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:29:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 08:29:03 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Ay1KHXYUzo1gkMrP9vmhX81g12L3ZQmPrec2ydujYxog@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010130824530.14590@felia>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
 <CABJPP5Ay1KHXYUzo1gkMrP9vmhX81g12L3ZQmPrec2ydujYxog@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
 whitespace in formatted email
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



On Tue, 13 Oct 2020, Dwaipayan Ray wrote:

> On Tue, Oct 13, 2020 at 11:46 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
> >
> > > Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> > > checks.") introduced new checks for author sign off. The format_email
> > > procedure was modified to add comment blocks to the formatted email. But
> > > no space was added between the email address and mail comment.
> > >
> > > This causes wrong email formatting in cases where the email is in the form
> > > "author@example.com (Comment block)". The space between the address and
> > > comment block is removed, which causes incorrect parsing of the
> > > formatted email.
> > >
> > > An evaluation on checkpatch brought up this case. For example,
> > > on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
> > > the following warning was reported:
> > >
> > > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> > > system concerns)' might be better as 'David.Laight@aculab.com(big endian
> > > system concerns)'
> > >
> > > Add a single space in between the address and comment when the
> > > extracted comment is not empty.
> > >
> >
> > Dwaipayan, looks good to me.
> >
> > So, how about a 'Fixes:' tag?
> >
> > Aditya, can you rerun your evaluation with this fix patch applied on top?
> >
> > Then, we need a comparison for:
> > 1. completely before vs. after the two patches, and
> > 2. after the first patch vs. after the two patches (to see that the fix
> > works)
> >
> > More support on evaluation from others interested to become mentees are of
> > course welcome.
> >
> > Lukas
> 
> Sure I will add the tag.
> Do I send it to LKML after this or after more evaluation?
> I did run on some of the newly generated bad sign off warnings and
> they seem to be fixed.
>

Go send it out; we will run the evaluation just as sanity checking...

Remember that currently the merge window of the next release is ongoing;
so, Joe will probably review and ack, but Andrew Morton might only pick it 
up in a few weeks (after the hot phase of the merge window).

Maybe a fix will be picked up faster though. We will see.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
