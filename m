Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EB1C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:08:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4C42417E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm8eSJXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4C42417E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1009186101;
	Tue, 17 Nov 2020 09:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oygdLFUM62cG; Tue, 17 Nov 2020 09:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9068185CF2;
	Tue, 17 Nov 2020 09:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ADA8C0800;
	Tue, 17 Nov 2020 09:08:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE1E0C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B0948860FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXHL5WjzInyF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EDE0285CF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:08:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r17so22397610wrw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=w4Av8T9OgZxILV3isMPmRrxqdKu7Tuh1cAL0mq8mBiU=;
 b=Qm8eSJXpVHyK0GoS3uaTFKUko/kZd1MB/Tvo5Uxpp6gO5IMidrLd0ZMwqOvyHjZKv9
 AlcKBA36beh7hH79K4O92dIK26+LCsBgE0y0pOoMxj+tUwn38NF790xKgM6g3zLqaFZs
 5Qfjip8IEMsvvxWc/XRRZdQjMw4Dl3C7GKfzZwpD6RmyHkBRY+r8kb8kuRZYvExrvuvl
 3XKnRcXRvnBTfBsB69euXURlsFkmUb/MJ2mLcpJHMwl2XqLqcOAvEEXKkRNO/SQit2Ev
 twGgd+SDGDVI5M3stawM3oOiZ/GFPtPYLopgrB9cv4tns4p7SNOjqDBdp1zPTAq42pKN
 Lqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=w4Av8T9OgZxILV3isMPmRrxqdKu7Tuh1cAL0mq8mBiU=;
 b=ICZk/suTfnn10ts0IQ98Z6PqsU2xubj2SB97Z4zaItYojWc6xnAyrdo5jZOgChzIIs
 0R6Hbr0uuk7nWyCfSbRL/y6sEQfJVQjFxHNJDvRwHw3u+aGhNixawluYeEZiK4LysJZE
 6yqJmfDLpj+hWqHTFtv6xakGPN25hJKERgg8vzYNUapRIyjlQpf6wDiJjH2QPwSlHOIB
 F1SFWKmgXWqS8oVKHRwF2WtVp9dFssHHY18AmwmH7JaTwYBk0dnumssiloQF3IK21aMA
 d6yWXwCEf1Ixyw0To3s0iNaAqP+AEYSTXKLq5wNUvE3p0UVNDECBLt55Lk63+WltFdqZ
 7Z9g==
X-Gm-Message-State: AOAM531Z1HSzaZFZNFXxlAy58jxH+yMS86paIXyQXy/JqJCbNINp/m9a
 OqT72F1GHkzaVgeIc/S59a252Ux5NmDfkZXZ3KU=
X-Google-Smtp-Source: ABdhPJwTcK4+jOvTYrTPM9Ty5MwsiI5oKqG8Az0D/agKuzCvLa4r/SODKLSdJzuCcGcDv104VXt4yhHrA+2a+zpZ4U8=
X-Received: by 2002:a05:6000:1606:: with SMTP id
 u6mr24715611wrb.9.1605604089321; 
 Tue, 17 Nov 2020 01:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201115202928.81955-1-dwaipayanray1@gmail.com>
 <d3d6b68178b4193f04c35863163ce811a1571c0a.camel@perches.com>
 <67332536788cefbc39c7f87129adca462bb42fa5.camel@perches.com>
In-Reply-To: <67332536788cefbc39c7f87129adca462bb42fa5.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 17 Nov 2020 14:37:38 +0530
Message-ID: <CABJPP5CBccqvLVpzahMXhkuTt5Z+Gz-HaEGWgJdc4aMi4JsMEA@mail.gmail.com>
To: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix unescaped left
	brace
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

On Tue, Nov 17, 2020 at 4:32 AM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-11-15 at 19:43 -0800, Joe Perches wrote:
> > On Mon, 2020-11-16 at 01:59 +0530, Dwaipayan Ray wrote:
> > > There is an unescaped left brace in a regex in OPEN_BRACE
> > > check. This throws a runtime error when checkpatch is run
> > > with --fix flag and the OPEN_BRACE check is executed.
> > >
> > > Fix it by escaping the left brace.
> > >
> > > Fixes: 8d1824780f2f ("checkpatch: add --fix option for a couple OPEN_BRACE misuses")
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> >
> > Thanks Dwaipayan.
> >
> > Obviously that code path hasn't been tested in awhile.
> >
> > I think the notice to require an escape for a { was added back in
> > perl 5.16 or so.
>
> Just fyi:  it seems the requirement was actually implemented in perl 5.22
> and this code predates the release of perl 5.22
>
> https://github.com/Perl/perl5/blob/blead/pod/perl5220delta.pod
>
That's pretty interesting. Apart from that I have seen that
the perl_version_ok check mandates perl 5.10 which was
released more than 10 years back.

Do you think that check could be removed completely?
Maybe sometime in the future or just have it lay around
for backward compatibility?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
