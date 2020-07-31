Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A08C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 07:05:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEAA20829
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 07:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezV+1aQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BEAA20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E7DE188702;
	Fri, 31 Jul 2020 07:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kttb9KH5Sqtc; Fri, 31 Jul 2020 07:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7CCC28861A;
	Fri, 31 Jul 2020 07:05:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69A0EC004F;
	Fri, 31 Jul 2020 07:05:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02D59C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D913F8862C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LtlS84xdoGw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:05:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B454C8861A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:05:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g19so3986289plq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qogj519tDPhVlnDqSFd2ylWvoTNUxXYt6MySeSAH02Y=;
 b=ezV+1aQEE0vLmyIrgfs9Ek7f9T/rdKwJX3gvyxvcHlPhb55VqDcZriBnN0dwMUezvv
 rAPivnjvWGXESDbmG1LVXge38S1Gyb8JnR6EDyZ3ySbyxSDVMAXhx19pp10cuFf8yoso
 smE1Tc6s40ZDl8L3VpsYdkc22N/ngBltadWX5chTgSExJYNzUw7vT7c2JV9CeXrfaPbs
 zyImDtHW002NC5bxRI3bfS7UXYmS1rK+BecEBKe+oTq6FTKeu56a4CJnaTzMPm943ydU
 8gJ2S8yC4L/JWoMYdlDiTnk870FTDVcTKairNMMxAkbqT/5wqbWaIX42xfGnAuoo57Kq
 H6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qogj519tDPhVlnDqSFd2ylWvoTNUxXYt6MySeSAH02Y=;
 b=BniuAo8TAnNI+L5THQCGkl3MRy6/d07LUinoUfiWHW+QBOUxd6rVvETqhkg5z6Rqqr
 noJFyOw625eQilY/q8f9lpsRwKMoyI8bkzsFYO/8gaQ3LAeQOiBvqvL5u3pG47sSd6sn
 KIoIn5+JNVGRPbT6uFa31E2GeRID2C1G9XEQgrO1NvRMIaUhTKGUBVZ+0UgHhhk8jwyn
 9bpi+RYOfcxjWRvSmoBntH2Il0rS/b7Gos+XPdrpGo8tGNx2PmaMUjPktR0WUPwHsv31
 Hh1gT4FULxE/fbcsYBPcEXnsVuw06HyIxLhJUoIvfh6QX7BZ+FYN8CAy9gbYsfi90VMp
 pUvw==
X-Gm-Message-State: AOAM533gm7+x/NWKlkjOZUrHUryyrmHQm7No8NHYQlbtI/vuEhReCwP0
 atg40gutzHgx+4+rCNOcvfUGNymSGzhh7AHv4IQ=
X-Google-Smtp-Source: ABdhPJw1K163hzWxoBsht0vngIzFQCrYy5PEp+QmbL3aRf0LXPKrg5RaismRTGmWXn2tmXlJSpxv02caa/DIGUcnu+o=
X-Received: by 2002:a62:158e:: with SMTP id 136mr2542352pfv.36.1596179121242; 
 Fri, 31 Jul 2020 00:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
 <CAHp75Vdr2HC_ogNhBCxxGut9=Z6pQMFiA0w-268OQv+5unYOTg@mail.gmail.com>
 <20200731070030.GJ75549@unreal>
In-Reply-To: <20200731070030.GJ75549@unreal>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jul 2020 10:05:04 +0300
Message-ID: <CAHp75VfZj4L6PJBbWi6wwMF2nucaxGjRLVvi-fTPSWxWvFE0TA@mail.gmail.com>
To: Leon Romanovsky <leon@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

Sakari, JFYI. I remember during some reviews we have a discussion
about {0} vs {} and surprisingly they are not an equivalent.

On Fri, Jul 31, 2020 at 10:00 AM Leon Romanovsky <leon@kernel.org> wrote:
> On Fri, Jul 31, 2020 at 09:29:27AM +0300, Andy Shevchenko wrote:
> > On Friday, July 31, 2020, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > wrote:
> > > On Fri, Jul 31, 2020 at 07:33:06AM +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Jul 31, 2020 at 07:53:01AM +0300, Leon Romanovsky wrote:
> > > > > On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:

...

> > > > > Of course, this is the difference between "{ 0 }" and "{}"
> > > initializations.
> > > >
> > > > Really?  Neither will handle structures with holes in it, try it and
> > > > see.
> >
> >
> > {} is a GCC extension, but I never thought it works differently.
>
> Yes, this is GCC extension and kernel relies on them very heavily.

I guess simple people who contribute to the kernel just haven't
realized (yet) that it's an extension and that's why we have plenty of
{} and {0} in the kernel.

> > > And if true, where in the C spec does it say that?


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
