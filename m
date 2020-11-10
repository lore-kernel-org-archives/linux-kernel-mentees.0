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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895CBC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 14:01:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1059207D3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 14:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO/fSuoS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1059207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BAFC86B62;
	Tue, 10 Nov 2020 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1j6Y5t5aPuc; Tue, 10 Nov 2020 14:01:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95F5C86B5E;
	Tue, 10 Nov 2020 14:01:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75AB5C088B;
	Tue, 10 Nov 2020 14:01:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8468C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C9746864DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN9lXTbxvPou
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0E0F86497
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:01:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id t8so9604291iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4tAoEcXuDFFEih46ZZRkk3RthKKrNRSM174ZtjbOn0=;
 b=KO/fSuoSjtEP0miRAUV3iZklYFxcZ6F/60z/Af9bejx/K/frEV3OfahO2sIEptNezM
 TDGiz5L6qRsH2qrXSxKiJSnwMRtV827koG+hx+N1UKHe369XkkEwMlWkxxuduz6Mk3x1
 NrcBJTxyx9BrgHayvTAjVA+YE2mJZIZHYR2dkN8KeJImo/dJsRn0fXd4ZFwaL8sLrw1u
 PXHkaJuzWi1TXPfwrIkz00zyXntAV7nK/Xr3ys3ZYzWftEulvdcZibFX7IvHXFy12oiU
 KwGgPp2ya9fqPUgnP/rIPArvLOexjmziWnC0wQOGbWGRyP+qGufmikIQFphuZkPticAn
 gdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4tAoEcXuDFFEih46ZZRkk3RthKKrNRSM174ZtjbOn0=;
 b=USMyPlXkAvzVxrKBxTAyzYb/zodoFL07QP+Z1h429UQUbQvEit6OLCP9pSMUBwVqP2
 JU0B8SzCKHihhJ/vKgSyClcP4ZRYKz4m8jOm37nbjBsOEqJS5o3HA0pOVyYw/4obIO2C
 b8fmzsTQ12lAjIYs0BM4WeCpAR4gjI5q/kZR5niojhAoEYCAHMwU13GQPnnhPOGiW4s9
 ++d3RfQ1B/0rILvt3GIIuLh0tSbCrU5zLsNfdy39gEpIYYg6tbhC+qmmA8D2BoW2e+IS
 dlpSvqmshEunrbzx3FbE48USifvu6U8Ln59MZMKEstA7PymVPzf0cZs41jivjDjjKcJ7
 xLbQ==
X-Gm-Message-State: AOAM530AJ1idPJGMJMXLRr5yihebj4nya2wR1scK4cAubJHRxHeH8VDF
 qDiZnuLda5uzHoMTTUzkdPfb641Ffb2mXkDLmmM=
X-Google-Smtp-Source: ABdhPJzvso6++SuKAmbTWMsXgyu7tOPlz52SQY8HcuRrllr9KRknIhlj6+uDnFUl8RYO4iVtkV5qyMTE8IxY9UzVHfA=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr5804621iom.102.1605016862058; 
 Tue, 10 Nov 2020 06:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20201110130602.22359-1-yashsri421@gmail.com>
In-Reply-To: <20201110130602.22359-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 15:00:52 +0100
Message-ID: <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
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

On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
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
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
> and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
>
>  scripts/checkpatch.pl | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..2deffd0c091b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,8 @@ sub process {
>
>         my $last_blank_line = 0;
>         my $last_coalesced_string_linenr = -1;
> +       my $patch_separator_linenr = 0;
> +       my $non_standard_signature = 0;
>
>         our @report = ();
>         our $cnt_lines = 0;
> @@ -2755,6 +2757,10 @@ sub process {
>                 if ($line =~ /^---$/) {
>                         $has_patch_separator = 1;
>                         $in_commit_log = 0;
> +                       # to add missing sign off line before diff(s)
> +                       if($patch_separator_linenr == 0) {
> +                               $patch_separator_linenr = $linenr;

Well are you sure linenr is correct? (As I wrote, I do not know, but
you should know.)

I think you would need to create a patch for testing your feature
where multiple things are fixed within the same patch and then check
if the fix is added at the right place.

> +                       }
>                 }
>
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> @@ -2775,6 +2781,9 @@ sub process {
>                         if ($sign_off !~ /$signature_tags/) {
>                                 WARN("BAD_SIGN_OFF",
>                                      "Non-standard signature: $sign_off\n" . $herecurr);
> +
> +                               # to avoid missing_sign_off error as it most probably is just a typo
> +                               $non_standard_signature = 1;

The variable name now sounds much better.

>                         }
>                         if (defined $space_before && $space_before ne "") {
>                                 if (WARN("BAD_SIGN_OFF",
> @@ -7118,9 +7127,12 @@ sub process {
>                       "Does not appear to be a unified-diff format patch\n");
>         }
>         if ($is_patch && $has_commit_log && $chk_signoff) {
> -               if ($signoff == 0) {
> -                       ERROR("MISSING_SIGN_OFF",
> -                             "Missing Signed-off-by: line(s)\n");
> +               if ($signoff == 0 && !$non_standard_signature) {
> +                       if (ERROR("MISSING_SIGN_OFF",
> +                                 "Missing Signed-off-by: line(s)\n") &&
> +                           $fix) {
> +                               fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
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
