Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F73C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 04:41:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F80120658
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 04:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYeGhjrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F80120658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBF0C87297;
	Sat,  7 Nov 2020 04:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXxpiqW6dj-F; Sat,  7 Nov 2020 04:41:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2352987160;
	Sat,  7 Nov 2020 04:41:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 091F2C0893;
	Sat,  7 Nov 2020 04:41:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 298FFC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 176142042C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Eu42XxnglGL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:41:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by silver.osuosl.org (Postfix) with ESMTPS id DE6DD203CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:41:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v18so3723865ljc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 20:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9FkVnNdE3X+MQNax0vO+HWVuHxylsA9O+a/7uBPt24=;
 b=GYeGhjrD6mZRRKLbSLxHz+c5Sbl2zXRzbdK6eJyv26goIqelUysR0ccTPZClsX5GqH
 j3B8MWPKPb9jgPBtIiFDKobo3cFqazE0RwbuLwc8J3ouR7wHptzRw5XkCOCngiGoAgRU
 GbNDV37hfuK34xwlIE6Qfw8qPueP0/NMs0nXLc69qRDVlvBWC7FhwPKSFzUhnY3UWCxy
 W+OipAxBKn1qGhaBGXaHGfTrkBrg/ijUwLYu1+JVHKN/YzkonDoV0C+/NizUGDsInOnT
 u56yr+ZF+vfurQMrnwqF+tX671TW3YSJX7KdDdjBxOciP+JF1NJ46zKMuHcbBAaFg9mm
 adMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9FkVnNdE3X+MQNax0vO+HWVuHxylsA9O+a/7uBPt24=;
 b=JqO9weJiLu26Pq0KQvwfVk1o4nxTgUyOPe/bCH4beCNpIQS+4pZxYjPXEyKQDCrxqi
 gRtoVn4w3JU1O22rT/bZg2KrMVac3tFRbFXALfl4351n1KyqtCArDLNyxLCVlL4ImBUV
 eXzEe89Bz07mpYqcdcYPbfTQekbe2uSNFm16S5EGKuFbs/T+w0osDVHeOn9vaf9UhSfQ
 uscFEIluOp/SwIvBK66g90HZ2qsCHwLQnoJXUZm186cmwoLbx38XUmL1HXzz25gA6nHL
 zf2X6xd4MmHDoAFvsCzIjSGQaX1WKQvPeul+O4mfcqoqCxg+iZn9HdC+hntaugGHfEpI
 1FCQ==
X-Gm-Message-State: AOAM5330UW9VwokvIcWa4GHnEvMHIe58Rh5nTTqSUKkd4HwVzkLABMV7
 3EdmVoecxff1w0yMdOJI+2fZAZya+guTgTYqnjk=
X-Google-Smtp-Source: ABdhPJz+oCoqOrW4p9s/8M/N4SaexLXsT2Mq4h6CG6Xj+x51vDC5wngGi3cT3MDcgswHf6IqW/ph/oNEFyUYJ+2dtDI=
X-Received: by 2002:a05:651c:cb:: with SMTP id
 11mr2043437ljr.159.1604724097606; 
 Fri, 06 Nov 2020 20:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20201106214530.367247-1-dwaipayanray1@gmail.com>
 <38c2889ad15c0f34ce8c223518f1f6dbc9945286.camel@perches.com>
In-Reply-To: <38c2889ad15c0f34ce8c223518f1f6dbc9945286.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 7 Nov 2020 10:11:07 +0530
Message-ID: <CABJPP5Dyc4iK-3f-N1eKF9sPZhpr6A92PA1rFo1rx+9qvO10zQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: improve email
	parsing
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

On Sat, Nov 7, 2020 at 3:34 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-11-07 at 03:15 +0530, Dwaipayan Ray wrote:
> > checkpatch doesn't report warnings for many common mistakes
> > in emails. Some of which are trailing commas and incorrect
> > use of email comments.
>
> Assuming it all works, this looks good.  I haven't tested it.
>
> How did you test the $fix bits?
>
Hi,
I actually dumped about 17k unique emails from git log, put it in one of
my previous patches, and ran checkpatch with --fix on it.
I checked the diff and most of the cases looked pretty good to me.
I could send the diff output if you like?

> Trivial notes:
>
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > +                             # stable@vger.kernel.org or stable@kernel.org shouldn't
> > +                             # have an email name. In addition commments should strictly
> > +                             # begin with a #
> > +                             if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/) {
>
> Likely better to test with a case insensitive match so
> STABLE@vger.kernel.org and such are still warned.

Sure, I will do that.
>
>                                 if ($email =~ /\bstable\@(?:vger\.)?kernel\.org\b/i) {
>
> > +                                     if ($sign_off =~ /cc:$/i && (($comment ne "" && $comment !~ /^#.+/) ||
> > +                                         ($email_name ne ""))) {
>
> || $sign_off !~ /^cc:/i ?

I actually had a doubt about that one. Only the stable address with
Cc: should be checked right? Or something else?

What about those stable addresses with tags other than Cc: ? Should
a change be suggested?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
