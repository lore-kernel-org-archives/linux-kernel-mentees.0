Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D613BC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF2960F9C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AF2960F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60B20400CE;
	Tue,  3 Aug 2021 21:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V49A-5KC94Mc; Tue,  3 Aug 2021 21:49:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6579D403E9;
	Tue,  3 Aug 2021 21:49:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9A74C0021;
	Tue,  3 Aug 2021 21:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9346C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63A960897
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfB1fr8EvwyU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A001260875
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:49:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f42so959767lfv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 14:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpGq+BZB7G6UBKKAE2n/nGPsayfiMQHp07NHj66Q1FU=;
 b=USHiVCqH3dpHquj1AzSHndjMAyz7ynV1eghHLMwmmFCCYU72q3gfk8AHG9Yzv0bQcn
 cgql+FQx3TPvDlLAOVQM5OACh6k6xL7q2oj72i+9NLllHw7W349FI25Mc1I770TCbaX/
 lqG+OS7LUYv8SKvtbakAHPwjrqWSOIx8cEPVeQz3D6mU1gjwfmyrVE2UsI/0sM5+y9Hl
 bA8Er4UBiNipFrSAaQGh9UCDpz5UABiKFAXvdHb2MnG+3XrLEaYieZqOAvZ/M73qR8Yt
 v4wCAA9SNTF4G6Qrd109EAidi8+VxntCPehhjxiDVMTV0A9/A8M374WI3hNVBWn49VWD
 tReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpGq+BZB7G6UBKKAE2n/nGPsayfiMQHp07NHj66Q1FU=;
 b=Z4FW+fAINmrnGf4u16bUKvMKJu9RSHj7tv9RHnGlhQWQd/eBUd7L88+NyvdUKiQRj0
 WZc0YZ/bVprYx8WN1D1tU9fuoOzr/BeNKytN6KnsLq5Q9gkIIIZjpBLIxp2i+wvLXmoJ
 LOlCjRUyxRwmP5SrXS+GmzOdA7AzWl8Bb8gQxqrA5vh+PoOEV4W0nio+LDkjyv8F1QL2
 q9qodY7mGsnAWPiCwFztQZKvLACllcAqH4SH7g0nRW+TYdH5FOUvbPkD50jj+WvdcYJl
 pKkwMd3uMqeuSF8aGso66jJ9m8tbx0PYa/DBy4gSaGzQxqfOzcz2t15XidlbIpANkFyx
 XqZQ==
X-Gm-Message-State: AOAM531Z7tbYIwBSVEDNrzk1SfVw/UC18PUnlLlMM9XxtsAKMJ0qAz0b
 1xcwhT6ZWSVnKJPB/WGz1nw6SL5GjiP1bmVmjY8=
X-Google-Smtp-Source: ABdhPJxugzSRcpGdNnUtrs+e9pTOmlGUjROGwkQ9XcJdoKFAPx4TCtpoSRMutDZGu9yaY2nWarxnzfl9pf1Fs/eTqT0=
X-Received: by 2002:a05:6512:2244:: with SMTP id
 i4mr18481548lfu.64.1628027390425; 
 Tue, 03 Aug 2021 14:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMy2V9GJM+h1cEeHSTUsKQ3b=MfXY_jba3FRDNKKo12iRA@mail.gmail.com>
 <20210803213716.4484-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803213716.4484-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 4 Aug 2021 03:19:39 +0530
Message-ID: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: Add SYMBOLIC_PERMS message
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

On Wed, Aug 4, 2021 at 3:07 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> subsection. Checkpatch documentation that recommends the user to use
> the octal permission bits instead of their symbolic macro names.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..0d60f8e5e 100644
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
> +    See: https://lwn.net/Articles/696229/

Please use lore.kernel.org links wherever possible. That article
should be also there in the list.

Cheers,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
