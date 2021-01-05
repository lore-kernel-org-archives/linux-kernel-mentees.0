Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17245C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:04:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1AB2222A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1AB2222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01ECA85137;
	Tue,  5 Jan 2021 08:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHN84bA_QraY; Tue,  5 Jan 2021 08:04:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A9EB8508A;
	Tue,  5 Jan 2021 08:04:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 721E3C0891;
	Tue,  5 Jan 2021 08:04:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74793C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D80386146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpaUB1zl2ipz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1126E86138
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:04:17 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id u26so24720742iof.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uca7cxD9m6/wvCfFxoR99KV0nX2QzNXnUvuup2hrXYc=;
 b=G8R47V/RApHRhopZboWpBWOQ900ZyDi+ehz1oZ9v+PfYa6xOQPgxmzPkkFLA5ShsoI
 c75N+/FGah3tS7k2hBfJZfLRHNohMVj+kTTXikChVgW+8Ne/zocDGmEtZ7Fl2gXjzbbV
 9DG20fVgMT4PQW56i9R0PKfKadYYqxX46l0JdxJyoMppd4EYMufPNiIenxF8l35CIKNe
 MlDd8j4SRWwlrQUo4PeQhnoHqurGIvAJ1nHEzRwNQ0HwYZSObQQNUq+4dZgM0DXwT8EU
 9PTnLEGrly5CQh1MDD3OW6roR4GRCChbg0mlIW2CvyYJD02h4EGV8geNBWfNZlFUSSC5
 TJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uca7cxD9m6/wvCfFxoR99KV0nX2QzNXnUvuup2hrXYc=;
 b=jQUtOU6fnICCaZfalHPS6jOhIIlydJygcbxj5rSILXawOzabKbUOet9yLPZZIekww9
 m8NdbZfHi9dFClzSvWvHzDaxyWYjvoOpAXNXFGm1Zvqwq0TUO8zrZT5UgGZyA3dq6YXK
 m3gakuawt9liz9UBFQ3ZvUbQg+tidR7FJ/09IrLKJB5NY3OR1d1EZWFaDDoGznJg4eS9
 cJ0odkp5U70ueUE+rd8MMVtuQ0rcPneeK1W8ygfSf7BjO61qe7wtUUVoE46Q/E2T/DTU
 4mf23wPbrKXQ0kxpWh4l8VcMyZHXM0KXFqssXR85G9mx7nagBppRB/+UuVXOtHEv/L6q
 bL2Q==
X-Gm-Message-State: AOAM533v84RUuo9gCkAvFx2VAqEhrJ98KB761m4t7LKmaGq9eSGTK2dl
 l0v/mRYYAzgPwgxUxxrVTZ+TS2zKRFuiZmoKVo/Y3if1jf4=
X-Google-Smtp-Source: ABdhPJy+3eY2JviG9yZfrbftus8ub3ilfVtxy98UJcvXzXQP//hPWJdgf2YeDP2EoeP5VBnlvTWS5awC1MrrH+rJCwY=
X-Received: by 2002:a6b:e704:: with SMTP id b4mr38771675ioh.114.1609833857298; 
 Tue, 05 Jan 2021 00:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
In-Reply-To: <20210104132536.38016-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Jan 2021 09:04:06 +0100
Message-ID: <CAKXUXMxFRU=1V+dRGX8MkK329VoSH_gUVDOxscwh1K4OeQhs=w@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Indentations should use tabs wherever possible.
> Replace spaces by tabs for indents.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Looks good.

Find out who is to blame for this stylistic mess up. (use git blame).

If it is Aditya, let him know to check better and how you discovered
this mess-up.


Lukas

> ---
>  scripts/checkpatch.pl | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b212f5f12ca6..d6a4d25b0972 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2973,7 +2973,7 @@ sub process {
>                                 }
>                                 if (!defined $lines[$linenr]) {
>                                         WARN("BAD_SIGN_OFF",
> -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> +                                            "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
>                                 } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
>                                         WARN("BAD_SIGN_OFF",
>                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> @@ -2996,8 +2996,8 @@ sub process {
>                         if (ERROR("GERRIT_CHANGE_ID",
>                                   "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
>                             $fix) {
> -                                fix_delete_line($fixlinenr, $rawline);
> -                        }
> +                               fix_delete_line($fixlinenr, $rawline);
> +                       }
>                 }
>
>  # Check if the commit log is in a possible stack dump
> @@ -3239,10 +3239,10 @@ sub process {
>                                 next if ($start_char =~ /^\S$/);
>                                 next if (index(" \t.,;?!", $end_char) == -1);
>
> -                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> -                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
> -                                        next if (!exists($allow_repeated_words{lc($first)}));
> -                                }
> +                               # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +                               if ($first =~ /\b[0-9a-f]{2,}\b/i) {
> +                                       next if (!exists($allow_repeated_words{lc($first)}));
> +                               }
>
>                                 if (WARN("REPEATED_WORD",
>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> @@ -4426,7 +4426,7 @@ sub process {
>                         WARN("STATIC_CONST_CHAR_ARRAY",
>                              "char * array declaration might be better as static const\n" .
>                                 $herecurr);
> -               }
> +               }
>
>  # check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
>                 if ($line =~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
> @@ -5279,7 +5279,7 @@ sub process {
>                     $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
>                         WARN("RETURN_VOID",
>                              "void function return statements are not generally useful\n" . $hereprev);
> -               }
> +               }
>
>  # if statements using unnecessary parentheses - ie: if ((foo == bar))
>                 if ($perl_version_ok &&
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
