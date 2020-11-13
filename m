Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2143C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:34:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607F122201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTs7KJkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607F122201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DAE12877CE;
	Fri, 13 Nov 2020 13:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHAdUdySbhIg; Fri, 13 Nov 2020 13:34:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38B0A877BB;
	Fri, 13 Nov 2020 13:34:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F128C0891;
	Fri, 13 Nov 2020 13:34:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A061CC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7CD3C2044B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qU94NzbXPma
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:34:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 57F5C20369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:34:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u21so9743317iol.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s+IjuH8/GwNNYfXizL51ZXMfk83ORuiIPmeIRUaLZA=;
 b=MTs7KJkVWuBopP6twEClOHYZcvEgnxIZEjawBA4yTA/YulOakxrYTcvggSJJxXhU4l
 R6NFfRlcbMm2hYlCc0uf6ioM0nIXb07UlozcXenj352WkVbCytKD/zqG9GriYhMklZ5z
 d8fboUkw4ou99UNJ1KDFFfriq2fF9ghBDm+zpS820ytsoccgCjqgA3/4LSxHHZQhenzP
 mj6QYZYctSB8uwXyQC+XM8pomPoC08i1lOy2DDfWlygHTzrC0pw+bpvj0mvh+AfPykSY
 jiCyEjUrbrdM9KOX342m6OGo2eCJwO+lu8pqQLhsyDz3gKR0WngMniJ6QBMjaoUPblsF
 t83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s+IjuH8/GwNNYfXizL51ZXMfk83ORuiIPmeIRUaLZA=;
 b=QBnEZQmyc9Vac4cwHxIR8AYWpFMK1RMR058YKVIND/RRV6PVcrgXsTjoXXGF7WEndM
 Yyn/nOUckqLslfXOwFTRp1rCQJ6nQ64kZW0xDQe8znyw5/TQaWeQZYqF/s0iZrW4UI2d
 zOIAazxLoUQeuttohSUncXHXIKRqBxE8RINqj4dpDbXmqDaDt1Bv657bN5uMuV0IHBIB
 YxEEXY2Th3WG7j1Ap/K62EA+xUdyNa4TnvYZSstV3R33Njgg+KP68z4pb48uLvjCzhma
 GpwKY65YcyEFqbwbEa0LR1EpYRBJkQUgsNaLtQDHpcvtYkbaJS1lA3kl3BXkh8fCeKBZ
 LlTg==
X-Gm-Message-State: AOAM5302T6QB/r5FH/T6pcvsEO+oGHTmA+zo+BihrURRvsuBLBasWm78
 Znjl4YoH0SwJDMxbeyd3ArNIu3seGEOO/DFY1+Y=
X-Google-Smtp-Source: ABdhPJz3NgOUsfY/zq5hbVMi9TOEW8/MiAuKcCic5vLFO0p87B/rRrlpUw24ixNuCJgWuBOL7mT73MEinYoT9l6SFrY=
X-Received: by 2002:a05:6638:124d:: with SMTP id
 o13mr1937710jas.98.1605274487562; 
 Fri, 13 Nov 2020 05:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20201113131037.37519-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201113131037.37519-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 13 Nov 2020 14:34:36 +0100
Message-ID: <CAKXUXMwsvj6Y3dEq-eAOyCoJV3qhV7K9U_uRrtbg9u4TV0zyeA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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

On Fri, Nov 13, 2020 at 2:11 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Delete repeated word in scripts/checkpatch.pl.
> "are are" -> "are"
>
> Fix typo "commments" -> "comments"
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Does this make checkpatch.pl pass checkpatch without any further warnings?

Nice idea to check if checkpatch.pl still fulfills the checkpatch
rules we created...

Lukas

> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..e7fd2d6279cf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2841,7 +2841,7 @@ sub process {
>
>
>                                 # stable@vger.kernel.org or stable@kernel.org shouldn't
> -                               # have an email name. In addition commments should strictly
> +                               # have an email name. In addition comments should strictly
>                                 # begin with a #
>                                 if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/i) {
>                                         if (($comment ne "" && $comment !~ /^#.+/) ||
> @@ -7109,7 +7109,7 @@ sub process {
>                 exit(0);
>         }
>
> -       # This is not a patch, and we are are in 'no-patch' mode so
> +       # This is not a patch, and we are in 'no-patch' mode so
>         # just keep quiet.
>         if (!$chk_patch && !$is_patch) {
>                 exit(0);
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
