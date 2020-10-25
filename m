Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2002C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:11:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6536F21707
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9YFW5N3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6536F21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E1B9820101;
	Sun, 25 Oct 2020 18:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jf8UCWcO6p4T; Sun, 25 Oct 2020 18:11:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 77F2F200E5;
	Sun, 25 Oct 2020 18:11:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 504FFC088B;
	Sun, 25 Oct 2020 18:11:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 828E2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58ED120101
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PR0aZp30jnpV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:11:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 386B4200E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:11:24 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j7so8221536oie.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ed8KRRrEZsM2HNUKQHpYxYL+wtB5fsFk05An48o7JFg=;
 b=G9YFW5N3nv+fWtb0RfTa4V7P6DMgOr1IkGSWbi59smcQpNo5dGFJf9PPdEaITKJzC3
 bO4O1ivoIiO23X/F47h8VcMBrSHmLc1XGE2rRcS3HcbxGV7qew6jkVq8L+AIGzWA4u7l
 KsnDUaBQAsih9emZ70zSW6D+i6ibbifFgYtHCIyORTncbLa2t3sf6s1JvZkeVwW/yhVS
 FkKufEq3151a7zsd139pYSp6OB1NA27ICSbKNwE/j2gi3cYuM7bBHRegSdRRh5b8XvQT
 Fl3cUjeoKH5Xi+/0iYMY11MgFo3eEFK5yq0CHegZkDCKG/AkvGjx8mN0GGaBJjsgOZAQ
 AMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ed8KRRrEZsM2HNUKQHpYxYL+wtB5fsFk05An48o7JFg=;
 b=MuLua5YP2mur+mWqk4hxgzOUBxv5UHnr8TY9JlIvcRiJApkjogcUKyda3ds4a7qm5w
 S5YInNydr4xT3GhoKXwzlSVTOAXNamhHedrIJ9WklAgh9SBpSUr6R2SgcZdZ63J6PSBQ
 gTyyVYneMicFLEOgkXoT+xnt1LVW35+cu6W97ha2g0RCkT7O4UvBIySGaRqbGw6+QLlg
 XcC2G6wr5iraomvAJ4VluUIdquXAsQQUnFkokQdriw8QTYbWDTiZtBTjtKiuovN7yais
 7vsu4uyXvoYQir3yOBNeKm1Ebcp5/rXAMCbkdHwfpz5r62AM2mO2HXOrXe0HoIA3rbBJ
 zN1g==
X-Gm-Message-State: AOAM5335mHh17yzlzTIN60Ez+VrrsFS+8CW7FKA3AsAVGGv7LtAZD+ee
 YuEWrcatRi1dRkfWhZuv02E0iMhPPlF2u4K3YKk=
X-Google-Smtp-Source: ABdhPJxP0fvcw0qSr81JHp5Cbznf8QCPLDFhYAnuCgTNLfAIFDcntT8oSDBcZ+DU1cqGecUiPra9hcEdq/lIerH+1KM=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr9917896oig.74.1603649483265; 
 Sun, 25 Oct 2020 11:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201025101537.59133-1-dwaipayanray1@gmail.com>
 <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
In-Reply-To: <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 23:40:54 +0530
Message-ID: <CABJPP5Cec7jKfaygRaxm-z5gzhg-7cBX1GP46NRQDM6rfhg3Ww@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: extend attributes
	check to handle more patterns
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

On Sun, Oct 25, 2020 at 11:29 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-10-25 at 15:45 +0530, Dwaipayan Ray wrote:
> > It is generally preferred that the macros from
> > include/linux/compiler_attributes.h are used, unless there
> > is a reason not to.
> >
> > checkpatch currently checks __attribute__ for each of
> > packed, aligned, section, printf, scanf, and weak. Other
> > declarations in compiler_attributes.h are not handled.
> >
> > Add a generic test to check the presence of such attributes.
> > Some attributes require more specific handling and are kept
> > separate.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -6155,50 +6155,95 @@ sub process {
> >                       }
> >               }
> >
> >
> > -# Check for __attribute__ packed, prefer __packed
> > +# Check for compiler attributes
> >               if ($realfile !~ m@\binclude/uapi/@ &&
> > -                 $line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
> > -                     WARN("PREFER_PACKED",
> > -                          "__packed is preferred over __attribute__((packed))\n" . $herecurr);
> > -             }
> > +                 $rawline =~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
>
> Using $rawline would also change comments and that seems wrong.
> Any reason to use $rawline instead of $line?
>
Hi,
Yes I used $line initially but changed it because quoted
strings were being replaced.

Like:
__attribute__((__section__("_ftrace_events")))

$line in this case was:
__attribute__((__section__("XXXXXXXXXXXXXX")))

While $rawline was:
__attribute__((__section__("_ftrace_events")))

So to avoid this problem I changed to $rawline.

Is there any other alternative available perhaps?
Or should I change back to $rawline?

> []
>
> > +                     if (scalar @conv_array > 0 && $conv_possible == 1) {
> > +                             my $replace = join(' ', @conv_array);
> > +                             if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> > +                                      "$replace is preferred over __attribute__(($attr))\n" . $herecurr) &&
> > +                                     $fix) {
> > +                                     $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$replace/;
>
> I looks it would be useful to add
>                                         $fixed[$fixlinenr] =~ s/\}\Q$replace\E/} $replace/;
> so there's a space added between } and any replacements.
>
Yes I will do that sure.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
