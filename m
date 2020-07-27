Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5515FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:40:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27044206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV0QxcDh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27044206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CA56C20400;
	Mon, 27 Jul 2020 15:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1exsqyRSkLlu; Mon, 27 Jul 2020 15:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E2CB6203A4;
	Mon, 27 Jul 2020 15:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E21C0050;
	Mon, 27 Jul 2020 15:40:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE31EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DCCE785A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Zn6Frs8uoma
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 40CD485910
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:40:37 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id l6so15629894qkc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3MHzayRxL6bOiigyiJOXy0PhmCnVIol0KG4wc5+RCf8=;
 b=VV0QxcDhBbkfas2oiGVS1tvt5ESJqhpl67y4uGCMb2n8mBj4P/nU8cHUjPv/l76bU4
 gjETm59e+fdYBwoodcOoh5UBxu7PGmou3asy7AL7Er8fbs2atIxO53YJaHKqiHTjuDds
 uaaNWCmDvrjyoUO8wlSmU05OiMrdHR9gTE1KZHICoXD4hWPwF9ZOf0SEFlP8KbD3vDAO
 Kwvs3ocpCiWZTfN0OihoxC4jjfSlefzs0ztS9PBUMkSl/xIR2wpSHO70miNuSAGrRdPo
 J0lI1V2F7Z3w0wUZ+go35o8LtiBgZRBNNuTmpDojB8TO83eJEFKBkk7Xdc0hm62xdgoz
 /CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3MHzayRxL6bOiigyiJOXy0PhmCnVIol0KG4wc5+RCf8=;
 b=PGW+ihw4ogRFfbypzYur3BSAIvvb0A4FAIWnQrNg3+d6Aei2C04oKFrf0NA7fhXJgZ
 9TqPLJd1MgPi8a/eEhmt0Kw4Sjaqh8iaTLQi+KmCRD2exZtpYU1MjzBi57DDMa5TmdDc
 hGiLH6GVU3pHW9MQvCF/pNU8C3917PMBQp6rT2BDFwsrAi+IjZ7xJl5TZchapLojWy8t
 wRaxFaE7TQipQFfCcWyd8tTdh8zYmlguw9Mf6b4gApwjoISY/WSjORO3uJhFdcFQr+Mj
 SleD1PM4TNWXIUdzIUqd/O7wmlkan8rXla38cgQ+LfNZ4byqHPlSA10yr5/r25+xJdfv
 vqUw==
X-Gm-Message-State: AOAM532h5ymnuAFlM0+4gIT86nzFqdZnoYoyh2yMKwaYDdj5piUegbo5
 00N1AxRoTgODPWxpIWVCnA==
X-Google-Smtp-Source: ABdhPJz4p/ncsvcYlE0kBz7qziAGuqugFJvTZuwprUxKjrQU5gfYhHAMcIXMO2IekfmUlJxyg0HaEA==
X-Received: by 2002:a37:a655:: with SMTP id p82mr23048681qke.92.1595864436373; 
 Mon, 27 Jul 2020 08:40:36 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id 128sm17457791qkk.101.2020.07.27.08.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:40:35 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:40:33 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200727154033.GA315469@PWN>
References: <20200727151537.315023-1-yepeilin.cs@gmail.com>
 <CAK8P3a3zz-xfz2jwUpEU5R7GyCK735PFQK7OjFmmTESgnSzq=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3zz-xfz2jwUpEU5R7GyCK735PFQK7OjFmmTESgnSzq=Q@mail.gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] firewire: Prevent
 kernel-infoleak in ioctl_get_info()
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

On Mon, Jul 27, 2020 at 05:35:12PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 5:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > ioctl_get_info() is copying uninitialized stack memory to userspace due to
> > the compiler not initializing holes in statically allocated structures.
> > Fix it by initializing `event` using memset() in fill_bus_reset_event().
> >
> > Cc: stable@vger.kernel.org
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I would recommend always looking through the git history of the
> file to come up with an appropriate 'Fixes' tag. In this case
> 
> $ git log -p --follow drivers/firewire/core-cdev.c
> 
> searching for any mention of fill_bus_reset_event leads you to
> commit 344bbc4de14e.
> 
> In my ~/.gitconfig I have this alias:
> 
> [core]
>         abbrev = 12
> [alias]
>         fixes = show --format='Fixes: %h (\"%s\")' -s
> 
> With something like that, calling 'git fixes 344bbc4de14e' produces
> the line to copy:
> 
> Fixes: 344bbc4de14e ("firewire: Generalize get_config_rom to get_info.")

Thank you for the advice! Actually I did all of that (manually...) but
wasn't sure whether I should add it on. I will send a v2 soon, and do so
for future patches.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
