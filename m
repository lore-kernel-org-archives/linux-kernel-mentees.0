Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C13C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:45:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA972225E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 18:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gozNiFyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CA972225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E1E98204A5;
	Wed, 18 Nov 2020 18:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyQCx+gZNVvv; Wed, 18 Nov 2020 18:45:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 569A4203EF;
	Wed, 18 Nov 2020 18:45:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A620C0891;
	Wed, 18 Nov 2020 18:45:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D201EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B862685F68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VelL4c99f1YE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:45:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DD8E085F50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 18:45:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d17so4434935lfq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Ug/4t0fM3pIpIAub0llFf/8Xaf+lcT8t0V5wPmfAso=;
 b=gozNiFyAIAeRymxxB2sVP7pZY8eXn6i0bdSQC8BcSw0/V9sD0rco8VOu8rAfHq856s
 FS7XgqgNE5LAUWeqGVJ1kyBw+Rx60wcQWaM4w95Ezodmdv8I9fCy6cCnCJu4IY2U6dYM
 lTIff9uLe3QqN7HOVkX7br/nHmMdzFZrP4qxGlDsPulFA6SSmKj8l1B29++6FFJDIQ6K
 NejhrhI/QP18FDOC4UryKrGgY+nZV/HxNjfxI1mlQMB8Szo+EQ9/l4Xur+JKDVYs6FJB
 AthANSgXoOf0jTu6kB4dgM4W1i9Nq76zmxJikCxqTML0qTijsecgIpw34B1i+oYPWPqJ
 yNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Ug/4t0fM3pIpIAub0llFf/8Xaf+lcT8t0V5wPmfAso=;
 b=Q3uUAyrJCqgDvSxRrHhNV4gczvhcU/2hzQylHR28gg5PzW1F8lGN2csDmfHrhPyn2N
 +l2jbJP/6osjTZYPZozzDew9bBPKKsB//wFqYwBzsjz/3cjLyFlVeiHMyhbycpiSttqh
 GYCKDxLz2G7V5Is1BmVeqUtoGIJJGaCQkU5SGL0+8Td4mZGbMtuMvQ9THZcKlCggehJj
 6SCcsy9VKZxsr7YACfR8C8Z8yxTbqOO4F8szLK3B49ca6G1qxCQ7579MCNlVcFvqY1iI
 Ly1MxZdfyqUL/8H2PT2FQGHgUuYJ85IF5e05gQw7EhC8aWybCLsMtK+mHXFh/tcjD10s
 ZhIw==
X-Gm-Message-State: AOAM531maKvZKFapKVER//g2LpbdKeTNYxyfWMboYX51xpxVutUVbWFi
 A0FKcsNYkyPKb828vRI0elR1dgk8OtbVLT73r7U=
X-Google-Smtp-Source: ABdhPJypgN7nclvX8BPdMcWzPn6z4X/5N660ZKeA+awwd0+ULJzwVj2KkHQCcdQihNEuiqmOxl1AaV78nbNmHuOXWhU=
X-Received: by 2002:a19:4147:: with SMTP id o68mr4454498lfa.365.1605725149965; 
 Wed, 18 Nov 2020 10:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20201118124035.96976-1-dwaipayanray1@gmail.com>
 <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
 <CABJPP5CqKjY3_mfkJEsHX_8Zc7q1TRCgA4T54sTEZBiKgPS+OQ@mail.gmail.com>
 <754e240d1c88274ce2d94a5b6dbcfff1cc8c9508.camel@perches.com>
In-Reply-To: <754e240d1c88274ce2d94a5b6dbcfff1cc8c9508.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 00:15:19 +0530
Message-ID: <CABJPP5CHofzA46FHe3eJrgjQBTcaoCkR=dc29xxK80oFZJVfoQ@mail.gmail.com>
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

On Thu, Nov 19, 2020 at 12:09 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-11-19 at 00:03 +0530, Dwaipayan Ray wrote:
> > On Wed, Nov 18, 2020 at 11:44 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Wed, 2020-11-18 at 18:10 +0530, Dwaipayan Ray wrote:
> > > > Brace style misuses of the following types are now
> > > > corrected:
> > > []
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > []
> > > > @@ -3937,9 +3937,23 @@ sub process {
> > > >                       #print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
> > > >
> > > >
> > > >                       if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
> > > > -                             ERROR("OPEN_BRACE",
> > > > -                                   "that open brace { should be on the previous line\n" .
> > > > -                                     "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
> > > > +                             if (ERROR("OPEN_BRACE",
> > > > +                                       "that open brace { should be on the previous line\n" .
> > > > +                                             "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n") &&
> > > > +                                 $fix) {
> > > > +                                     my $line1 = $rawlines[$ctx_ln - 2];
> > >
> > > How are you sure that in a patch context this line always starts with /^\+/ ?
> >
> > Hi,
> > I followed it from the other fixes for OPEN_BRACE which were already
> > there. In the patch context if the lines are added then only I think the fix
> > should be triggered. Other instances should not be modified.
>
> As far as I know there are no existing uses of --fix with OPEN_BRACE.
>

I think you added it via 8d1824780f2f1 ("checkpatch: add --fix option
for a couple OPEN_BRACE misuses")

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
