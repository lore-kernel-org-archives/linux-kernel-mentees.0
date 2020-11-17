Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E4CC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:22:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61401206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvHrMR1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61401206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8C6786684;
	Tue, 17 Nov 2020 10:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9m5eeLaz-HvY; Tue, 17 Nov 2020 10:22:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FE8185682;
	Tue, 17 Nov 2020 10:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06D9EC0891;
	Tue, 17 Nov 2020 10:22:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15C9AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 041F0844D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DT_maqdT61SL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D515283612
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:22:05 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id h6so14437816ilj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 02:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yw60kYhqDr8ucVZwMJU6Ksh44AdpP2IZ3BFIM3cTzRo=;
 b=LvHrMR1lfhWHyeQcTkHK37DeXiBddSQQBxVKj63o0rJUyRa/Le6hZ0RdFTRqSXNWg2
 2TnM3OBFrwfb4Fc83RIE9mpI8M8b69AghoMIDfwoVHK4UeRpW/Wuj/76qgZHJDLKfLec
 Rr4A0LqkRob9YuhD4D9ADVfc+T1USBq1o/3B4ni98+KR9uYg69G3Cyuea0M9eJGpW7vP
 W71P0VZ2vo+QIQ1tra1LizrdjXg9eMJ23SfFRAcRPx1ASuhemmSmHKcbI5BhbbCcbdvl
 usV8qzirhM1jXlj8Az0DG36t8hA8DE4ZzbPvWHLGOtawYN31OFTbqQUBIIlDVekjSAkA
 ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yw60kYhqDr8ucVZwMJU6Ksh44AdpP2IZ3BFIM3cTzRo=;
 b=RVtR7q9S2GGjSFb9PIJuvQ+2IuelFXDElEAYlOydqP+znDspE7QeMIEgD/ZJ01bh1N
 IRcGTczShESqzV7HY1hfAa3oaHUi5Z5a08/tpE4/eZr9OT7aS3LwwSEcGLOw8yWnvS3f
 A7iVqoJEfeXYv4xsQlB45LR5dg/o0Rd+756mmEcq8Wgv+sSMkEA09cn3DfXt1gAllKdY
 Gshmm88qO30RGXNVsCc6J/pcCIodbPEjq63ts5oz/V/PhxiAzDfw4i3hYpjVI2IDk4AH
 ydsoqE5juHJLUorguAnoQTa2fNxBn1M/FRUDVSUWLwLJ2+edgOjHZpLH7ajIm018mXf+
 fKWA==
X-Gm-Message-State: AOAM5330J8t5ayxZ0rzfKlC87EHsRRdjmG4Ow6qOPhcb2EbJ70gy9WDM
 +SVNd5ixqCyuLV3C18N48HRFQ4JHIVadVmruQQI=
X-Google-Smtp-Source: ABdhPJxPVUFNZHk/tHp765anbL/PX5LiAT50Eagj4VX1/c2e/6QjgTEAJQvKGDjBoBTQsI9nWscsJrnY0d1Grjd4NQM=
X-Received: by 2002:a92:512:: with SMTP id q18mr11260314ile.147.1605608524946; 
 Tue, 17 Nov 2020 02:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20201117040501.21914-1-yashsri421@gmail.com>
 <1b9c5353c6318cc7a4e013886012739e6627d82d.camel@perches.com>
 <791b3213aaabd5ecccc9d3f6dd0e8ee420611dbd.camel@perches.com>
In-Reply-To: <791b3213aaabd5ecccc9d3f6dd0e8ee420611dbd.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 11:21:54 +0100
Message-ID: <CAKXUXMxGbL8myAJwobCNEimxmwKTyF41WUNkLU45HTqSKKAPRw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
	for MAINTAINERS_STYLE
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

On Tue, Nov 17, 2020 at 5:29 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-16 at 20:26 -0800, Joe Perches wrote:
> > On Tue, 2020-11-17 at 09:35 +0530, Aditya Srivastava wrote:
> > > Checkpatch expects entries in MAINTAINERS file in a specific order and
> > > warns if the changes made do not follow the specified order.
> > >
> > > E.g., running checkpatch on commit b33bc2b878e0 ("nexthop: Add entry to
> > > MAINTAINERS") reports this warning:
> > >
> > > WARNING: Misordered MAINTAINERS entry - list file patterns in
> > > alphabetic order
> > > +F: include/uapi/linux/nexthop.h
> > > +F: include/net/netns/nexthop.h
> > >
> > > Provide a simple fix by swapping the unordered lines, if both the lines
> > > are additions (start with '+')
> >
> > On second thought, nak.
> >
> > This fails when there are 3 consecutive misordered lines.
> >
> > SECTION
> > F:    c
> > F:    b
> > F:    a
> >
>
> btw:
>
> scripts/parse-maintainers.pl already does this reordering properly so
> this particular --fix addition isn't all that useful.
>

I think the real fix is to provide some more documentation on
scripts/parse-maintainers.pl that explains how to run this script when
an author hits the warning type in checkpatch.pl.

I see these follow-up patches:

  - some documentation on scripts/parse-maintainers.pl
  - a patch to checkpatch.pl that points out this documentation when
this warning occurs.
  - maybe: improve of scripts/parse-maintainers.pl to handle exactly
this use case of a patch author (assuming that the patch was just
created with git format-patch -1) and how to get the corrected diff
for this patch.
  - maybe: a patch to checkpatch.pl that can create the command for
scripts/parse-maintainers.pl for a specific patch and which then can
be added with git commit --amend or git commit && git rebase and
squashing that in.

I think once that is done and better understood, you can much better
judge if there is really a need for a fix in checkpatch.pl.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
