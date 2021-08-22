Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6B6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 17:29:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5001061248
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 17:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5001061248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E39D80CB7;
	Sun, 22 Aug 2021 17:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SzRlUgq_Yto; Sun, 22 Aug 2021 17:29:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1FAA280C91;
	Sun, 22 Aug 2021 17:29:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B98EC0010;
	Sun, 22 Aug 2021 17:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E27E3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15A6401BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDDpEDKeBTv5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA279401BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:29:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l18so19439434lji.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUWSK8DqYdJBfiE1U5iKiJ4os+tS9hHSUGdvzjWKMHo=;
 b=InrYZuhb7+ElKaA/JEVBQreazcmmHZZ2DbCPNVesZsR4pc7d/sf8cmpCH8QZz7ZHXq
 iEal868v/wYIHYfQhSNhf4UlRIscA4nsJWUhDcxS9myu9p5JRC6B2cy+uDdkoYzo85/f
 7V+0JTbjikqs4tsutfgEBNJgE3yCIShmkSFPb0kfTZbcs+jsXKRlgTs6O/RwBgvbgMzc
 MAQE7cfJBX4SpjnXmaJZcyKWZNZdiBH4i83qh6A/fnnCyYtaFoNxc8Igsa4cuAqUwYhA
 31o1xAdUztp9t+Jgkujknnex+ASuGZauox6gbPa2C+oUmytmQJyoEnMgE8DbkeGccITM
 7wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUWSK8DqYdJBfiE1U5iKiJ4os+tS9hHSUGdvzjWKMHo=;
 b=kmozHVxc2KDQp99/3hHHzQYyQhyRqXO2JIf44jrzTUFIRI1qShetaCZkUbYGmIqRYR
 ccBN6PwWiQyEVwCGJ3ePl6GvcPb1vjnXNtiCNiTnKvyIKQgND/uEAOIUcA0fckuvybYQ
 uYEJsLByMsH6yjo+PRr9xKWChCYKB3sXgcrPu/ozmgZsue54arrDc785PP8PW9+prZzC
 wn7McJlokDLbjOG+QKcWuj4ZhA6APN5MbeTuJHj3aOqN/sZu950rOPnbrmYX9bQQvYsf
 zBjo2UCz3SdL7iegRSXTmwJ6fgCvlcGgWgjA+JXtIHY6iRTi7Ey/wOHMzj9Ho3OjPLsX
 Bnkw==
X-Gm-Message-State: AOAM533cw2vdPiilh3PqAcgmGdIoHCAOEjLTQ2n+zVjiz71cbOie5OKu
 yeBRY5w2u0Kc+nzg8pjsnt9o0vm9FaNpvDQjRa4=
X-Google-Smtp-Source: ABdhPJzsherUCNPVQkdqlJjnfU91pUpC7C03A8bY0sIvjEZndkruDwE3ThXnnRbAMS4VZAXRastLKC9dy/t0Dj4rMiQ=
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr24565420ljg.324.1629653374644; 
 Sun, 22 Aug 2021 10:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CxsHYO8Omdceh0yD6RtRMnt5hW7DWc=aKxpXPXQJVLEQ@mail.gmail.com>
 <20210820195336.18611-1-utkarshverma294@gmail.com>
In-Reply-To: <20210820195336.18611-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Aug 2021 22:59:23 +0530
Message-ID: <CABJPP5AJer6OH1oBrw+JG3V8uZ_k+V2jHoLWsQ4ZTvdYsB5zhg@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: Add TRAILING_SEMICOLON
 message
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Aug 21, 2021 at 1:23 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type TRAILING_SEMICOLON for the macro definitions
> that conclude with a semicolon.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea2d8..30eda8f4a8bd 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -845,6 +845,27 @@ Macros, Attributes and Symbols
>      Use the `fallthrough;` pseudo keyword instead of
>      `/* fallthrough */` like comments.
>

I think this is good enough.

Reviewed-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Lukas, any inputs?

Thanks,
Dwaipayan.

> +  **TRAILING_SEMICOLON**
> +    Macro definition should not end with a semicolon. The macro
> +    invocation style should be consistent with function calls.
> +    This can prevent any unexpected code paths::
> +
> +      #define MAC do_something;
> +
> +    If this macro is used within a if else statement, like::
> +
> +      if (some_condition)
> +              MAC;
> +
> +      else
> +              do_something;
> +
> +    Then there would be a compilation error, because when the macro is
> +    expanded there are two trailing semicolons, so the else branch gets
> +    orphaned.
> +
> +    See: https://lore.kernel.org/lkml/1399671106.2912.21.camel@joe-AO725/
> +
>    **WEAK_DECLARATION**
>      Using weak declarations like __attribute__((weak)) or __weak
>      can have unintended link defects.  Avoid using them.
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
