Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15372C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 09:18:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 970E923A6C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 970E923A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BB488774C;
	Wed,  9 Dec 2020 09:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m23b2ooYuAZk; Wed,  9 Dec 2020 09:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3409787633;
	Wed,  9 Dec 2020 09:18:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1811DC0893;
	Wed,  9 Dec 2020 09:18:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78723C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 09:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 659EA86C82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 09:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7eq3mGxwkfl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 09:18:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6DDFF8681D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 09:18:11 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id b8so880466ila.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 01:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7CkfJi6sc/FeD7aSF5fhUIMGNUBYFXWr8w4D6JpX9yk=;
 b=s5+73UfrzC+gL+7fhdcbObb6Xg95cXP50hbwAsent4EkVkpTgshprfX9zIN4PDZ2cf
 epa56Prb4eWSClYC6WfF2V3dTkAxlI+RlrOlJaDErKeW8svqnCtUz3hDA8yGFXtdyij5
 ZgXIxJ4c38UnUpXxF/KTwdxd/BFLAzLctjYj6h0GhMbvqQHG2Xp7lxNByt3Qg0A5bSY1
 dPIfyMwwUnZQxQtih652kHebss6lhfhLQ+1rqT0ZXvi9mGfJc9qTrYN/ofCEv9hm1F7l
 Qq8QO56N0kwTHkV15CfkIZkRiAevx8TJyV4CBPAwXA8yXA/N6QWmNiZuZ6jA1l0Ce6b+
 YRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7CkfJi6sc/FeD7aSF5fhUIMGNUBYFXWr8w4D6JpX9yk=;
 b=EoLndgOYt7DlTegWFhfGawwqsTyqJw2lgi5Kazytxw786CKRteQeTBrKL5R1KfSSgx
 yYW4AsRbCkLtdvWo1nu2GWZeUTAxnuR+fC4zBX6xT2s3S19OW0r8fMYIxcSOsP8EnKoa
 TDuspNVdqSVVsMnpMTpREv5M4XTxudHJ7SwjLbpg9aZARtdHFJZ5veOUmmni42tG1Hr4
 nSt6sPdGeBwcc/iZzzRWiBQcs7bQWpGR2SU/pfP9xP8IMsTrAlW0ggmXE3J8kYGQMwKW
 1GKMaXBCxR039ImdaASN0IEE15YL7zoyOqBmRDQUkxPjqvh/n2qapcXpF+haj2i5XIhm
 rIVA==
X-Gm-Message-State: AOAM531KutwtNC3pafVQN20AHV6M1SsZm78RCXMufJisqL1PJR/B6NvW
 NilMrAoQ0Sf/oAV+pa5mQGQWX1yU5S/WK+nYh0Q=
X-Google-Smtp-Source: ABdhPJx0Eg8jg6IjzgqxFMP5Mmyij323C17Wn7vGbRaNsalDIezY3F6tehHKnPjYW7Ofr5n88uer6yOSsua7KWPy7t8=
X-Received: by 2002:a92:8587:: with SMTP id f129mr1523030ilh.251.1607505490660; 
 Wed, 09 Dec 2020 01:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20201206152352.35026-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201206152352.35026-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 9 Dec 2020 10:17:59 +0100
Message-ID: <CAKXUXMxD9wyaKf1TrZchOY1NBkFKSrHhFefQc9AK-bfH8fu8oA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add --fix option
	to include linux checks
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

On Sun, Dec 6, 2020 at 4:24 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Add fix option to INCLUDE_LINUX and ARCH_INCLUDE_LINUX
> checks to replace asm includes.
>
> Macros of type:
>  #include <asm/percpu.h>
>  #include <asm/processor.h>
>
> are corrected to:
>  #include <linux/percpu.h>
>  #include <linux/processor.h>
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Dwaipayan, can you run this rule from checkpatch.pl on all files in
the current linux-next tree and share all findings with me?

Maybe, we can fix a few places and improve the rule.

Lukas

> ---
> Changes in v3:
> - Add --fix option to ARCH_INCLUDE_LINUX check
>
> Changes in v2:
> - Use \Q..\E quoting
> - Use @ as regex delimiter
>
>  scripts/checkpatch.pl | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b086d1cd6c2..4aecc237ed38 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5558,11 +5558,17 @@ sub process {
>                                 my $asminclude = `grep -Ec "#include\\s+<asm/$file>" $root/$checkfile`;
>                                 if ($asminclude > 0) {
>                                         if ($realfile =~ m{^arch/}) {
> -                                               CHK("ARCH_INCLUDE_LINUX",
> -                                                   "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> +                                               if (CHK("ARCH_INCLUDE_LINUX",
> +                                                       "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
> +                                                   $fix) {
> +                                                       $fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
> +                                               }
>                                         } else {
> -                                               WARN("INCLUDE_LINUX",
> -                                                    "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> +                                               if (WARN("INCLUDE_LINUX",
> +                                                        "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
> +                                                   $fix) {
> +                                                       $fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
> +                                               }
>                                         }
>                                 }
>                         }
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
