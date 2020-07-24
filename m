Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E84C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 08:09:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E583A20748
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 08:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es+dRVgf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E583A20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AEA5A88079;
	Fri, 24 Jul 2020 08:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqTELx91xZYH; Fri, 24 Jul 2020 08:09:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D531388077;
	Fri, 24 Jul 2020 08:09:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9C95C004E;
	Fri, 24 Jul 2020 08:09:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 147B8C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 08:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 09C4C8877D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 08:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zuP2MQhCS89
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 08:09:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4D3688703
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 08:09:35 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d18so6389719edv.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 01:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=joOFl05zQ0aGAEKv0oS4DxOukWwKGK9KNFtwEc+PJwQ=;
 b=Es+dRVgfsrxE8mdhsod8bMxb9UkdRkRRMIli9im9FYUILtGRzTU7LY7C7coy+WHimI
 ocjyTsgBc9yfQ426Y4R9L5BCxclrbLUG8rRvXQtHIQjtQNZ4Gtoza46EjAzkZBdXLMI+
 Jh1mmT2m7/TPFAAW7FvzgyQDxEVjjpMKiHvKvNIP+JN3/vEi85E5FIaGLdsF2AxcYS3i
 rxZi4t9x/HNpx/qSUey/4GKB68Q6GgSJ94ajKUdQ2+tPYzkq1jVcaxM5k/Jm2oLFDyQj
 uKafnBifMxNuSqv/3IdsI2tnfdLpBPidia+dyBSrQ9S0zCf+AXj5AXz8JQ3V0+heTkJ1
 102g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=joOFl05zQ0aGAEKv0oS4DxOukWwKGK9KNFtwEc+PJwQ=;
 b=A8APvmLmUwoCLInMCxzwhrJJZT8NfrFvyuCoYwrNEzuVVcmxFKb82j19v5iWK5Xl+e
 obQeiPQ4wOuAQH12X5b3ddhEIBkmGiVRUIxhA4yVxwM7Bv+40dU5EFiewKFyaanWgJ4J
 alZ+tTu4TV35FsNIl3mVFO+Z5/98e243cKSUV15HnNYXPT5VVSX9kjKxUv29Ja098lfC
 O+7RseZ8m60vdmmdGVkNsKi80LkszCzqxFaZtpsvswxQIy1DGYb6Y0OlH6pY6UIB6K/L
 RHL3u1HJKQH2iSgFPP33OyCfi7McQ+GwQsCLdgUwe4YjnsUuqLm8PXTAf9Cwq1L1D/CH
 5N3A==
X-Gm-Message-State: AOAM530zgyQRL6+k2FqqlizKJ0/ZiLFv7aTRLg2azectbV7GagIEoulD
 gdTOwlAeKIjQpHNuuBdm5Jg=
X-Google-Smtp-Source: ABdhPJy/gWmAFPP7gWK7zItzOxcKgoMjlGvQJll06AlWpikz0mFe9p47ytTmgl5yCybRc2GO3LieBQ==
X-Received: by 2002:a50:cf43:: with SMTP id d3mr8198474edk.40.1595578174095;
 Fri, 24 Jul 2020 01:09:34 -0700 (PDT)
Received: from felia ([2001:16b8:2d47:7700:3c1c:4ace:3bdf:6d35])
 by smtp.gmail.com with ESMTPSA id cc9sm234676edb.14.2020.07.24.01.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 01:09:33 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 24 Jul 2020 10:09:25 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <CAD1=X6mvdYOfGg__UNHKAskf8Oe17p9V2Rj8jEaRY1CbstoTCw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2007240956440.10209@felia>
References: <20200721054419.kab7i6l6zkioddh5@mrinalpandey>
 <alpine.DEB.2.21.2007221207260.10005@felia>
 <CAD1=X6mvdYOfGg__UNHKAskf8Oe17p9V2Rj8jEaRY1CbstoTCw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-609871688-1595578173=:10209"
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-609871688-1595578173=:10209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 24 Jul 2020, Mrinal Pandey wrote:

