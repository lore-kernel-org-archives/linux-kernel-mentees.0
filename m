Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6045C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 07:32:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F462076B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 07:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ1d0lUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F462076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4C0B86FE7;
	Wed, 23 Sep 2020 07:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTLOuWT-gjDL; Wed, 23 Sep 2020 07:32:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3553B86FC2;
	Wed, 23 Sep 2020 07:32:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BEAEC0889;
	Wed, 23 Sep 2020 07:32:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C7BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D5EE586FD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6Cih9ESsfYi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:32:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AA53D86FC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:32:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r7so26317557ejs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1fpFHUiEuEZZUwFnjHKUxoQTEm3kogaW5gMMPSd34tM=;
 b=HQ1d0lUB7Ey9DqKpfGbk+ByaQJDJjSjViUEZsTX7m4B5RhgbpHr44tfYIR6JXY7f3L
 Epdt5PxIowTVt2HCCMyjxMRcQ5PgzN8yClJbl5LV6lR5NcxXSW60LzPsJo6Alz3aWF6O
 rn36TaYXaSUXGqgrA8cwU0IbijF20uBbGn/qFAJckHkSVFO+SUxkGHBeMJ2y4EbIueAX
 tVQWDKV+0HabUzmR7qitLVW2nECE4/6MAPU3MXW5vZJHc2D3tJe40ovlMk8sYanY2zM+
 QPHK+Y6BRQ5L9D4P0rQSGcVRV6H3FeI7EF4QX6IgCK2Ph3ChnPuPvb8kGqPgXPiyybeS
 2cEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1fpFHUiEuEZZUwFnjHKUxoQTEm3kogaW5gMMPSd34tM=;
 b=oPR8RX4KwLAUKp+sRprimCwH9+lnXdRPVlqAZmE49/4fR9mu+hFfjNhUP5ZrTGDMse
 gkbqR9Qx3Enx0DMmdBdcygTtiOzasCNo8okbiJvVITQCqEzQY4kL2HTE8r4DzBq4fmNB
 G+GrDEmc4475LAvfkAvm1kz8lhuSm9roQN+mUyj4r6w4qZWjqJdNSpR4Thz8joj9igsm
 NQPznj4bLzcRPdaGwECfwM2VQ504LDl3pfZ+wXRARJzbx1RYOnAvRlEpspRimDsi9fv5
 EacxYxVd59lPpLM483geW1uwmDub+TmTeO0uirqXZZLiaDpxXhiGeXNb6dWlO1aXX/pT
 oKmg==
X-Gm-Message-State: AOAM531FKwYLJ6oU4NFilleXndcrl6QzobnnQNPZP5RYOWHYizlXEF20
 aOGGhbQ6bfACxyp7+KOF/tg=
X-Google-Smtp-Source: ABdhPJy+g03RiywDOW2HP3IuadmRH4uFMN9617dlnE4n4p2TBJ8TLtRNs6etRvZFqpXsmJsmUDrd0g==
X-Received: by 2002:a17:906:d78d:: with SMTP id
 pj13mr9197438ejb.15.1600846345149; 
 Wed, 23 Sep 2020 00:32:25 -0700 (PDT)
Received: from felia ([2001:16b8:2dcd:aa00:cae:324b:3a69:3822])
 by smtp.gmail.com with ESMTPSA id e15sm13058959eds.5.2020.09.23.00.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 00:32:24 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 23 Sep 2020 09:32:23 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009230925520.6068@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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



On Wed, 23 Sep 2020, Dwaipayan Ray wrote:

> >
> > Generally, I think it is a good first proof of concept.
> > I believe you that functionality 'basically' works; again, we might
> > already want to run a full-scale evaluation on that. Just to see
> > if there are some impacts we might not be aware of yet.
> >
> > As you already wrote, we, Joe, you and me, need to figure out
> > now all the further details:
> >
> > - how can we avoid the duplicate code in checkpatch.pl and
> > get_maintainers.pl?
> >
> > - what is performance impact, especially as AUTHOR_SIGN_OFF check is not
> > triggered often, and there are many other rules in checkpatch.pl?
> >
> > - further details, such as why do we need the lk_path is the first place?
> > and many more questions of that kind.
> >
> > Feel free to sketch a first commit message and create a PATCH RFC for the
> > discussion with Joe.
> >
> >
> > Lukas
> >
> 
> Hi,
> As for the lk_path, it can be removed easily. To me too, it didn't make much
> sense since it was just a duplicate, as $root should contain the same.
> 
> But again due to some reason,
> $root in checkpatch had the value ".",
> while $lk_path in get_maintainer had the value "./"
> 
> I have no idea yet if this was a design decision or just different handling.
> 
> So, I can change the part where I referenced the mailmap file by adding
> a trailing / with $root rather than $lk_path. That should do it.
> 
> And for the duplicate code part, Joe did mention that either I could copy
> or place the read_mailmap code in a separate file and reference both
> checkpatch and get_maintainers from there.
> 
> To me, copying seems much feasible because the referenced part of the
> mailmap handling code here is very small as there are some minor
> changes.
>

Well, if you can argue copying code, it is fine. Go ahead and send out a 
RFC patch.

Regarding the mentorship, would you have time for some virtual 
face-to-face meeting to discuss the Eligibility Criteria and Mentorship 
Models?


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
