Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDE7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 22:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C16C60EB2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 22:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C16C60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FB383B75;
	Fri, 23 Jul 2021 22:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2q_Y0Brfs_1; Fri, 23 Jul 2021 22:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7000183B5E;
	Fri, 23 Jul 2021 22:22:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43A3BC001A;
	Fri, 23 Jul 2021 22:22:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0BD9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 22:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 957FA60A64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 22:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6Y8YoBRlcGt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 22:22:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9F2A60709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 22:22:14 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id e21so207824pla.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vYTn7+eGEI7Q1RMA/3vAFLMTCXFX8Sw72SaEzbA1bQ8=;
 b=V8v8yV910H1isJ5XsUEWBXTYWsOJ2rSQR7nS/ui+zSIfggH79Jz0nHagCxU0muqQcm
 JttIj9mM47GOQtuaCkUz0PdM6rv4stUaa5Gd+8SFgeaxz+uPcAmM1u2RuIlcbNy2pQUY
 MhkmLzKxElBo6mP+yWQljBaqw9zHg+M3fWs+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vYTn7+eGEI7Q1RMA/3vAFLMTCXFX8Sw72SaEzbA1bQ8=;
 b=iA/YE+ShtQIq3q0V8qNaqi21r8Odw5xV8+KWPGZmId764fne8SnCcU28HjEtY4SOPt
 lhp4PFv8wVYrg/VrMOqTr304UGB3biFk804+/Niecpjs0qFr6b0jyd/U/DIIxnRmL+lu
 OeRFrUvx55f0Dn4I/O9qE6CNaHI7ntqXjEG3b3Du4eAaUvIWsheWVTG1Ssf207SDQKSI
 X0ajGuIwzV9FGjmaTUjnXRxXvBYuwN5YTb0XaDmccA61dkiA2awgjnxQKF/SXlAVTqVd
 h8T0O4jQCWu+m9Z3mF3K/IW5yVAG4GbYorsZRmJquhYH2KcHPXVJ7kz6JC9ONgfF3XEt
 unmw==
X-Gm-Message-State: AOAM531EeO1J4utPoBPjXzYrE9MgWiNBDkFuJbb4u7UjY96n6INIl4lz
 /ALw2Rz+TKtpC8xbtq2EZkISHg==
X-Google-Smtp-Source: ABdhPJwGpoxHTO4J2/ehZrrS3qtHYMIaXCgBaMBERWm4W1J7IjUfFio6kzqtA0uhTGi9EX/Y5fMD9g==
X-Received: by 2002:a17:903:22ca:b029:12b:9109:4097 with SMTP id
 y10-20020a17090322cab029012b91094097mr5425468plg.54.1627078934265; 
 Fri, 23 Jul 2021 15:22:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z12sm28581207pjd.39.2021.07.23.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:22:13 -0700 (PDT)
Date: Fri, 23 Jul 2021 15:22:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
Message-ID: <202107231520.32B389411@keescook>
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <20200729115157.8519-1-yepeilin.cs@gmail.com>
 <20200729125820.GB1840@kadam>
 <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
 <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
 <202007301056.D3BD1805B0@keescook>
 <CAK8P3a2oUgdaYicdHwWvCY-HqjrcBAEzYA5yc5Gw14RLLoLdug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2oUgdaYicdHwWvCY-HqjrcBAEzYA5yc5Gw14RLLoLdug@mail.gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Denis Efremov <efremov@linux.com>, linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
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

On Thu, Jul 30, 2020 at 10:45:02PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 30, 2020 at 8:10 PM Kees Cook <keescook@chromium.org> wrote:
> > On Thu, Jul 30, 2020 at 10:11:07AM +0200, Arnd Bergmann wrote:
> >
> > test_stackinit.c intended to use six cases (where "full" is in the sense
> > of "all members are named", this is intentionally testing the behavior
> > of padding hole initialization):
> 
> Ok, so I read that correctly, thanks for confirming.
> 
> > >
> > >    struct test_big_hole var = *arg;
> >
> > So this one is a "whole structure copy" which I didn't have any tests
> > for, since I'd (perhaps inappropriately) assumed would be accomplished
> > with memcpy() internally, which means the incoming "*arg"'s padding holes
> > would be copied as-is. If the compiler is actually doing per-member copies
> > and leaving holes in "var" untouched, that's unexpected, so clearly that
> > needs to be added to test_stackinit.c! :)
> 
> For some reason I remembered this not turning into a memcpy()
> somewhere, but I can't reproduce it in any of my recent attempts,
> just like what Denis found.
> 
> > > or the a constructor like
> > >
> > >   struct test_big_hole var;
> > >   var = (struct test_big_hole){ .one = arg->one, .two=arg->two, .three
> > > = arg->three, .four = arg->four };
> > >
> > > Kees, do you know whether those two would behave differently?
> > > Would it make sense to also check for those, or am I perhaps
> > > misreading your code and it already gets checked?
> >
> > I *think* the above constructor would be covered under "full runtime
> > init", but it does also seem likely it would be handled similarly to
> > the "whole structure copy" in the previous example.
> 
> I would assume that at least with C99 it is more like the
> "whole structure copy", based on the standard language of
> 
>   "The value of the compound literal is that of an unnamed
>   object initialized by the initializer list. If the compound literal
>   occurs outside the body of a function, the object has static
>   storage duration; otherwise, it has automatic storage duration
>   associated with the enclosing block."
> 
> > I will go add more tests...
> 
> Thanks!

Well, nearly exactly a year later, I've finally done this. :P

https://lore.kernel.org/lkml/20210723221933.3431999-1-keescook@chromium.org

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
