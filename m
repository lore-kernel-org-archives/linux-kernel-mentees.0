Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B9C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 20:32:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621E721D7E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 20:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwbsGRk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 621E721D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E667C86BC2;
	Sat, 21 Nov 2020 20:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZD3I7hOq71K; Sat, 21 Nov 2020 20:31:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C016E86AF7;
	Sat, 21 Nov 2020 20:31:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC94FC1825;
	Sat, 21 Nov 2020 20:31:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74776C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 60E9F85B3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYqG9blnsAe1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 20:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7B73285A70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 20:31:57 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a9so18390211lfh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4d/b7Hy04mhwjDpN6XL4TWAKPlQGwHadj3yQZ49j5Bk=;
 b=TwbsGRk2hSuldi031hRpur/5BVIv3rNiJ9E5XiM8UJQvom7OcU2G7vYCoWEB++lNt3
 NS8HT09uklpHK7k8Jf2vSKrZe4xpUsm4HZ5aiwFIfa9w9sYukVKKFOFthSIBDTp7D7wq
 mN9+ljC9HM2O2ufc1q/PC59kn6NdZ8CQ9hmmADrW2Tq1dZWk6iWUcQ022tVYxETgiUsV
 jwO5AvBkOZzVSwuYpXRPJZMqwXwW/t37AxNSbOxEREqi8G2T2ewCF/MJ0LcRuCDQV4dl
 cAGucVsHqGzhTmUlgPDmkm5PkuHT9nxSQI/7bl8p4x6EugC5O9X2jprnD9cck6TYBkKE
 Jy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4d/b7Hy04mhwjDpN6XL4TWAKPlQGwHadj3yQZ49j5Bk=;
 b=Tw2pKYZnkwc6OhNRXoAvSTYaiAdLWxDfNXW8WX8AO8TxEWup+7CYhhw3W16s+1liOs
 XjHv0tO0Oxh4RZJse221TTKTldCbyubRTMlcrzGMSlLgVafp6+UFqo6qb5A8ut6oUlbg
 qEDon0VdqnWpn1KL6+w+EqgvD6X1s9/UnMOoNPcSOP2q8Kh8x3LTqTd8sRhDS9ZztDmu
 2VHQ06SJ6/MFwVzBdCkPU+djehuDBpzoBRdvZBD+X5MutWTjPMHRhYEqebnbPurjryyz
 o3q76P1SLetn8JjjyZqqIkR+n7uAOkAJUscDe0cvJx1bOrkqClvmZQHswBCVmKcPZVUQ
 mKsw==
X-Gm-Message-State: AOAM531ZByHJHavpBj0+z9P1YJzXoQqrYoKTD1HhAZZGxR/w5+OrNDP/
 GGvRKpFXglABG/twZa8t5KNoO+m0Xsw7poV/AWo=
X-Google-Smtp-Source: ABdhPJwqJBgxkEiVS/mKJFtZOtD5D9pfov++RYKrPoOWaURnCAeie5c+HkF6OgZ6MS7f8U7m/YUWIoBCkHoOGiZ3sEU=
X-Received: by 2002:a19:4147:: with SMTP id o68mr10937840lfa.365.1605990715231; 
 Sat, 21 Nov 2020 12:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20201121161706.104631-1-dwaipayanray1@gmail.com>
 <185d4505b35be4b9d039f430b3f95e7c33ed6a49.camel@perches.com>
In-Reply-To: <185d4505b35be4b9d039f430b3f95e7c33ed6a49.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Nov 2020 02:01:23 +0530
Message-ID: <CABJPP5AsOwPDYrqMAZ5Vdo8kz55Uccq0jPFfzvB4NTWHDhkJ8A@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	INCLUDE_LINUX
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

On Sun, Nov 22, 2020 at 1:35 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-11-21 at 21:47 +0530, Dwaipayan Ray wrote:
> > Provide fix option to INCLUDE_LINUX check to replace asm
> > includes.
> >
> > Macros of type:
> >  #include <asm/percpu.h>
> >
> > are corrected to:
> >  #include <linux/percpu.h>
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -5468,8 +5468,11 @@ sub process {
> >                                               CHK("ARCH_INCLUDE_LINUX",
> >                                                   "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> >                                       } else {
> > -                                             WARN("INCLUDE_LINUX",
> > -                                                  "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> > +                                             if (WARN("INCLUDE_LINUX",
> > +                                                      "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
> > +                                                 $fix) {
> > +                                                     $fixed[$fixlinenr] =~ s/\<asm\/$file\>/\<linux\/$file\>/;
>
> $file can include a slash.
>
> e.g.: arch/arm/kernel/atags_parse.c:#include <asm/mach/arch.h>
>
> Probably simpler to use /Q /E quoting.
>
>
Thanks. I will do that.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
