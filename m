Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B0CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:52:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575FA61158
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 575FA61158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EFD0402F0;
	Thu,  5 Aug 2021 13:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDhpIpYpIA3X; Thu,  5 Aug 2021 13:52:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 03329403B2;
	Thu,  5 Aug 2021 13:52:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B80BFC001A;
	Thu,  5 Aug 2021 13:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64B9FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E6A2839CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 761Id0U0YY1M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:52:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C7C0829AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:52:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g30so6975638lfv.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T91zpFw4U4qpUpC6t8uiFmdt7CHuNfCgWZFrYGcM+n4=;
 b=N8B8qJd04yAl9Il3r9mYEWbMSGD+ARFaFPVoIXOcGZsPViboXKPbCUHosOJ+Yl02i3
 Qbrr8KNoUKAeY90E8i9l6DUehqOxcBTYU6azyTKMhuVVpeUZbFYsj7g2Xw7zWW7isSDn
 glfdI1uuepVwkPvWieJviNa5NDRadzKGBt8matoNZ6nTzDqqz5FHF0wKO/Qphf3G5n0p
 XQixYAfrGTQYNwlHt4abCPKYb0ik+rwm9fD8ZGYLYmhhjmnmAAveq413L5zGawAXnl/I
 bAMlWmvAhHYR4b+HfL1NlzVpaNHOcY9N7eZi4H9gDqq1qYHGkXgeSkH3uYZiY3vCKfWp
 GBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T91zpFw4U4qpUpC6t8uiFmdt7CHuNfCgWZFrYGcM+n4=;
 b=ntwBYa3QrVwv/DXXgD1GSHKXlHqTnkdusFVtDeV3F2nNtHs+IbkRNUsdswj7SSgRnW
 yAeJb+wTPzq/sWJMHEs1nOlkkG+6aoZ7R49RLDFFj94Is2r/RabCHuEoLTCFPaE2Z9Em
 jYZwATbFlWDIB5anhTKdstRni2jfLq3JczJ7cLkgEBUgO1JSdQtdhrj62XakiuIDAuPw
 Fvf0j4Z5IqclNZLtch7shDjHRodgoV+ed6J2C31BfGmy/TRG78eWfCT8y6fMsTf3bqak
 8CFf+cND9RtJR0dxYuzYevwYo64QQcMUF4XW7No6G4wauEZ6Mj6c1M8XgRkcmALpswrB
 3FhA==
X-Gm-Message-State: AOAM531fav85BuZNUJ8DXKIMWCjjPZTIRW3SceE0JPgzAlH9LlGDNXJj
 F3Xx9g3SuMiW6PBe5rkR09XJEFP++5LUmlkPnQk=
X-Google-Smtp-Source: ABdhPJxRqwVDy49BPRSWqOfGJjaT4UsMxscO+u9DHWjrdy/ICNKSouznearKL8Z4s8hfv31rv4CDEHkDY5KQ8chpXLs=
X-Received: by 2002:a19:ac01:: with SMTP id g1mr3936526lfc.301.1628171522371; 
 Thu, 05 Aug 2021 06:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
 <20210804153134.2794-1-utkarshverma294@gmail.com>
In-Reply-To: <20210804153134.2794-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 5 Aug 2021 19:21:50 +0530
Message-ID: <CABJPP5C42kH19aMt6dtK0auypE0HWen4YWMZDdC1xgVdFOGc-w@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: Add SYMBOLIC_PERMS message
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

On Wed, Aug 4, 2021 at 9:02 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> subsection. Checkpatch documentation that recommends the user to use

Did you mean: Checkpatch recommends the user to use octal
permission bits...?

Other than that the change itself looks fine to me.

> the octal permission bits instead of their symbolic macro names.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..009957cda 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -957,6 +957,12 @@ Permissions
>      Permission bits should use 4 digit octal permissions (like 0700 or 0444).
>      Avoid using any other base like decimal.
>
> +  **SYMBOLIC_PERMS**
> +    Permission bits in the octal form are more readable and easier to
> +    understand than their symbolic counterparts.
> +
> +    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> +
>
>  Spacing and Brackets
>  --------------------
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
