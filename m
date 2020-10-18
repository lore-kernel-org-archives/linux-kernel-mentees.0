Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A2BC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 16:51:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09CD92223F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 16:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVmfFn6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09CD92223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B663C86EE8;
	Sun, 18 Oct 2020 16:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p69yyCHkMqie; Sun, 18 Oct 2020 16:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4101786E65;
	Sun, 18 Oct 2020 16:51:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23BD3C088B;
	Sun, 18 Oct 2020 16:51:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6522C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B69EA228CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 16:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYJQWQyDZaHW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 16:51:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id D968E228AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 16:51:21 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u127so556362oib.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xbr1iyCmVHPM8Z+0u2tLKLLy6qAswXo6NMqrcz7V/s=;
 b=bVmfFn6awNB2/CzdrTTm8RdDtSDSR1opWIX65757pAPRZOR2YjHuhqFxHX8hb8fIYE
 8JuBeBOMUPZYPL6S5zDmexyXyLkcGeRph0QvN24V7R2V14hXZNAX1hzdFe4mMtTih9av
 jYgBE8RkfkUCb7IgAOsT8rrHBLAkbuv32059BgeNWiuJ1odC5+DV2Nxnv6GbNdlR5dlv
 4evZxNC4MgD6YqEWntQBJ3hqUnAmoxyuf4XmW5sVEJkgG6E8hSuMZYLbGBkObAaeI6Zu
 pFtbv9vaEzeEulumMjhigOI0KwFaU2ctt4dTg34JvI29Tr8NMEFqOusLbG3xLdAEZeLP
 z5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xbr1iyCmVHPM8Z+0u2tLKLLy6qAswXo6NMqrcz7V/s=;
 b=tp+hEyspJ3pK4fgnHJ00L10CW6ti+f4Vdjag/NjCQGhDqODdUFTcl2Fqa0CYwspmsR
 xmDbhqFKQ4ZWP0H+5sYhKrF04vdwdUXlZs0VieFPdGlyYAKw8WXuS+PQ2ewWrnYn20bw
 ZQR9IbtpmEf0huGcIodogY7li/uFVTiEcd8MsDjVJRv/C+maGHyuY2GNg84sm4NPe76q
 N+42vCWWfwDyHJRNqf7KCF3Fr/PWl8/+bejhQFqgcS5mj6vymsjTIRS0KyIaGFqzqAXa
 KFDl4Jit+vWotvlwoPmrLO7fSOQa9uPbYS8+uqbVtZI1qHTTL6kkMAonOyo9fpY66fcN
 0AHA==
X-Gm-Message-State: AOAM531SjiMFvzLuKTsZKFvwK4j5pX5W2nSV6/qECDBiJ8BTOb1ZPIbq
 q1gZkBrLRg1vUB1QS7iICgTjwWCwei/849svN1g=
X-Google-Smtp-Source: ABdhPJyhWxhBMikpLU46CQ8PBjaY8lh36ICXoqo8ZC1BdgFdxeS4VGUomctZm0OHXL2F63/qOB1raHyV8+QYoHdebzc=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr8910518oig.74.1603039880960; 
 Sun, 18 Oct 2020 09:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
 <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
 <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
 <eda7a64b4af42ba1fb66a5b3704780cf3f761951.camel@perches.com>
 <CABJPP5Cr3giDJkJvBDd62iwx6y6r1dFhaVXp9jYXS8Y6k9b09A@mail.gmail.com>
 <e417e506c23ad56b2618204071c86e8a6ec2cb85.camel@perches.com>
In-Reply-To: <e417e506c23ad56b2618204071c86e8a6ec2cb85.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 18 Oct 2020 22:20:53 +0530
Message-ID: <CABJPP5CPgT4VHP9-xiWNVbPDVjDykPsE4kWTFgDmzp553H3o8Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sun, Oct 18, 2020 at 12:41 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-10-18 at 12:10 +0530, Dwaipayan Ray wrote:
> > print index(" \t.,;?!", '');
> >
> > It output 0 in my case. So last words on a line seems to work.
> > I don't know if this changes with the perl version though.
> >
> > So given this, will it be necessary to change end_char to ' ' ?
> > or perhaps change both start_char and end_char to a ' ' to maintain
> > uniformity?
>
> It seems it's fine even back to perl 5.6, so it's fine as is.
>
> cheers, Joe
>
Okay thanks!
Please let me know if any other change is needed
or if it's good to go.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
