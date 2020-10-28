Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DF0C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:59:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B2EB247D4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKuv9dKd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B2EB247D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A197F86BB6;
	Wed, 28 Oct 2020 15:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmUQQ-yUmwo7; Wed, 28 Oct 2020 15:59:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E10D86B0E;
	Wed, 28 Oct 2020 15:59:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7756C0859;
	Wed, 28 Oct 2020 15:59:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CAFEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B2CC20526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UiblJs9-ioT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:59:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5900B203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:59:17 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dn5so5722721edb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cJAn77o994EfkkHhXKW4sk2WJiLCtolXbWlqLCiVSLA=;
 b=gKuv9dKd13WPqBb2u/bi0je4ToObAptnBxeUlAEdxjWSznjgpH1M++edJmiY8khv9O
 wJT6sW2taFBz05NJVLvnJzeTSC3HhQNx3VfF71HClj2hLa2OZFgh7CgAiuVQI23EwDE7
 PuUj+/r4HBNOyjxdtoipR0D9SKeGvLRiVMbbKcHMDGSlVu4hVwMRui8SjzL1P6L1v+IQ
 Zfz+KUbiV6Qqg64Tmlbk6/YlxjMBBwQCHK3UJTZN8G8GLUQOkijrYPS9ZGu6x1HUYb3Y
 gNCPbRcdfpVBPk0SPVeXD6iJD+z9Tb82H0K4NtKd4v/KCLm/VXcVCpcGC8ESR2rKB+Ft
 TVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cJAn77o994EfkkHhXKW4sk2WJiLCtolXbWlqLCiVSLA=;
 b=nujXYHqdWsgQ/GhfhpSoq4k22b2jC/7E/dH4TL+GS1FuGv0sSOXRZ3xPntrMM8+QwF
 G8z35D9xW4hkC01I/2fsJ1uy7Ra92nPQ2F+hiQXM54fKplMuluOdv9WY/+cRNU2TcH1Q
 vKjYaDV0WKvykopxoezguIGTGWuW0D3TbkzDtRmH5xm+VV62xfO/23kTfFkxx/4/4YnR
 zoHMDF2tGM5416nOWYFydJkLTjz8vuLX2ZBWrBh/TIoteASUYjUPeh1Uc/Tn15RgoC3/
 fzpmTl1ePk0HRTV+mMpfuaDSezOgqVaOYDXpRRjPxnRJyyZ1uCEZYoJJLw5EqtB0hGb6
 sIzg==
X-Gm-Message-State: AOAM531tqTROO1Vb8OoPzhM9ABjNtLXV0I2o8YRd5NKOVmhDuii2LAOD
 UtpX+9Zvd9y8+hU/aY5igrA=
X-Google-Smtp-Source: ABdhPJyo4PdNlFpCiPCC7yhjQ0+S02q5t1j1d944WTlr40lOrKHJ8jblcjUCAm674KAz9+mHMmtlAQ==
X-Received: by 2002:a50:ff10:: with SMTP id a16mr8436896edu.83.1603900755767; 
 Wed, 28 Oct 2020 08:59:15 -0700 (PDT)
Received: from felia ([2001:16b8:2d7a:200:a915:6596:e9b0:4f60])
 by smtp.gmail.com with ESMTPSA id l17sm3239278eji.14.2020.10.28.08.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:59:14 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 28 Oct 2020 16:59:12 +0100 (CET)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010281651520.13040@felia>
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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



On Wed, 28 Oct 2020, Dwaipayan Ray wrote:

> On Wed, Oct 28, 2020 at 8:55 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > checkpatch has limited support for parsing email comments. It only
> > support single name comments or single after address comments.
> > Whereas, RFC 5322 specifies that comments can be inserted in
> > between any tokens of the email fields.
> >
> > On analyzing 50,000 commits from v5.4 it was found that there were
> > about 370 false positives resulting from wrong parsing of comments.
> >
> > Improve comment parsing mechanism in checkpatch.
> >
> > What is handled now:
> >
> > - Multiple name/address comments
> > - Comments anywhere in between name/address
> > - Multi level comments like (John (Doe) )
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index fab38b493cef..ae8436385fc1 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1183,14 +1183,20 @@ sub parse_email {
> >                 }
> >         }
> >
> > -       $comment = trim($comment);
> > +       # Comments in between name like John(A nice chap) Doe
> > +       while ($name =~ s/\s*($balanced_parens)\s*/ /) {
> > +               $name_comment .= trim($1);
> > +       }
> >         $name = trim($name);
> >         $name =~ s/^\"|\"$//g;
> > -       if ($name =~ s/(\s*\([^\)]+\))\s*//) {
> > -               $name_comment = trim($1);
> > +
> > +       # Comments in between address like <john(his account)@doe.com>
> > +       while ($address =~ s/\s*($balanced_parens)\s*//) {
> > +               $comment .= trim($1);
> >         }
> >         $address = trim($address);
> >         $address =~ s/^\<|\>$//g;
> > +       $comment = trim($comment);
> >
> >         if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
> >                 $name =~ s/(?<!\\)"/\\"/g; ##escape quotes
> > @@ -1205,8 +1211,6 @@ sub format_email {
> >
> >         my $formatted_email;
> >
> > -       $name_comment = trim($name_comment);
> > -       $comment = trim($comment);
> >         $name = trim($name);
> >         $name =~ s/^\"|\"$//g;
> >         $address = trim($address);
> > @@ -1216,6 +1220,11 @@ sub format_email {
> >                 $name = "\"$name\"";
> >         }
> >
> > +       $name_comment = trim($name_comment);
> > +       $name_comment =~ s/(.+)/ $1/;
> > +       $comment = trim($comment);
> > +       $comment =~ s/(.+)/ $1/;
> > +
> >         if ("$name" eq "") {
> >                 $formatted_email = "$address";
> >         } else {
> > --
> > 2.27.0
> >
> 
> Hi,
> This patch is a follow up to our discussion earlier about improving the
> comment handling at:
> https://lore.kernel.org/linux-kernel-mentees/alpine.DEB.2.21.2010251022060.25172@felia/
> 
> I have only tested it on a few patterns.  But I will run an
> evaluation again on those 50k commits to see what changes.
> 
> What do you think of this?
>

That was exactly the comment I wanted to make.

Commit message is clear; code addition also looks pretty clear.

We are just missing the evaluation to make sure how much we improve and 
that we did not add some stupid bug on the way.

Aditya, can you help us here with evaluation?

E.g., Dwaipayan takes from v5.4 into the future, e.g., until v5.8/v5.9 or 
so.

Aditya, you could then check e.g., v5.0..v5.4, so v5.4 down to the past as 
far as your computer and scripts handles within roughly half a day...

An evaluation on 100,000 commits is certainly a good basis.

Of course, every mentorship candidate can join here as well and show off 
their own evaluation script.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
