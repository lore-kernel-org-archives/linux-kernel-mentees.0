Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA9CC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:11:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046CA22228
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgOuZRa2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046CA22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 892518664E;
	Tue, 17 Nov 2020 19:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5Gw2W2qV4fA; Tue, 17 Nov 2020 19:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F123081DE3;
	Tue, 17 Nov 2020 19:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAA7DC0891;
	Tue, 17 Nov 2020 19:11:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EF19C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5AA1585643
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w16XWpZII-H8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:11:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1A2985631
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:11:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r12so22354695iot.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 11:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHxXnxmI//7LinvlbVOi6ZcwCcuWriXF3KNl1FvGx8c=;
 b=KgOuZRa2gYl0ic5bmHkEsZkt6eboeW0EBvlmJlCQqmeXDdDZV0eohhvGMRLGyb6IRy
 lYD278XFUsPb5CcUQGSOdejkqMEC6XD4JTbM3Uh0rzqgBEoezf/RKNm95nO5sQgJ+xJ/
 M/DQOYudAM7gnh4kIAwySNTOnFcHloK7U2nS9nP/sFctsDGhF//alA9sz34COdYeOAx8
 lEjMNL8K0v8wiMwBD6oR1giDo72ywPjOLCx3pdk6cNNZzR44Jgud7S8SeCtew91K+oJt
 C+DoUSbSA8NhYP5bkVDr3wqZs6lc1nm3bbZigsj7OgwRlmchQppoJo5S+9i1vU/8Dga5
 5Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHxXnxmI//7LinvlbVOi6ZcwCcuWriXF3KNl1FvGx8c=;
 b=ThFXtzvAw378pgjNRXDJc+mgJ/S8bJJaESs3HZLDRvYXvIFqZVDgo84/SBBHBKwUBM
 uMA7+IwjHwUUvXqfcRLZVqamSYPhVblMM3YDUIIyMslWxeMOJbwjffF/XohiEokb2Ond
 i4Y7xT02NNtwL9UQK7y+WjE5RXWw63JtAyL3NgbrdkdsYm+0YCsUmpA9FBudQHIE9Ze2
 AlbrYh9pCq3YtsdW4llGxubMp5/bWlhKAuaTAc/rIGbga2WZ4/qUQqbzfkoZdWgAOzBT
 aH57mH+gxhbM2B7i9Tbe78XUTcWFHi/VfwTDUF4uY03bf/dWhHTDPzocO/AR2GJ4p/LI
 N/9w==
X-Gm-Message-State: AOAM5302EQLmrAWMvuc3tkjO2V++8z+9gnaoG2HYG16aM2GQE8U+HobO
 tSb4KpbxvpDTgfpgTaXZe9UtR7pzUkuRH4rTsDA=
X-Google-Smtp-Source: ABdhPJz3t0IuAWW4y+MT4v/WX/QnWTKiDOHfns36I24Pn4UwKfykV/9P/36F95onhwtUFO5FlWJXqjeF93KS4C1tqjk=
X-Received: by 2002:a05:6602:3353:: with SMTP id
 c19mr12491468ioz.114.1605640287967; 
 Tue, 17 Nov 2020 11:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20201117181236.101332-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201117181236.101332-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 20:11:17 +0100
Message-ID: <CAKXUXMzOyg32kNEZ-nw-YrWD=VsT_zeFwxKdLoD2iTf0u7XkxQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Nov 17, 2020 at 7:13 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
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

Looks good. How do you discover these errors?

Are you creating a test suite for checkpatch?

Lukas

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
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
