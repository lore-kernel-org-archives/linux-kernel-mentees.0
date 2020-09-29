Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E718C47420
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 07:59:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A632075F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 07:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm+pczwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80A632075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06C3E85DDB;
	Tue, 29 Sep 2020 07:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnD0em0a4dEl; Tue, 29 Sep 2020 07:59:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32FFB85BD1;
	Tue, 29 Sep 2020 07:59:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7D0C0890;
	Tue, 29 Sep 2020 07:59:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C552C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 07:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6B7BD870A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 07:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0okeyDGFJaH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 07:59:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 625ED870A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 07:59:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k15so4197879wrn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=HGDXJw5WL67NWeh5XyNiz3vY6XiSpHla8dATd8TYXyI=;
 b=gm+pczwGSYr8Kf++twN2OgyERbXHK8WotMxnklAE7ILPnsqji+tQavkiglIWHQkrWI
 vuioa87WNYsE2UNLyq1BNk2iLjWWsGmc7LTbP+murhsNPBn7jrCPjMnylRzjUusg4UW5
 Gzv/NGVgsX3gmloGto/hS6lzxFgJjjp9vk7PYoyOmygw873msEFTG3dMj2fwn6O336rg
 5Sdy97EK4PYST3Lze+GakMO9Ci6oVGIgt2Osd5q7duK8RnQxXy1uXLWkLYj5Lij5KxwZ
 S75uEIpcKatod8sRQ7bc/metGxYoDoMzHSeCt2cdPG+TKsoEVjqOOMYmA691Yvxyqq/+
 l8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=HGDXJw5WL67NWeh5XyNiz3vY6XiSpHla8dATd8TYXyI=;
 b=SBYf++lnhgxGDTnIUUSYF3CTF0vQOn2/e1kpK5y7mQMPGvBepOWaQ5LmtMCIjUNLpG
 OuH80OkgjdSqa2r/iSZN345LxptKM58NZUWAs3cBcsJ39AL8SYcj2n6WAv06w3j2AeSW
 M5ilfXLqFUEXK+TN/N+kP5yAIrufz3UxSitoXDVb7MgDNKVloNuq8Hjj81O/FyACA98p
 xfbg60sZBnOOH6SypwW/x3JH6VngIC6AdMkhQe8WBNZSa8x5/KtmZlsCufrdjxiYxMqW
 fH89z/uV0H59roJMdbomwUYjuo0YnvaTCJw2Kf0yOx9fe0tav02UiV+ncf7tKjCjVdOC
 DkIg==
X-Gm-Message-State: AOAM531IYT/MSiQPKiKntQGfxbWy3F20lSUw+k5ipwg9PArz3RbmRUPE
 aAdBm28EjYDLER/OZr8L22M=
X-Google-Smtp-Source: ABdhPJxQ+dOhOYOE8+FcIpGD1qa6tjqbsr0C15Cw6ug0yOJVZ3tNaRZR+jShNPIF4Z0D9ZN6POPtxQ==
X-Received: by 2002:adf:e391:: with SMTP id e17mr2572570wrm.289.1601366339809; 
 Tue, 29 Sep 2020 00:58:59 -0700 (PDT)
Received: from felia ([2001:16b8:2d89:9100:1da1:773b:dbb4:3fc9])
 by smtp.gmail.com with ESMTPSA id p9sm1975484wmg.34.2020.09.29.00.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:58:59 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 29 Sep 2020 09:58:46 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5DCnie+iLeeu0hVgvaVsOPk2fX9K59hLdhKO+SzoCJOQQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009290943540.17656@felia>
References: <CABJPP5D=q865sMYM768=qyY-gavG3VEyT4X1qGLsPT9umkTE8Q@mail.gmail.com>
 <alpine.DEB.2.21.2009281805030.4154@felia>
 <CABJPP5DCnie+iLeeu0hVgvaVsOPk2fX9K59hLdhKO+SzoCJOQQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
 MULTISTATEMENT_MACRO_USE_DO_WHILE issues
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



On Mon, 28 Sep 2020, Dwaipayan Ray wrote:

> On Mon, Sep 28, 2020 at 9:44 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Mon, 28 Sep 2020, Dwaipayan Ray wrote:
> >
> > > Hi,
> > > Checkpatch seems to generate some false positives on
> > > certain macros.
> > >
> > > For example running checkpatch on (kernel/trace/trace_export.c),
> > >
> > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > #49: FILE: kernel/trace/trace_export.c:49:
> > > +#define __field_packed(type, container, item) type item;
> > >
> > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > #52: FILE: kernel/trace/trace_export.c:52:
> > > +#define __array(type, item, size) type item[size];
> > >
> >
> > I guess checkpatch.pl detects the semicolon and thinks it must be two
> > statements. How about checking if the semicolon is actually followed by
> > anything or not?
> >
> > > and several other same errors.
> > >
> >
> > Are they all in one file or spread around in the kernel everywhere?
> >
> 
> Yes, there were all in the same file. I have to run checkpatch on other
> files extensively before I can confirm these issues exist elsewhere.
>

Okay, maybe I can support here with some local computing power from my 
side.
 
> But yes, checking for a semicolon followed by some characters
> does solve the problem, and changes the warning to a (Macros
> with complex values...).
>

Yes, unfortunately, macros with complex values is still wrong here...
 
> I do agree that such complex checks should be left to clang-format or
> likewise.
> 
> Not sure if it is worthwhile merging, but here goes the diff:
> 
> ---
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..8382977e95fd 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> 
> @@ -5351,7 +5367,7 @@ sub process {
>                                 if ($dstat =~ /^\s*if\b/) {
> 
> ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
>                                               "Macros starting with if
> should be enclosed by a do - while loop to avoid possible if/else
> logic defects\n" . "$herectx");
> -                               } elsif ($dstat =~ /;/) {
> +                               } elsif ($dstat =~ /;.+/) {
> 
> ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
>                                               "Macros with multiple
> statements should be enclosed in a do - while loop\n" . "$herectx");
>                                 } else {
> ---

How about sending a first proper commit at least here for the mentees?

I guess if we can run the checkpatch.pl evaluation on that commit, we can 
see and argue if that is worth the inclusion. I get that it solves the 
issues above, but it is tricky to say if something unrelated now is much 
worse...

A proper evaluation will show.


Lukas

> Thanks,
> Dwaipayan.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
