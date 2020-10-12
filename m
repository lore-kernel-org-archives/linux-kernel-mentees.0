Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD0EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:56:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F3520870
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k79IQYW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F3520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA3F7869BD;
	Mon, 12 Oct 2020 18:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFCcQ4ICY6ed; Mon, 12 Oct 2020 18:56:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B71B686A77;
	Mon, 12 Oct 2020 18:56:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5F62C0052;
	Mon, 12 Oct 2020 18:56:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9094AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7D904872A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYRZYp7J1OWe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 64C7C872A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:56:25 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id e22so24705066ejr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=biDPwLiI8Ik7bdHXyocGnxl7FqtosCDZ7Phqn+mpcy8=;
 b=k79IQYW374a8wG6Z4vjRd6ETzFT+f8zG+MhxFmu4j1X/rv0cBp2F+uUG6ruOR2yp3a
 ddqZcIxMQLDOgJP5+Y5zIqY2ez/jXfSVA5swb3sLyI1aAWbREw1SPnhlvbom0d/DVF+Q
 W2pvIn1zF+CVclti1A9cU7uATHMwfnV/8zZEJ9UYSUuYFN9ydoiO1Vwot2XfuDKLcRG/
 bIfG35kj61IOSwu6QOQ2E/XJ4DaYi/7Pki9Y/44uoYhPoq4SJXSscs6cQPGc45oKL2d5
 pzNxtsZy8NPD2y+xg6oCGUset2LZcj71eH64M+gjzffvGWfIoiNVVRrOvvNThwO0oPc5
 zMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=biDPwLiI8Ik7bdHXyocGnxl7FqtosCDZ7Phqn+mpcy8=;
 b=gYtHQnO8QD9XEjNt4Szy4G51d3h5j1yPpIQLg3pGTSrLNRT9wDAe2ygQxMu9tbTfRw
 U3Z3siy0RY89J8SaXJ/qQBixXpzFMelrVvk0HyNUYwsGkZWPZ42zwRxJr3riSburqTcK
 oEP2XDs6+77IAzZa6BxrabtDGbsIUdpT3TcC4rc8BP5gv410vPycgIPW5sx/qSdWqNUA
 /5CAIJ93OhC5bVdLVNiX1SyUbpdUAnk4edc6FID5645jZiL7iEd5mbycVlhy1175qdPC
 O0/nUY6Kh4wnim7yZPn3omphD94XRJgm7ymGOlSTonoq+J68yoOiFXGr8i2lGp3C2u9J
 3s7Q==
X-Gm-Message-State: AOAM530LnHxj411Y8net47M2UT2mme9Pi/pddQPXbgQfX0ZKy6vD0dxH
 XA801pYL0SJVqx5UXExDgFZCQkDYqMC2wr4b
X-Google-Smtp-Source: ABdhPJxIMiqxATGvTOr86AG6ykZAOBDBLTkyQL7J/MbOtaoovE9pD/p8neLPuJf1skWGy+umcJEP0A==
X-Received: by 2002:a17:906:494:: with SMTP id
 f20mr29041241eja.285.1602528983629; 
 Mon, 12 Oct 2020 11:56:23 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
 by smtp.gmail.com with ESMTPSA id e2sm11063637ejd.81.2020.10.12.11.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 11:56:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 20:56:21 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BHR8+bE14dM3EZ4Z5jSujz12jxQCFTku_4rV6n2b_kDA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010122053210.17866@felia>
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
 <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
 <alpine.DEB.2.21.2010111937100.5535@felia>
 <CABJPP5BvD-6QZ_tbFcTyRmBq_w8NES9v528Q3PeA9w8y0-nznQ@mail.gmail.com>
 <CABJPP5BHR8+bE14dM3EZ4Z5jSujz12jxQCFTku_4rV6n2b_kDA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
 exceptions to repeated word check
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

> On Sun, Oct 11, 2020 at 11:12 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Sun, Oct 11, 2020 at 11:07 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > >
> > >
> > > On Sun, 11 Oct 2020, Dwaipayan Ray wrote:
> > >
> > > > On Sun, Oct 11, 2020 at 12:14 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > > > >
> > > > > The repeated word check generated false positives for
> > > > > the following pattern:
> > > > >
> > > > > "git git://..."
> > > > >
> > > > > This resulted in lots of warnings in the MAINTAINERS file
> > > > > which shouldn't have been generated.
> > > > >
> > > > > Fixed this issue by adding "git" to the exception list
> > > > > for repeated word check.
> > > > >
> > > > > In addition, modified $word_pattern to capture words which
> > > > > may contain a single letter like "a".
> > > > > This ensures that repeated word warning in cases like
> > > > > "This is a a repetition" are also generated.
> > > > >
> > > > > Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
> > > > >
> > > > > Suggested-by: Joe Perches <joe@perches.com>
> > > > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > > > ---
> > > > >  scripts/checkpatch.pl | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > index 124ff9432b51..0ef75d2fb5cf 100755
> > > > > --- a/scripts/checkpatch.pl
> > > > > +++ b/scripts/checkpatch.pl
> > > > > @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
> > > > >         ["__ATTR", 2],
> > > > >  );
> > > > >
> > > > > -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > > > > +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
> > > > >
> > > > >  #Create a search pattern for all these functions to speed up a loop below
> > > > >  our $mode_perms_search = "";
> > > > > @@ -3364,7 +3364,7 @@ sub process {
> > > > >                                 }
> > > > >
> > > > >                                 next if ($first ne $second);
> > > > > -                               next if ($first eq 'long');
> > > > > +                               next if ($first =~ /(?:long|git)$/);
> > > > >
> > > > >                                 if (WARN("REPEATED_WORD",
> > > > >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > > > One more additional improvement to this would be to make
> > > > comparison case neutral.
> > > >
> > > > Like:
> > > >
> > > >  -  next if ($first ne $second);
> > > > +  next if (lc($first) ne lc($second));
> > > >
> > > > What do you think?
> > > >
> > >
> > > Sounds good. Please evaluate though. Then, we can really judge better.
> > >
> >
> > Sure, I will run both the evaluations:
> > 1) For case insenstitive matching
> > 2) For single letter words
> >
> > Thanks,
> > Dwaipayan.
> 
> I did run an evaulation for the single letter case
> and though it caught one of the lurking 'a's, like in:
> 
> commit 8d90822643ad ("crypto: engine - support for batch requests")
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'a'
> #53: FILE: crypto/crypto_engine.c:472:
> + * @cbk_do_batch: pointer to a callback function to be invoked when executing a
> + *                a batch of requests.
> 
> 
> But yikes, it introduced new false positive:
> 
> commit 6514b25d3fba ("lpfc: Refactor Send LS Request support")
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'x'
> #156: FILE: drivers/scsi/lpfc/lpfc_nvme.c:614:
> + "Data: x%x x%x  rc x%x\n",
> 
> It's probably a bad idea to allow single lettered checking. :-[
>

Yeah, I feared that...

I agree single letter checking is probably not a good idea if we do not 
refine that even more.

Maybe, we put that aside for now and look at other potential improvements.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
