Return-Path: <SRS0=9dud=GV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3D0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 17:25:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0512A22C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 17:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0512A22C9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 82F6D2037B;
	Mon, 18 Jan 2021 17:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6fm1zgmvr28; Mon, 18 Jan 2021 17:25:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C72BF2002B;
	Mon, 18 Jan 2021 17:25:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9F30C08A1;
	Mon, 18 Jan 2021 17:25:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9AC0C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 17:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 84DD320033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 17:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWVoTInf2bQq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 17:25:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by silver.osuosl.org (Postfix) with ESMTPS id A4D552002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 17:25:04 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id y19so34230139iov.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X9To6Vzm1dn4yAgNgxRiUvMrCcFWdNv1upXAZ6C5FuA=;
 b=rQ89iGchQkfTj/uW7V1XRdFoB6KPgniV9z1O5/LWFHHwFifvS2QFbcucqzuI44pgJi
 YOiLpCn3u69xg4BYaWeUTzXLgS6up5v9jJxHEniqdht3/K21OfBVt/0pSZrQ9yUhlHZN
 rShMCKoi/nTRWqCj6G/TFpOo5XelTXwfucMthc2/e+XFsBlHLOH3jBXkkE2cPKiRS1Zx
 pR0aCViNI4KMPBHPZsZLeE8KR6VMRKCKOGMDXTSHPK8cxwAxRVda7NlER7CnlqdKsIJ6
 db+t9LT+VBlB8UAc4pK8ctAZXAW92+UG8j1Iqi6ku7PcybUw+dD5KDbk0G17N/86bO9u
 sLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9To6Vzm1dn4yAgNgxRiUvMrCcFWdNv1upXAZ6C5FuA=;
 b=k7RqPmwKDs7J7nWyu5ALPsWFshmsDXMBtgF6ukZ0a9FUtwyItLyAi4F+M3r1cgg13F
 /ZwukBR3ylhonODVGuJEPIERWrJDtYO7rHmuYUsRQxxJzJHP16B1tQ0Hhc1w8fU8fd7X
 mKRLYs3C4OkXjzIHcdeDd8ffikeLMVHqWUpwKqPU9Y3wVflAyFV9GeucdYyV6CbexITf
 mLOB23elkNgvXSiMr/YWJwCgiGDMWnhJ+VqiUKcCUqlBdRXeD83AMeqmjX4lYQ+3/T1h
 fbWl9o8cQHixCUVNdbioDLMa9NMAYA2oPLxOMRcn/Grszf6KgapgIJ/8MluE23SJw7VA
 dyRw==
X-Gm-Message-State: AOAM5303wrvZHjT5Rk0rioixggNYXNUaXXSUyIN9rNje4UrOE0OZrlAY
 7fncyj3kNYOBYII7FoTGZSPux/J6Z9GN0oGe2v4=
X-Google-Smtp-Source: ABdhPJyOjpTrW26kHYxNUnC5VwVdUtAA1KulOqWGgEEjDGf5/3g5+7e+e6P5j0UqOtfiMkXqsH7dwYbSJnMviuQ+e6E=
X-Received: by 2002:a5e:8d15:: with SMTP id m21mr258244ioj.114.1610990703829; 
 Mon, 18 Jan 2021 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxA=QrANbxudRZPp90Ox7JqjSt_QNek2=xbUuypA527aA@mail.gmail.com>
 <20210118144410.19217-1-yashsri421@gmail.com>
In-Reply-To: <20210118144410.19217-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 18 Jan 2021 18:24:53 +0100
Message-ID: <CAKXUXMziorqP-M6P3dtT1sEPRmVyrJiY96-0p=+p7noF=4DTwg@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Mon, Jan 18, 2021 at 3:44 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Local symbols prefixed with '.L' do not emit symbol table entries, as
> they have special meaning for the assembler.
>
> '.L' prefixed symbols can be used within a code region, but should be
> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>
> Add a new check to emit warning on finding the usage of '.L' symbols

to emit a warning

> in '.S' files, if it lies within SYM_*_START/END annotation pair.
>
> Suggested-by: Mark Brown <bro...@kernel.org>

Hmm, that is not an email?

Did you test running it on the patch that introduced the bug initially
which then led to the overall discussion I pointed out to you?

Lukas

> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7030c4d6d126..858b5def61e9 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2501,6 +2501,9 @@ sub process {
>
>         my $checklicenseline = 1;
>
> +       # record SYM_*_START/END annotation pair count, for AVOID_L_PREFIX
> +       my $sym_start_block = 0;
> +
>         sanitise_line_reset();
>         my $line;
>         foreach my $rawline (@rawlines) {
> @@ -3590,6 +3593,25 @@ sub process {
>                         }
>                 }
>
> +# check for .L prefix local symbols in .S files
> +               if ($realfile =~ /\.S$/) {
> +                       if ($line =~ /SYM_.*_START/ ||
> +                           (defined $context_function && $context_function =~ /SYM_.*_START/)) {
> +                               $sym_start_block++;
> +                       }
> +
> +                       if ($line=~ /\.L\S+/ &&         # line contains .L prefixed local symbol
> +                           $sym_start_block > 0) {     # lies between SYM_*_START and SYM_*_END pair
> +                               WARN("AVOID_L_PREFIX",
> +                                       "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
> +                       }
> +
> +                       if ($line =~ /SYM_.*_END/ ||
> +                           (defined $context_function && $context_function =~ /SYM_.*_END/)) {
> +                               $sym_start_block--;
> +                       }
> +               }
> +
>  # check we are in a valid source file C or perl if not then ignore this hunk
>                 next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
