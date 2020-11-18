Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45370C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:34:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D19D2076E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgkNLNcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D19D2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD55A844C9;
	Wed, 18 Nov 2020 18:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVqzHnrEZxgY; Wed, 18 Nov 2020 18:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D51AB844A0;
	Wed, 18 Nov 2020 18:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1AB2C0891;
	Wed, 18 Nov 2020 18:34:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4678CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CAD0C204A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UEhRG0xtaUt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:34:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id B1181203D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:34:31 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 74so4413653lfo.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O6Pr4KsX5I6OjoV/O+XnmJxxfakXMRzrCCZbtymxAyY=;
 b=DgkNLNcO1RLJwk9m3YOKJyfHXrmu2SzimggufjzxWH40vzwvdBmqiEdWVWs5LIV2hZ
 6m4deP7+BsCigur2P/hut8eIQNAti5cdRx0dUxbS1LKb5gtA/406E2AAhoS/AIpFTNP/
 O7bGYbS1kykGnsZh3zV/N3oNUtO7h0iT8M2LGoQ/WuTNHw0b0iLlJKgU0KY7hKUHefHG
 ALlf3WgFF2/l9eMNtNucSTKTVH2c0HGmaISCES4f+h4KvGtSc2Jlyq9BGiQXLF9rD09U
 E33tehClQcOZJHTxV1FMLq+yy0q0YoUC9gSSLTPrNn2RE5Wap09m6phQRHXVRYLFU2SM
 s3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O6Pr4KsX5I6OjoV/O+XnmJxxfakXMRzrCCZbtymxAyY=;
 b=BFC0FV/TF8Eztam/vS7XZ48NG9QK2haXGy3/zO6SUWiZIhVrtrzMvH5j5h4FfnTrWU
 ROuuPRjDIMUIWUwP2VtobC8FyxUi0KnOgGihIm2/dJxsHIWoDod0DfZKp0mw2N/mDVBE
 73oKg5xg/p4KcTWxsl/4iT6TGfeB/DQwuUDtjbkEwzUmysfXlX4GW9ADJtevlVVd9u8M
 wGTem54fhmuOdwxMXM8V5BuE9HVdqaZGAsCVFybWVbdipSWv/jlY4O3+Q+VvKGlt3gh5
 rTicojVoUqdwgFMFvV/uUZfi8c93ZVGf0hHqaqncrWDYCOc42j8Lun3wQd9r48hQdGyP
 xK5w==
X-Gm-Message-State: AOAM533sMeXFjgbWJN9YXCi/N96VVUO6yT/gq4K+1/sra/t2qWyo96gJ
 nkz3y+FFfMlsPrxLROLoYNW4cfghjmVseLMHWMA=
X-Google-Smtp-Source: ABdhPJxUQ/Y1xtlrn2AAPKoG862Lp1eEeGED2YqWBNkU3uR3d0YRuo1P6Zx/usyKuhoH6qf1x/bI1UqhgI6FLan5m6A=
X-Received: by 2002:ac2:598f:: with SMTP id w15mr3906570lfn.148.1605724469568; 
 Wed, 18 Nov 2020 10:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20201118124035.96976-1-dwaipayanray1@gmail.com>
 <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
In-Reply-To: <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 00:03:58 +0530
Message-ID: <CABJPP5CqKjY3_mfkJEsHX_8Zc7q1TRCgA4T54sTEZBiKgPS+OQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

On Wed, Nov 18, 2020 at 11:44 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-11-18 at 18:10 +0530, Dwaipayan Ray wrote:
> > Brace style misuses of the following types are now
> > corrected:
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3937,9 +3937,23 @@ sub process {
> >                       #print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
> >
> >
> >                       if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
> > -                             ERROR("OPEN_BRACE",
> > -                                   "that open brace { should be on the previous line\n" .
> > -                                     "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
> > +                             if (ERROR("OPEN_BRACE",
> > +                                       "that open brace { should be on the previous line\n" .
> > +                                             "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n") &&
> > +                                 $fix) {
> > +                                     my $line1 = $rawlines[$ctx_ln - 2];
>
> How are you sure that in a patch context this line always starts with /^\+/ ?

Hi,
I followed it from the other fixes for OPEN_BRACE which were already
there. In the patch context if the lines are added then only I think the fix
should be triggered. Other instances should not be modified.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
