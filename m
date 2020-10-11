Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC37C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:37:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D0F1207EA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V84eJDO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D0F1207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E89B2204B0;
	Sun, 11 Oct 2020 17:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6p8Du4amT-OB; Sun, 11 Oct 2020 17:37:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DDF8C203D5;
	Sun, 11 Oct 2020 17:37:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7C81C07FF;
	Sun, 11 Oct 2020 17:37:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7182C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A550B87643
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eu8YNRM9BgPU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 636608762F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:37:50 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id u21so20095993eja.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cSJHAi1JLqx4UK/Sh6eZ+B3F2i+S/mhG/10y4OVkzWI=;
 b=V84eJDO/S01gvGB2L+5E1PHuKu7WvaRtekPpHBR0ax5mhxAN6dgqyfUyA+8qMuc+hV
 E8pu7EQAJLab53Dl7VYW7facC7FPUb5mZH8Vx2dvIZH1tzA2x6eU6ctOMvUMdds7tW6B
 WXc3qrV8+qqgMpDlb5NfLUNEMyqYFSNhvgu+5debHrNkg/LlYNFIOhYQ7O/zr51Fgo60
 tN2dxhAhvs1Ba/cKgZH7CdO//TAzDm7W4naBvLhXMTUYi++MheyHk0XkdzKBztckQmR6
 QFYOUrKTuJmGLNCfhV898oQ2OHMKUekukxIHDfxhnSMUlsmQ7Ofe21tx05X8jp0oMPFR
 YZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cSJHAi1JLqx4UK/Sh6eZ+B3F2i+S/mhG/10y4OVkzWI=;
 b=jZZs55/tBjnoGNzwsG5b3QWqBw9JMXMcU+Un8e43zLSrwEuaOm/ziBCAFIH2qGCnGV
 KJcftlji2t4XcARVzfmx++sAAjaogJj9g/eWPUFM/yFzf4PyJH2+iyOUl0k8ksbatNpD
 zrODiLXJILTcotpYCT1mZlNXZu+bRJW3+3UPpbe0QUBeTHe4ib8BEzY64xMauARwCewc
 pduy64ZUNcWZ55lkZmSPohZdML6X2RpP1yiVRrONmBxrKO4yB1AO64BdmCiZZLZCcQY8
 ChVxNtUCAm50atYi9GsbNZ0QpItpQg6oV1ffuSaEuUQYNpzcHtvObMjDNXcgPvh7X6es
 KnYA==
X-Gm-Message-State: AOAM531XrVTQMPcmsA2/Vu6eCl7/RG3CrNGyrDTzn+I7Lnl0sqedxUwh
 lwqwDXzbz3t9sxHDzlShb1Q=
X-Google-Smtp-Source: ABdhPJzSmdOTiQd7UyHt0YB3mcl/Ft4iyZ6s8C74KX/3xXgnl/vM5GvDsl3eCCIlrnmkwFdk0OKo9Q==
X-Received: by 2002:a17:906:48b:: with SMTP id
 f11mr25288146eja.293.1602437868614; 
 Sun, 11 Oct 2020 10:37:48 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:2e00:8422:c9cb:c3f7:9b2b])
 by smtp.gmail.com with ESMTPSA id b1sm9324841edr.51.2020.10.11.10.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 10:37:48 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 11 Oct 2020 19:37:47 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010111937100.5535@felia>
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
 <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
 exceptions to repeated word check
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



On Sun, 11 Oct 2020, Dwaipayan Ray wrote:

> On Sun, Oct 11, 2020 at 12:14 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > The repeated word check generated false positives for
> > the following pattern:
> >
> > "git git://..."
> >
> > This resulted in lots of warnings in the MAINTAINERS file
> > which shouldn't have been generated.
> >
> > Fixed this issue by adding "git" to the exception list
> > for repeated word check.
> >
> > In addition, modified $word_pattern to capture words which
> > may contain a single letter like "a".
> > This ensures that repeated word warning in cases like
> > "This is a a repetition" are also generated.
> >
> > Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
> >
> > Suggested-by: Joe Perches <joe@perches.com>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 124ff9432b51..0ef75d2fb5cf 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
> >         ["__ATTR", 2],
> >  );
> >
> > -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
> >
> >  #Create a search pattern for all these functions to speed up a loop below
> >  our $mode_perms_search = "";
> > @@ -3364,7 +3364,7 @@ sub process {
> >                                 }
> >
> >                                 next if ($first ne $second);
> > -                               next if ($first eq 'long');
> > +                               next if ($first =~ /(?:long|git)$/);
> >
> >                                 if (WARN("REPEATED_WORD",
> >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> > --
> > 2.27.0
> >
> 
> One more additional improvement to this would be to make
> comparison case neutral.
> 
> Like:
> 
>  -  next if ($first ne $second);
> +  next if (lc($first) ne lc($second));
> 
> What do you think?
> 

Sounds good. Please evaluate though. Then, we can really judge better.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
