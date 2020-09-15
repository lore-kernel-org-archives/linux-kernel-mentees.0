Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE51C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 12:49:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D922F20756
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 12:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vEGlz/Vo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D922F20756
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FC0E85899;
	Tue, 15 Sep 2020 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FT1BgYc6twF; Tue, 15 Sep 2020 12:49:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 160F0857EB;
	Tue, 15 Sep 2020 12:49:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F18F8C0859;
	Tue, 15 Sep 2020 12:49:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01289C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E495187132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWwGmJ6TR0Yh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:49:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 488248712F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:49:55 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q5so4051559qkc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/rqk4btKCkY4JoCQrSEr1sesJ1sw+u03C/QV7eApx4U=;
 b=vEGlz/Vox7qPGTQVgpE+OSQ5Ywutd0QN4aVlFh8IoNfiXDvBjDiJmoWTew0RCZjggt
 0F5c5e4rc8ntBKiCCRTCsYUBAO4hDWJNTZrtfPiVNF4ALnJ7wTY8PYmiebnpC4G7lq3h
 deD+yColzfIhkqCGLK3tu+SxvlD8RtRjrmJwQL2jCBMdxz4kNGeWl8jCjx4JzQBQZ9Ax
 Zogiujh2as95ifk5hSroq667HulPWmmPQCTNNgXmtQvaJiu/t68sn66UDfLVU6iDJ9HR
 teN6WdpASvMbso2cv5Yimyh3415Yx0YVR2UFKUdNQSgMNnr7Ot+PGkHiwuvLhsNkQ3zY
 iX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/rqk4btKCkY4JoCQrSEr1sesJ1sw+u03C/QV7eApx4U=;
 b=E3FqrHwJ/84GAJwg0ncVvBXpSJdSel8U17IarFy6Rh8/Omsy4KQg1sV6Uy+JD8d0YY
 a9zsrRzx2mR+Xs+sIeVLUdYj9xp5aPiqOXwQtCky9C+r0CkS+tpXjEOzRzMx7g3kiupw
 i0ijoAkL3CIS4kmkMa8OGMbIrE71NBk27gzZXzBTSsB9Q1lyIyvCY0z2V6xFoY2shSSB
 D8mo/5U9pdHyG6YlggA+lgXG9PV2WdvqfxvbzEhz5OwSTcj43hh0BWWF177RLeJmSIUd
 +w/TARuuwpAfjqf9fnyy5XAwx5AaSI4Bvj0FgXicXrvqZPJ+Gzw4jY23UxAojYmHmVzV
 Lzpg==
X-Gm-Message-State: AOAM531g55uEpAagPDj8YjhYwuKK8eLQW6vJUJ0mutOvoLO9J3PCwbBU
 pdepPcop/i4BROag6DAbfXuHFOK+FxhV9SGK9oFeUme2BD+deQ==
X-Google-Smtp-Source: ABdhPJwccDk3Lm5tJ9pZWA9SW4ll3bzvT4075Qvz3Cv27+CMnGOXR2Di8fmU22lCWDaj0Pi0I/aLwaHqvGX65L0MghA=
X-Received: by 2002:ac8:bc9:: with SMTP id p9mr5593470qti.50.1600173732186;
 Tue, 15 Sep 2020 05:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
In-Reply-To: <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
Date: Tue, 15 Sep 2020 14:42:00 +0200
Message-ID: <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Question regarding marking bugs as
	"invalid"
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Sep 15, 2020 at 2:03 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 1:52 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> >
> > Hi,
> >
> > Is it correct to mark bugs as "invalid" if they have reproducers but
> > the reproducer doesn't trigger any issue on testing current status? If
> > not, then what should be done about such bugs?
> >
> > Thanks & Regards,
> > Himadri
> >
>
> Himadri,
>
> if possible try to determine which commit fixed the issue the
> reproducer triggered.
>
> You can potentially bisect with the reproducer on the git history or
> you can simply look in the git log of the affected files if someone
> mentioned fixing something related to the trigger.
>
> That helps to make sure we do not just close reproducers that just
> need a lot of time, configuration or luck to hit a certain crash.


Hi Himadri,

Basically what Lukas said.
Bulk closing all of them as "invalid" would be bad for several
reasons. Either do some reasonable amount of degging, or wait for
syzbot fix bisection, maybe it will shed some light. It should happen
after 30 days since last crash IIRC. Also all testing requests/results
are shown on the dashboard, so this bit of information is not lost.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
