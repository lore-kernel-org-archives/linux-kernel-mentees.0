Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24632C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 20:53:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E560F208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 20:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UZSCRrsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E560F208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B14E385683;
	Fri, 31 Jul 2020 20:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrobF0C9bj2z; Fri, 31 Jul 2020 20:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48EEB8561E;
	Fri, 31 Jul 2020 20:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25EF1C004F;
	Fri, 31 Jul 2020 20:53:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18323C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 20:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1A3A20487
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 20:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yocLfB0MrXvX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 20:53:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 7834D20455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 20:53:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m22so16629568pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASoX6rfz5bQ5FIRAlZmP6CuXAEI7tVxg2VHGvZXSf5k=;
 b=UZSCRrsNvb7U/6sNOg0nmvM1lhYADZr3xElqLrwf1FAjVXCKUcYXAIB3qluyiUZIIg
 s7Oq8+0gDmPXofchwzcv+GI6UllQAsKwyidQTh4v8czpYX2AUJdfxfRiODZQc/e25ejQ
 4xkCeSRR30UicbY7lFNufWjGwYcHhIMy9yOwjC08T0y9wWFOQaWiAPEVeC1DBxSGRrTm
 w4GiRFgXHOZATK+L7tbeqedgQNwoVvhpwp9oWpewbKI4GPB/NS3sCurlzLHWLrMQ+72B
 3IJyUAei30wFb/kjH1F2VtiY/FNEusyd293eHctGgBsM5yuvoG66Ry1nP3iXobG/XcmW
 Fr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASoX6rfz5bQ5FIRAlZmP6CuXAEI7tVxg2VHGvZXSf5k=;
 b=ToO2Lx/cFzET4/YDvAb1ATSfu8AaTKFh6PRWrzpeLPK+9SNO7i/loU9YcVGDB/7Zcp
 iUbvI3XQ/RFqVM7B5rWOLXPm3Aoy45LUWxQrg/t4JK2zuwiEARf3vZwCdXju1rT/0GSw
 9qb18WtjjzNd23xKM9p5aZT4IxsmT+DOtk8J7S7tWN96uRr1VPwVBYCHj7h7I/9vr+NJ
 IWYDCOyS2reQHczspgqE1eTt9XGRO5xqgtbxPX8UpNGmOJeOOVJjXN0BaeZNAlNAb2N3
 RXUmZHS2cFUZ6odJaME3MY37UPhqK4Ny1sj8cP0lCl8M5X4emPK20Cgr5+Hfc9bH69A1
 JGxg==
X-Gm-Message-State: AOAM531CcjDKvjrzcncZcm+5g79W3bypkky3V6xErvdt71K5ktNrYIkE
 E2EqqoMIwuH0hTQBYaNK9u7f0SG6C+QKj7qi/gdB0g==
X-Google-Smtp-Source: ABdhPJyGqtQD45YZn7SMj9UvX8QA2GrLrcjRcPgtKJyDQA1M9yb7pFOzWaaAvNB0t6w5NBwOk1uD61A2Sph/u4r9BdI=
X-Received: by 2002:a62:6484:: with SMTP id y126mr5561234pfb.166.1596228825718; 
 Fri, 31 Jul 2020 13:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200730121656.45302-1-98.arpi@gmail.com>
 <CAFd5g46wpYxF1=bs3LvXeVg6mPHrT6Ggp=QxScaf87O=yqcpBA@mail.gmail.com>
 <3aae0ade-1a61-5d28-94ee-6b0eee7c7be6@gmail.com>
In-Reply-To: <3aae0ade-1a61-5d28-94ee-6b0eee7c7be6@gmail.com>
Date: Fri, 31 Jul 2020 13:53:34 -0700
Message-ID: <CAFd5g46OBRKFbTAPgq63A5pTaL88D83NjuTP9vK_qwPFxBNBSg@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_uuid.c to KUnit
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 31, 2020 at 3:02 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> On 31/07/20 11:20 am, Brendan Higgins wrote:
> > On Thu, Jul 30, 2020 at 5:18 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >>
> >> Converts test lib/test_uuid.c to KUnit
> >
> > Can you add some more detail to the commit message? Maybe link to
> > KUnit and say something about why this change is beneficial.
> >
> Sure, I will make this change.
> >> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> >
> > Change mostly looks good to me.
> > Thank you for the review.
>
> On failure, the original test calls another function which prints a detailed error. I removed it when converting to KUnit. Is this required?

I think that's probably Andy's call. Do you mind calling out the
segment of code in question?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
