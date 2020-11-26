Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB7CC64E7D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:00:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A512145D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+QHYt+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A512145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 460F520390;
	Thu, 26 Nov 2020 10:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWd-vu3LoNXw; Thu, 26 Nov 2020 10:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 42F1B2038D;
	Thu, 26 Nov 2020 10:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2889AC0891;
	Thu, 26 Nov 2020 10:00:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF8F3C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9383287814
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Y5+R1KNtCpP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABD748764A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:00:06 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s10so1240161ioe.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 02:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2okPvb8u3UwU0Ob2C2ZWO9OuVD6+/+9/yFExaiIHqM=;
 b=S+QHYt+ARkpB4lgswOC5gJ2FUzJr/PgA2KUjP/+qbEpcEjCxac5+Xw0I+tyg35nHWN
 fFeTboud4FKBLi854RN+UKR8QbaO1xhZG19xGeDZCL5vX+2AGVc6xSq7Moz9oIDohm8E
 y2bk1mNYzdQt7ELyXz8ny4dgTU5UWDnSA4FnmyU3lMBl/ROTsbc1lwXJPqr8FMVFHbBS
 H0M0eP5oor4hCVencLwf7R17/u9kbgPzn85IVO2ZEWe+oxaPLJbiFcM9hcXigfgiYSTa
 Z85ZQbrjPcSMt8G/P3ih2qcYTUMcMD9mP4zZrkWlF8w7L2FYMqccuKLEKUO8qu+carpb
 ZuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2okPvb8u3UwU0Ob2C2ZWO9OuVD6+/+9/yFExaiIHqM=;
 b=M20OguiYxw0zRgIh4RPEySMTlcfGzuALJyx3RhxP1L13tGFqYc+nNbLv5OkAODI7HC
 A8J1o75fBHUABfDkHbWrXubwZ4neH7bJ/jaeyAFc1yd6Vl0G/wjg3ltK0wGoz08om8rh
 ZgWwhaQ/jIlND3dGQq4aFu0Td4yjJRrdN9s/RYrvPmUotnRHtfSZhF7YMXoDEMPHmpHW
 6yreEC3LF00B4cqmogit59SYi2HRpvtpZM8Y4hQ0yEuxvEBrHPm4Yffpd9UYdXwkFqv/
 f3iUQHZcd+T2cYhLOFli9kdOkz1znU2mJmbHsFMxykVQrM5zuDCVGiwgqF8Pk7Okax6X
 SNiA==
X-Gm-Message-State: AOAM531TT75WKFu7w3iWtLmZOn7EpoxJ2bwoztlvLw5s45ZqAhSULYBv
 qNaZ8PvzumXyk2pY/ny0Hw0kP7CNJt7qFljYrX4=
X-Google-Smtp-Source: ABdhPJx2Yz7yROc9YR4UT0+pOTOzv41K548AZ3aqEEFe093N9HuRoeikvHsLIaioRvlKcm9qSHQIljJwNGVOa1oM9es=
X-Received: by 2002:a05:6602:22c7:: with SMTP id
 e7mr1763756ioe.114.1606384805793; 
 Thu, 26 Nov 2020 02:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20201126094727.43265-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201126094727.43265-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 26 Nov 2020 10:59:54 +0100
Message-ID: <CAKXUXMwR4UsPgFKh7V=CioYOJJe7Gr9VzDcvqpdc_ikOzKkt4w@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yepeilin.cs@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	TYPO_SPELLING check for words with apostrophe
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

On Thu, Nov 26, 2020 at 10:47 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> checkpatch reports a false warning for some words containing an
> apostrophe.
>
> A false positive is "doesn't". Occurrence of the word causes
> checkpatch to emit the following warning:
>
> "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
>
> Check if any word character is present after the word boundary
> in such cases. If present, it means a subpart of the word has
> been matched and a warning should not be emitted.
>
> Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Looks good to me; I am wondering if it is useful to point out to
rewrite this to "does not" because commit messages are "formal
content", and not so much spoken language.

Lukas

> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d1ecb852f384..47b964984ce0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3106,7 +3106,7 @@ sub process {
>  # Check for various typo / spelling mistakes
>                 if (defined($misspellings) &&
>                     ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> -                       while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> +                       while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b(?![a-z@]+)|$|[^a-z@])/gi) {
>                                 my $typo = $1;
>                                 my $typo_fix = $spelling_fix{lc($typo)};
>                                 $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
