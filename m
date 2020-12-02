Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309C8C6369E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:00:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF802224C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF802224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC85787780;
	Wed,  2 Dec 2020 20:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zgs5995yNSAd; Wed,  2 Dec 2020 20:00:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11CFA8777F;
	Wed,  2 Dec 2020 20:00:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09738C0859;
	Wed,  2 Dec 2020 20:00:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17EDBC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 017B42E2A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id didFEq2Nyd+X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:00:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 0BF0320363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:00:53 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y16so5290928ljk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 12:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zsx3zkwwHEFHc2ZqwiwShQ6Q9mkkL7TrgiVkNITirw0=;
 b=VRb2YXjb/uGI6m8amqVXlZvc4Z/qToReryNEMQP81G4BPNKMZhAT/oDKwZKl90cpO3
 +8EtTpFPAOezMTrbgvTftu/hrO2TJ7szYjW5cUDcfWgTsQqfU8YFdXoSXEK/ynzlZLGQ
 f+Hvf0hX0kHjnSe9BmWOik7JERkLWFaeyjiVw9NfdiTL126U4Lf8/PaXyYbfMWxMAJS7
 s5m07net2UoO7keFDh3bzg6tLnEgQqQTqnaqCGRiyT4TEhlwkWEwAlozkkB19JFYEb/F
 jcaVfKpkDUKZaYBgNOu6g3zJgpSPelJK9PuegWMiKWSFriBV+D1f0R3yKDHjuJT3mcOz
 lqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zsx3zkwwHEFHc2ZqwiwShQ6Q9mkkL7TrgiVkNITirw0=;
 b=bkJkKf8Iz0BrW4wUtoXCcflnj+U+4abiTKL/9H2uLW08q59Z7KNBCQX6AX+luVCt5J
 cZ9h9uIL3q2PHF36azQS7dtDmMgwH1S+QJgew6A0jp3YnXInF6xlLxDz28o2BCizxwRe
 wqCK//l6rQeMPZGCp3By+Wx/QkpjuW1Nzl+TC4Gu7r3gnSCnC0aYdBFmwWZpoj82k/Vd
 nTYo3XzQqOHJ3RFTUQIt8PT/kxoKU4A5jBOZnrO6TiRYnSjntEUzxzlaWTQXlv2wMaxJ
 PFHQGPedI3RFLpwCkFTCb/xLxHGgIJd/+loGs65qSAmTMSQeF6rjghAEnGSrtWtHYNxG
 WXpg==
X-Gm-Message-State: AOAM530eoRcNitfDczybsoPTDm5S4SFT/7VcFdcm3p9Q06vTZCqTdJQc
 5tDhqJiYpFlLw1dq2auOZ4lkwaGfSfOKLlGD5Vs=
X-Google-Smtp-Source: ABdhPJw/Coroj1JS2bEBOE0eyRmria5NjN2KoFfvTq16hjK/y5AEHWSEdYl4eI/kKpcJcTlLiUAeJskMAYy2+88iYj4=
X-Received: by 2002:a05:651c:cb:: with SMTP id
 11mr2025398ljr.159.1606939250839; 
 Wed, 02 Dec 2020 12:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20201202101448.8494-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201202101448.8494-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 3 Dec 2020 01:30:23 +0530
Message-ID: <CABJPP5DSEb5G6G1O1Gvga_E3bT0DftTp6qcgh4RPSKL8cfus-Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Wed, Dec 2, 2020 at 3:45 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Commit log lines starting with a '#' can be dropped by git if
> the corresponding commit message is reworded by a maintainer.
> This minor error can be easily avoided if checkpatch warns
> for the same.
>
> Add a new check which emits a warning on finding lines starting
> with a '#'. Also add a quick fix by adding a tab in front of
> such lines.
>
> Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e8c1ed0b1fad..a12edcf4f63a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2966,6 +2966,15 @@ sub process {
>                         $commit_log_possible_stack_dump = 0;
>                 }
>
> +# Check for lines starting with a #
> +               if ($in_commit_log && $line =~ /^#/) {
> +                       if (WARN("POSSIBLE_IGNORED_LINE",
> +                                "Commit log lines starting with a '#' might be dropped by git.\n" . $herecurr)
> +                           && $fix) {
> +                               $fixed[$fixlinenr] =~ s/^#/\t#/;
> +                       }
> +               }
> +
>  # Check for git id commit length and improperly formed commit descriptions
>                 if ($in_commit_log && !$commit_log_possible_stack_dump &&
>                     $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
> --
> 2.27.0
>
Hi,
This patch may seem trivial but I wanted to send it to you for review
nevertheless.

Peilin had earlier faced this problem in one of his patches which was
mainlined. There were some '#define' lines in the commit log. Due to
some reason the Maintainer had to reword the commit message, and
ultimately those '#define' lines were lost in the tree that was merged.

I am not sure if it would be exactly helpful for regular committers but for
new contributers it might be nice to avoid such a mistake. Do you think
it deserves inclusion in checkpatch?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
