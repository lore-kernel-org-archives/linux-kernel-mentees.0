Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEF8C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 08:16:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E177207A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 08:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E177207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A4A086F95;
	Mon, 14 Dec 2020 08:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ft59CkMwFQij; Mon, 14 Dec 2020 08:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2C9B86F75;
	Mon, 14 Dec 2020 08:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDD98C0893;
	Mon, 14 Dec 2020 08:16:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB3B9C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B3F7B20455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOGYJMFMor-W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:16:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id B5A6B2035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:16:01 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id r24so27887931lfm.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 00:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEiE91xjRqboMrMOwQRljc3YWAqftJK41N5HKM4igOI=;
 b=qMC1JGRLHRSKZk7A0uPJZuKKHNe9dwIqCU8m2Aak3TIgIoCD+87Tw3UFPGaBxxsOTw
 gN8YsFgbapfW6ZJ+GYnIdg1M8tuCcDaFhabiy2Ov7KlZdf2gi7GetmqLOSVppOLTNly1
 7gQURnVyKGwgLn6qM74nyfDhiGWKc53k1BuU5gUTVVXpWNbVbF1lp2hHS3pYt15/jRuG
 19O4WXrLBL8VXGAJoT4ezEVxO+YYi0Krg4tUto6/Y9Ut5krgkXXGirnJ080BP2ESvBQb
 VEjDi8pWWL3dP0nTfatZJmUxrLh56+EHICVyDykQ/pwjL8EcZ2r76bj8rnyhubSmt4Sk
 sUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEiE91xjRqboMrMOwQRljc3YWAqftJK41N5HKM4igOI=;
 b=Ztg37cnwT1WMmkmFFbLJWpSAyokEQG3OYcZvSFYS0R96MpWetTPMQtilUam1WFi87o
 X/4xJoIgyZ5ZbfiBg37u0RxwZrWs4P8p4i50Gyk42D/N1JkERuZaTmv1+M/o7cwuWIYn
 uDpy2dPuxyf/Wp/qVfjao2MoGM1VPZ2qZsHMdY9HU/j5SnjMCnk4ehXzvXdaalcyLUoB
 WyPp7QeKi/fpCrOuCW+3JCdGJGoDgr0SnbwYnaruSFWpfrQiUVfSEAHN8bL/tL3JbH2+
 umxFqJkCiEq3ky1dMbhTvAKRxmQ0C9qw5U2o7YWHRevXv0onQQSLEuFF75FSj3KLCBaV
 LwKA==
X-Gm-Message-State: AOAM531SAJo3Sqo1Z1sTQhvJJxRSxVWIc/H91+sLfWYlmrUmGl7pmDJl
 lGtZFYQ26QN+PO3p3OOX323DYhftjhNJ/ETasCE=
X-Google-Smtp-Source: ABdhPJwDU7ibn9oG1GanMUbhBQ5WoLOAXgBhCIkuXq0Epl+FlNMWE81UC7IubVVxtXT8C1uF4Nr7AXKqhhTQVHc8twk=
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr5985963lfp.117.1607933759850; 
 Mon, 14 Dec 2020 00:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201214075831.34282-1-dwaipayanray1@gmail.com>
 <fa376fd6d0b70f98f1d52f61f2f35f5890ec7e81.camel@perches.com>
In-Reply-To: <fa376fd6d0b70f98f1d52f61f2f35f5890ec7e81.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Dec 2020 13:45:37 +0530
Message-ID: <CABJPP5Dn1+U_eqeJy+UARbRK5_Q3p8HCH_xERWZvxYifoX6brA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: add more corrections to
	spelling.txt
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

On Mon, Dec 14, 2020 at 1:39 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-12-14 at 13:28 +0530, Dwaipayan Ray wrote:
> > Analyzing misspellings over the past 10k commit messages,
> > a few more corrections are added to spelling.txt
>
> I don't agree with all of these.
>
> > diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> []
> > @@ -1253,6 +1260,7 @@ senarios||scenarios
> >  sentivite||sensitive
> >  separatly||separately
> >  sepcify||specify
> > +seperate||separate
> >  seperated||separated
> >  seperately||separately
> >  seperate||separate
>
> seperate is already here.
>
> > @@ -1482,6 +1493,8 @@ unuseful||useless
> >  unvalid||invalid
> >  upate||update
> >  upsupported||unsupported
> > +upto|| up to
>
> No space before correction
>
> > +uptodate||up-to-date
>
> This one is fairly commonly used as an identifier so it should not
> be added here.
>
> > @@ -1528,8 +1543,11 @@ wiil||will
> >  wirte||write
> >  withing||within
> >  wnat||want
> > +wont||won't
>
> wont is a properly spelled word and also should not be added here.
>

Okay thanks, will replace those.

Also please ignore the v2 of this patch. That was sent earlier your review.
I will send in a v3 to fix these.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
