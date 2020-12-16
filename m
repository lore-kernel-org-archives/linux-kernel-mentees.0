Return-Path: <SRS0=xLm4=FU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3A8C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:36:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBC52311B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBC52311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D59858697A;
	Wed, 16 Dec 2020 12:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30oNGl16qxB1; Wed, 16 Dec 2020 12:36:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE9558697C;
	Wed, 16 Dec 2020 12:36:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7DD1C088E;
	Wed, 16 Dec 2020 12:36:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F458C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C3DA2153E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0UkRD6tCARc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:36:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by silver.osuosl.org (Postfix) with ESMTPS id 0EF2B2153D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:36:03 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id p5so22373394ilm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EofikXTpmBFAzV9lmhyJ//rxzzrcwwn6ne+6RSAIZ6E=;
 b=vUWYL60zpqG24HCKFw2bFDukANcm7EBE3xxhOcFQ9EP9R69T5bvS8iV+R8nvB50pZr
 XiyZWIfghbcxmSMkoqP3K69sg5YDKMCXj3gm1uO0fGysPzOpoa3lgcF/5HD3TtVWEWSm
 MVhk9zN5psiZoCvLoSx1C7Me42y2sYrJp2H/cXOdf5VBfHXGOMhUcwjrUQpkAV9F+uCR
 6tolIOdABxITsbMXbp2MckL7vYj1/1LawD7aAJW1evQ3c4UgTDsU9E6uDpPVBXle4mlo
 XIjUmBnwruUzEYSCDST76C/eMhG47OP3KXYlufbOb1d1LI/mios51ZXawSwn0fb/Erkv
 SjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EofikXTpmBFAzV9lmhyJ//rxzzrcwwn6ne+6RSAIZ6E=;
 b=bxX9O8FqGWqPV3n0gokPyDvpSqXI/mlmZndwqA2vDmyXVDIWHkS2WCpxpznj9r9OVK
 HMtyOIDBkjTEyJByf1lNste6x38j3kTyvDV+kOW4gnxoic1Kr7ba8snpy1XcsbKXR/7G
 MBvKBlOnDsiv1NO0FIUp3ERqLW5zQet3tcxrE2W2uoqvaLNHVGlUQya9pz35T8wTuXuT
 L4J01rGKF8MYLK2lEHqJWC4Tr2sa/ldxfXEhWA3QP7F4ZywcAkapXWPFLPIZOjV96Zro
 Epbp2gFZJIm/6kUYJs+1QqWp2k56k2+nTgcdPVstKBHGlkZjZAhqkDAA8agHWt13m5CA
 jw3g==
X-Gm-Message-State: AOAM5327lZoniSYzSoNeX4GlOh5dJxVsrKL9MshA5lAuJPSdqyKaPpod
 txqgVYV+RFnyyekmBqvKhqFhxDqYYQnG0Z//1YA=
X-Google-Smtp-Source: ABdhPJwRuRtnwDNtuprcTeSbrzrY6cb/y3oOl+KOvhKXFSSTzTF0cERjEXs2AAZ7Ye8d7IQn+/nrguY8CrSnF8pYM34=
X-Received: by 2002:a92:b652:: with SMTP id s79mr9162715ili.251.1608122162273; 
 Wed, 16 Dec 2020 04:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20201216123121.16466-1-yashsri421@gmail.com>
In-Reply-To: <20201216123121.16466-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 16 Dec 2020 13:35:51 +0100
Message-ID: <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns for long line in commit messages even for
> URL lines.
>
> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
> this class, around 790 are due to the line containing link.
>
> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
> Consolidate how dtexts and dvalues are freed") reports this warning:
>
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
>
> Avoid giving users warning for character limit, instead suggest them to
> prefix the URLs with "Link:"
>

Looks good to me. This might be also a good one for a fix option.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index abd5a3d2e913..23da1f50fe6a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3032,8 +3032,14 @@ sub process {
>                       $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
>                                         # A Fixes: or Link: line or signature tag line
>                       $commit_log_possible_stack_dump)) {
> -                       WARN("COMMIT_LOG_LONG_LINE",
> -                            "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> +                       if ($line =~ /(?:http|https|ftp):\/\//) {
> +                               WARN("COMMIT_LOG_LONG_LINE",
> +                                    "Consider prefixing the URL with 'Link:'\n" . $herecurr);
> +                       }
> +                       else {
> +                               WARN("COMMIT_LOG_LONG_LINE",
> +                                    "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> +                       }
>                         $commit_log_long_line = 1;
>                 }
>
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