> 
> 
> On Wed, Jul 22, 2020 at 3:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> 
>       On Tue, 21 Jul 2020, Mrinal Pandey wrote:
> 
>       > In all the scripts, the SPDX license should be on the second line,
>       > the first line being the shebang, but checkpatch issues a warning
>       > "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
>       > scripts that have SPDX license in the second line.
>       >
> 
>       That what you wrote is actually wrong. Checkpatch only wrongly warns if
>       the first line is not included in the diff, right? Otherwise, it does not
>       warn as intended.
> 
> 
> Sir,
> 
> Yes. I would modify the description accordingly.
> 
>       > However, this warning is not issued when checkpatch is run on a file.
>       > The case for files has been handled gracefully by checking first line of
>       > the file to be a shebang and then setting `$checklicenseline` to `2`but
>       > this doesn't work when we don't have shebang in diff content of a patch
>       > and `$checklicenseline` continues to be `1` in such cases. Therefore,
>       > checkpatch expects the line `1` to contain the SPDX license when it
>       > should have been `2` instead.
>       >
> 
>       It is described very complicated here. Maybe think about rephrasing it, so
>       it becomes more clear.
> 
> 
>       > I noticed this false positive while running checkpatch on the set of
>       > commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
>       > a script file.
>       >
> 
>       How about naming the commits and providing a statistics how often that
>       happens?
> 
>       > This false positive exists in checkpatch since commit a8da38a9cf0e
>       > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
>       > when the corresponding rule was first commited.
>       >
>       > Fix this by setting `$checklicenseline` to `2` whenever the file or diff
>       > content we are checking comes from a script instead of checking first
>       > line to be a shebang, thus, informing checkpatch that the SPDX license
>       > should be expected on the second line.
>       >
> 
>       Well, now the critical part:
> 
>       It seems that this now makes the situation worse compared to before.
> 
>       I quickly ran this evaluation:
> 
>       $ cat first-line.sh
>       #!/bin/bash
> 
>       for file in $(git ls-files)
>       do
>               firstline="$(head --silent -n 1 $file)"
>               echo "$file: $firstline"
>       done
> 
>       $ sh ./first-line.sh > first-lines
> 
>       $ grep "#!" first-lines | wc -l
>       810
> 
>       $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\."
> 
>       $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\." | wc
>       -l
>       120
> 
>       $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | rev | cut -d"/"
>       -f1 | rev | grep  "\." | cut -d"." -f2 | sort | uniq -c | sort -nr
>           509 sh
>            91 tc
>            45 pl
>            37 py
>             6 awk
>             1 config
> 
>       So, in 120 cases you actually would now warn on line 1 where the should be
>       a shebang as intended.
> 
>       Also, I cross-checked .yaml files:
> 
>       $ grep "\.yaml:" first-lines | grep "SPDX-License-Identifier"  | wc -l
>       1035
> 
>       $ grep "\.yaml:" first-lines | wc -l
>       1037
> 
> 
>       So, for yaml, SPDX is actually in line 1.
> 
> 
> Yes, I should remove the `yaml` files from this check.
> 
> 
>       I guess you need to think about this a bit more.
> 
> 
> If I am correct now we have an issue with all those files which are scripts without an extension.

Yes, correct.

> In this case, the earlier logic which I removed was working fine(now I get an idea of why it was like
> that in the first place). I think the best way is to keep both my suggested change and the logic that
> already exists so that we can at least avoid those false positives when we know the extension without
> essentially duplicating the logic.

You need to combine the previous heuristic with your further extension, 
making it overall better and try to keep the logic checking as simple as 
possible.

If the first line is there and a shebang, use it to make a decision. If 
the first line is not available, use another heuristic.

> Checking for files with no extension, no shebang and only SPDX in diff is tricky since we can't actually open the file.

You cannot open the file, but if a first line is available, you need to 
use that information.

I suggest that you evaluate your patch on a set of use cases with a clear 
report what was reported before and after applying your patch.

Lukas


> Please let me know your views.
>  
> Thank you.
> 
> 
>       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
>       > ---
>       >  scripts/checkpatch.pl | 7 ++++---
>       >  1 file changed, 4 insertions(+), 3 deletions(-)
>       >
>       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>       > index 4c820607540b..bdd2f9a80891 100755
>       > --- a/scripts/checkpatch.pl
>       > +++ b/scripts/checkpatch.pl
>       > @@ -3166,10 +3166,11 @@ sub process {
>       >               }
>       > 
>       >  # check for using SPDX license tag at beginning of files
>       > +             if ($realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {
>       > +                     $checklicenseline = 2;
>       > +             }
>       >               if ($realline == $checklicenseline) {
>       > -                     if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
>       > -                             $checklicenseline = 2;
>       > -                     } elsif ($rawline =~ /^\+/) {
>       > +                     if ($rawline =~ /^\+/) {
>       >                               my $comment = "";
>       >                               if ($realfile =~ /\.(h|s|S)$/) {
>       >                                       $comment = '/*';
>       > --
>       > 2.25.1
>       >
>       >
> 
> 
> 
--8323329-609871688-1595578173=:10209
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-609871688-1595578173=:10209--
