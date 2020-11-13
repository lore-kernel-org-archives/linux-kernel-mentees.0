Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6749CC55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:08:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FE622201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKA/i/ya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FE622201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0A892E248;
	Fri, 13 Nov 2020 15:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VL8edxctcN5A; Fri, 13 Nov 2020 15:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B107203DB;
	Fri, 13 Nov 2020 15:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 663DCC0FAA;
	Fri, 13 Nov 2020 15:08:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55999C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E1E2874DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zy4iH5XOeQ6X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B37C7874D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:08:40 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v144so14212433lfa.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGwVdhfGcvEmkdbFGAAQ61slya8H21zM/TxBTsp4bmQ=;
 b=UKA/i/yaQnCfreh4DHUnB2gEWyAePwkaJJ7TD82bCeCH4H57HZbdwoNhNH91isW+ib
 bS+NW4a0xgX2xSkWCAxCvMX6spK+zyDmVPeL+hQRDs6VRoJbVnuNmwCU/ZvzAtK67jwa
 Ds3tQghul4J/kI83FXV8MFiwCxNgMPCKGCck30j76vKCuST5Aj7mxJZNWrb+toIlrXGa
 kz+/LeHVJvl/YlpxTupN5DWZnuxL/lnlAvS+xxg0bZnMZiGiiGz7kksRQ5Ba2u1513bV
 l/v3R4HAkA+PWPuYpLnJnoHCv+Xkhv8tjdnXS1ffMVlL5k8j03nMaLv6SLjlkxtwsF82
 Hspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGwVdhfGcvEmkdbFGAAQ61slya8H21zM/TxBTsp4bmQ=;
 b=Xa/TjSjpiPVfGcP0TvNGSaoOUQMFvGw7KptbSSWk3IMq34rIqjxX+UzCyrRWtbZd/r
 RUrEQnvGE5PNz8q6eSrqIDcScILRRnTZRf/scypeS5slQwRdHm0ky6JRwNJzpDvFpT7Q
 q1g2vNBzkUOKwkDGuhfZWmMpuvryYOqLrDAjNG3r0cH9NnXRvhBpi1xkOtU2TBpMESfs
 YVidp5APKltYbRSSVzoifw3prTkttUJI9y2AxYUGrVxIGr/GyIHFu5cFWKyeldfm0i6f
 /ootvUCmQ9EqH1Cmj2BqOYiwHbiAMNE1rq/bEqvcTsrNctNFnp2uTcnKVNps5FSKhL9K
 ugTQ==
X-Gm-Message-State: AOAM533ygBL4HjJjHHjE5nA7I7agGqBwIlVp2Oiz5ogi5NK3LqHECxza
 xX72tQWYSb/sb3toYpv0+YWXk0gB8s88mWjtySURT3Vb3qf62Q==
X-Google-Smtp-Source: ABdhPJy6mLMMN5UtXzcyMwT25QN7J5QiX3HYzjM1FDbL76I9MMKAEc9dxKmj/EVkK/dlyTMJXgxdvbOIIqS3VX4K2z0=
X-Received: by 2002:a19:4890:: with SMTP id v138mr1059175lfa.254.1605280118638; 
 Fri, 13 Nov 2020 07:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113135739.46776-1-dwaipayanray1@gmail.com>
 <3a0455c93dfd6749cf2050dd973c5bee1cc9f237.camel@perches.com>
In-Reply-To: <3a0455c93dfd6749cf2050dd973c5bee1cc9f237.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 13 Nov 2020 20:38:07 +0530
Message-ID: <CABJPP5AVgXLh5-JmBX_hSjtP35ATHUR2T4Rt7pFhM+aZ0KmktQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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

On Fri, Nov 13, 2020 at 8:30 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2020-11-13 at 19:27 +0530, Dwaipayan Ray wrote:
> > Delete repeated word in scripts/checkpatch.pl:
> > "are are" -> "are"
> >
> > Fix typos:
> > "commments" -> "comments"
> > "falsly" -> "falsely"
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
>
> style: this should have subject prefix:
>
> "[PATCH V2] checkpatch: Fix spelling errors and remove repeated word"
>
> And here below the --- line you should add a V2 changelog like:
>
> o Add correction for falsly
>
> Other than that, you might consider sending a V3 just to get
> used the proper patch resubmission form but thanks.
>

Thanks, I will do that.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
