Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43751C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:55:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846952467A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ub+DrnAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846952467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAF2C8702F;
	Wed, 18 Nov 2020 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unNLHF90X7jw; Wed, 18 Nov 2020 20:55:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 915C28701D;
	Wed, 18 Nov 2020 20:55:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D56AC0891;
	Wed, 18 Nov 2020 20:55:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D1C0C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3C50B85259
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drShzYC3TGtb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:55:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5B7084AE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:55:14 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w142so4986522lff.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=38YN59hI/1OohBo3xfkLhDrixFhCGfYbFT2uz3ZjEdk=;
 b=Ub+DrnArcqJ04o9u1w0KIxUCBF6WNqFRePnKHQ4T2uAO7hRSXJEuZ1jd3gwCZm1q46
 8ME7GT0DRdKmX+6ZDeaMDTtKyy/4JwVfAZ+GVKjBIPcSmZqvHU/IEymcudYm/CVcZKgk
 UyCdENkKKbIOO/YvZ3CdP/HPaWY+a1bsWqrqpb+iDtAOkfC7HRRb6nXZbNI/j/DE8rNy
 RYQS6bX7lgZuU1ltYrWzi+MUx9JrJ0bGqm2ou9UdG4JWe5lVYjSgIEmt8EVTricsb6ym
 1h0cKLYbjxx+pyz7JpwTBYEM1NUVNzZU2r2kFoUUdcPT7na6PGTGZhLSH8tT0LDN5HuK
 1YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=38YN59hI/1OohBo3xfkLhDrixFhCGfYbFT2uz3ZjEdk=;
 b=K11O1dFUbGjYDPPijAUYIz2GFpI3CKxKzQmh1VpWCo2Ata6uaRYNL+Iqx/xlV4e6A2
 ydaAYFwFw15PMPQ+kHpo1awTX8FktBL8t/NYG3JgxY5gT+LJvHM1lS0A4r0bFRjtEPtq
 kGdlI2eVwijmaWCxbnukcqqyGXARFtQ6xgN9Q7MrZOcoL/qkEWmQzBTH9y85gJ96GFrb
 diJ/NPZQJ9IGTuysr8Un+zHqZ5t0Hs2wse69rLhNImKeNZO3G1Wo6NSimJb6ZCnOq3Qp
 IbQZhFXfggbZCvji+kzDGMZbgkSk3TIJ/eVzfsqxGfvwXZy7b4zQEXBXv92c87PrLJW+
 ITyg==
X-Gm-Message-State: AOAM532pisMWTE3DtVP8H2+WVJnPWp7/aT8gfW1lgxFjlE7lCFLzEJ1e
 cQcb4TM/80OXuSlqohAJemKTJhi5Ob4ZgDzQ01g=
X-Google-Smtp-Source: ABdhPJzgzfHqvhk3X1p7air2kTUquMMEgw76rrxDTqjVGx8mSkutsMWf5JaUeBftakTkPruFrCi0l98YaE3im55tnb8=
X-Received: by 2002:ac2:598f:: with SMTP id w15mr4105975lfn.148.1605732912583; 
 Wed, 18 Nov 2020 12:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20201117201305.108427-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201117201305.108427-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 02:24:41 +0530
Message-ID: <CABJPP5B8dSQ-kQaCQL1KsyJ-TcTwpAPOuOyUbpsNHFWhn6Vr0Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix spacing check
	for return with parentheses
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

On Wed, Nov 18, 2020 at 1:43 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> The spacing check is unreachable for return statements
> followed by an opening parentheses.
> For example:
>
> int foo(int bar, int baz)
> {
>         return(bar+baz);
> }
>
> There should be an error emitted for a space between
> return and the opening parentheses but checkpatch doesn't
> emit one.
>
> Fix the spacing check. Also add --fix option to
> the check.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8da6cde20c68..07feeb3321e2 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5176,10 +5176,13 @@ sub process {
>                                 if ($value =~ m/^\s*$FuncArg\s*(?:\?|$)/) {
>                                         ERROR("RETURN_PARENTHESES",
>                                               "return is not a function, parentheses are not required\n" . $herecurr);
> +                               } elsif ($spacing !~ /\s+/) {
> +                                       if (ERROR("SPACING",
> +                                                 "space required before the open parenthesis '('\n" . $herecurr) &&
> +                                           $fix) {
> +                                               $fixed[$fixlinenr] =~ s/\breturn\s*\(/return \(/;
> +                                       }
>                                 }
> -                       } elsif ($spacing !~ /\s+/) {
> -                               ERROR("SPACING",
> -                                     "space required before the open parenthesis '('\n" . $herecurr);
>                         }
>                 }
>
> --
> 2.27.0

Sorry for the ping Joe. Just wanted to know if this got missed.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
