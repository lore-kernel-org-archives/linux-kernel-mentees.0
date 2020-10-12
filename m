Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B8AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:35:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0726C20797
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxXaGvE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0726C20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB8A985F7B;
	Mon, 12 Oct 2020 18:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbZfoBOMWpxE; Mon, 12 Oct 2020 18:35:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F03C85F78;
	Mon, 12 Oct 2020 18:35:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D85B6C0052;
	Mon, 12 Oct 2020 18:35:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 360D3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 285E485F7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uwlg23tvCll6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:35:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 888A285F78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:35:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id x62so19661198oix.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zou4VugeCja1v2BRl6yfS3Mo1bfHXXD1PkUCjf6kwg0=;
 b=OxXaGvE2njzZ5A/dKCIJpeXMWx+oIV0qNP9MxxmumnFC6ORWxJ1+PQ6cUdEuA6ToOj
 qAbeS+O8vYF05WwonRFvPdROcdSOzhDvURwWkkyi9z+7PCLDGSRKU4/eB3Kk3aNqc14g
 txa9QkDoedOUAOFiiqvhRwn/566i2lVqG9n/WjE0Os36wTRETokRXXtiYJ9FGBn05Rzt
 6oyckz/lMTQU9mODKva1zSyeUW27IsaG99vSU9Kj3zVz1ve1+dBzz1rBAalNeVcHWnL0
 mr2OMvKxawpshiQz3CSrxNIJfzIeKq4B+xJdUknKiP3+HRPNKA6XXEkR2qw2fNglkSN5
 yfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zou4VugeCja1v2BRl6yfS3Mo1bfHXXD1PkUCjf6kwg0=;
 b=Nfy3PDO5UYY/mXlv9GRuzBJ+mMpHej8NVsDwrg/5F9EywQxyBEAPL1dmp/eIaMEuoe
 7n1Vurugt7tPqrAJ1bOt7kKnEJvnxSLGzrPOC2N6QmMbBLSEs1tpt+sAf5laEfJbXtxB
 PJ7x46myB3DY933tM4s3DSa8kamGA8sY6oeM+5RL7W7RrXCuNsC/HQfG5XeeHHPrjmfv
 Zz2nMEWOEqkjP3XHa5wYSTpz/9NqodYNcTz/c7PJH1+of+g/U5iMiUYGktnZXyZwZaWz
 kOZXh48gj6hrTqhRjjUxQU2zl+uuhlDRdk7dOJhEBAaky/kSVva59VtbGm03xvK3v4lc
 K6eA==
X-Gm-Message-State: AOAM532KFufC1oN/FZmnw0f0KqSo7enBWOMDjDppADOJ1IPAd+D/RzQp
 D+xZWJZNcS9BF5GdiPHD/C9MeP/EBu55JyugiUg=
X-Google-Smtp-Source: ABdhPJx2Abp7NN6jiltx7zIuCmlnGywl5fXTlxczbsCbyyg5CkXih/w5eGHVJOBJdmT7LRCjQnTSPPG65ujv/sZmIjQ=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr11588610oig.74.1602527708501; 
 Mon, 12 Oct 2020 11:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
 <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
 <alpine.DEB.2.21.2010111937100.5535@felia>
 <CABJPP5BvD-6QZ_tbFcTyRmBq_w8NES9v528Q3PeA9w8y0-nznQ@mail.gmail.com>
In-Reply-To: <CABJPP5BvD-6QZ_tbFcTyRmBq_w8NES9v528Q3PeA9w8y0-nznQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 13 Oct 2020 00:04:41 +0530
Message-ID: <CABJPP5BHR8+bE14dM3EZ4Z5jSujz12jxQCFTku_4rV6n2b_kDA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Sun, Oct 11, 2020 at 11:12 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sun, Oct 11, 2020 at 11:07 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Sun, 11 Oct 2020, Dwaipayan Ray wrote:
> >
> > > On Sun, Oct 11, 2020 at 12:14 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > > >
> > > > The repeated word check generated false positives for
> > > > the following pattern:
> > > >
> > > > "git git://..."
> > > >
> > > > This resulted in lots of warnings in the MAINTAINERS file
> > > > which shouldn't have been generated.
> > > >
> > > > Fixed this issue by adding "git" to the exception list
> > > > for repeated word check.
> > > >
> > > > In addition, modified $word_pattern to capture words which
> > > > may contain a single letter like "a".
> > > > This ensures that repeated word warning in cases like
> > > > "This is a a repetition" are also generated.
> > > >
> > > > Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
> > > >
> > > > Suggested-by: Joe Perches <joe@perches.com>
> > > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > > ---
> > > >  scripts/checkpatch.pl | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > index 124ff9432b51..0ef75d2fb5cf 100755
> > > > --- a/scripts/checkpatch.pl
> > > > +++ b/scripts/checkpatch.pl
> > > > @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
> > > >         ["__ATTR", 2],
> > > >  );
> > > >
> > > > -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > > > +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
> > > >
> > > >  #Create a search pattern for all these functions to speed up a loop below
> > > >  our $mode_perms_search = "";
> > > > @@ -3364,7 +3364,7 @@ sub process {
> > > >                                 }
> > > >
> > > >                                 next if ($first ne $second);
> > > > -                               next if ($first eq 'long');
> > > > +                               next if ($first =~ /(?:long|git)$/);
> > > >
> > > >                                 if (WARN("REPEATED_WORD",
> > > >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > One more additional improvement to this would be to make
> > > comparison case neutral.
> > >
> > > Like:
> > >
> > >  -  next if ($first ne $second);
> > > +  next if (lc($first) ne lc($second));
> > >
> > > What do you think?
> > >
> >
> > Sounds good. Please evaluate though. Then, we can really judge better.
> >
>
> Sure, I will run both the evaluations:
> 1) For case insenstitive matching
> 2) For single letter words
>
> Thanks,
> Dwaipayan.

I did run an evaulation for the single letter case
and though it caught one of the lurking 'a's, like in:

commit 8d90822643ad ("crypto: engine - support for batch requests")

WARNING:REPEATED_WORD: Possible repeated word: 'a'
#53: FILE: crypto/crypto_engine.c:472:
+ * @cbk_do_batch: pointer to a callback function to be invoked when executing a
+ *                a batch of requests.


But yikes, it introduced new false positive:

commit 6514b25d3fba ("lpfc: Refactor Send LS Request support")

WARNING:REPEATED_WORD: Possible repeated word: 'x'
#156: FILE: drivers/scsi/lpfc/lpfc_nvme.c:614:
+ "Data: x%x x%x  rc x%x\n",

It's probably a bad idea to allow single lettered checking. :-[

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
