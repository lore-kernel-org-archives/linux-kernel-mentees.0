Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CDCC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:32:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9CC20679
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvkOUKip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9CC20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3C90C22636;
	Tue, 10 Nov 2020 10:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfncXptz4KrH; Tue, 10 Nov 2020 10:32:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C80D1204BE;
	Tue, 10 Nov 2020 10:32:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE965C0889;
	Tue, 10 Nov 2020 10:32:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C725C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6336D226E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJG5yvoMFenw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id BF790204BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:31:57 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id x20so11433290ilj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 02:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ri+6Yrs30VMypRk//4gZiLEBq6uqbdQxLmxHP3cGXMA=;
 b=cvkOUKip4Y32tHbZwK4fZN5erKpj6UqW4mVTJ1gkMpZj/10cWW1SxfZm/nnIBU3PJH
 0JDA2kw42nivGcMKihZAeIPjWLAY+sy91xbE8XG1GRFMKDRyxZboq44Clc+Zcu1Vjag1
 3K0FmaUk+UpI6zKhHmpobWiEvtmoeAjhawaBKvFmrs/asskMngI/TGvzgLlxiXIDg5eR
 5wTucu6eeHQK0MmCGk1BvWvu4XhBJ72POIzrEVkQY/O0MlKtt2nUXOxuasVv977up/zM
 Fzl3nBew5ZR3uve+XAO9LNH/NiE6hQAsonr54TU2a8R8AajcKkoC5n/tNaGr91cnwxnu
 unxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ri+6Yrs30VMypRk//4gZiLEBq6uqbdQxLmxHP3cGXMA=;
 b=QzmnZ3U5a7YeZ3v0spNpieintmIs6BdNPQXAdZ50vrlAPVQZvOX0CpTqMeiwA+5RPT
 JIwxN1wX603GHiAvYY18OPfrbBkzDTItwiPP+Tc4/ZiHoyNDpNNBDQ68uqzUjjwokH2H
 M9aGsbFfvKGKDb3l3ryo0IdxhFbBClbJweykt3Vn4q0G4/gSrBedJb6xWBbS8qc3qSkf
 mrhARoQWMbqgpYNFn+pBk/Gt91VzAb9drOKDArZmfeuWLCvBGAxG96XFf5wEr9lKhWs+
 ZnsvmYkkG17gf9vMIjdmGK8GtA2adM0BMOTfB4g9tb9P/runOSehzUobNbu7cq0w937R
 h2Ow==
X-Gm-Message-State: AOAM530WR4o5rhor+nlC+ElXNeYCqCMLdA7fa0O0AXfUFzkQV+gmQkaI
 KNYKCOHD+jkk7vXECYsJN3Csol0tVGACwM7uBpw=
X-Google-Smtp-Source: ABdhPJz3t1yv36ltpsTxRMfNbZ/Aet7S6lwakoykVP9GJ3lEz+LMqOFMQXd9txrCtWtJayPX6jKpFJp7E1WJKZG5xZg=
X-Received: by 2002:a92:600e:: with SMTP id u14mr12857598ilb.221.1605004316970; 
 Tue, 10 Nov 2020 02:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20201110100554.15995-1-yashsri421@gmail.com>
In-Reply-To: <20201110100554.15995-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 11:31:47 +0100
Message-ID: <CAKXUXMy2RG3UP_PEzH+KHhZNv7ehSgR9+oz_5mrQUyNO89HkHA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On Tue, Nov 10, 2020 at 11:06 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns us if there is no 'Signed-off-by' line
> for the patch.
>
> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> Completely remove --version flag") reports this error:
>
> ERROR: Missing Signed-off-by: line(s)
>
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the patch separator line. Also avoid this error for
> the commits where some typo is present in the sign off.
>
> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> for quirk") we get missing sign off as well as bad sign off for:
>
> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>
> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> signature and avoid MISSING_SIGN_OFF
>
> A quick evaluation over v4.13..v5.8 found out that 4 out of 11 cases
> for this error is because of missing sign offs in reverts. Add
> documentation regarding it for the future users.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Split this patch into two patches. One for documentation and one for
the checkpatch.pl change.

The documentation patch needs its own commit message to explain why we
think this should be pointed out.

> ---
>  Documentation/process/submitting-patches.rst |  2 ++
>  scripts/checkpatch.pl                        | 17 ++++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 83d9a82055a7..ff065e1f6a25 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -404,6 +404,8 @@ then you just add a line saying::
>
>  using your real name (sorry, no pseudonyms or anonymous contributions.)
>  This will be done for you automatically if you use ``git commit -s``.
> +Also reverts should include a Signed-off-by. ``git revert -s`` does
> +that for you.
>
>  Some people also put extra tags at the end.  They'll just be ignored for
>  now, but you can do this to mark internal company procedures or just
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..849e4a510767 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,8 @@ sub process {
>
>         my $last_blank_line = 0;
>         my $last_coalesced_string_linenr = -1;
> +       my $patch_separator_linenr = 0;
> +       my $is_signed_off = 0;
>
>         our @report = ();
>         our $cnt_lines = 0;
> @@ -2755,6 +2757,10 @@ sub process {
>                 if ($line =~ /^---$/) {
>                         $has_patch_separator = 1;
>                         $in_commit_log = 0;
> +                       # to add missing sign off line before diff(s)
> +                       if($patch_separator_linenr == 0) {
> +                               $patch_separator_linenr = $fixlinenr;
> +                       }

Why do you use fixlinenr here? How is that different from linenr?

>                 }
>
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> @@ -2771,6 +2777,8 @@ sub process {
>                         my $space_after = $3;
>                         my $email = $4;
>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
> +                       # to avoid missing_sign_off error as it most probably is a typo
> +                       $is_signed_off = 1;

Probably is_signed_off is the wrong name here.

Other than that, this change looks good.

Check if the patch applies on top of Dwaipayan's latest patches he sent.

>
>                         if ($sign_off !~ /$signature_tags/) {
>                                 WARN("BAD_SIGN_OFF",
> @@ -7118,9 +7126,12 @@ sub process {
>                       "Does not appear to be a unified-diff format patch\n");
>         }
>         if ($is_patch && $has_commit_log && $chk_signoff) {
> -               if ($signoff == 0) {
> -                       ERROR("MISSING_SIGN_OFF",
> -                             "Missing Signed-off-by: line(s)\n");
> +               if ($signoff == 0 && !$is_signed_off) {
> +                       if (ERROR("MISSING_SIGN_OFF",
> +                                 "Missing Signed-off-by: line(s)\n") &&
> +                           $fix) {
> +                               fix_insert_line($patch_separator_linenr, "Signed-off-by: $author");
> +                       }
>                 } elsif ($authorsignoff != 1) {
>                         # authorsignoff values:
>                         # 0 -> missing sign off
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
