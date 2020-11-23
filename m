Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3ED9C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 09:05:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CC6A20731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 09:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dprj/NYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CC6A20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F78685FAE;
	Mon, 23 Nov 2020 09:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ddt02DXcpghM; Mon, 23 Nov 2020 09:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB01E85F6C;
	Mon, 23 Nov 2020 09:05:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9E1CC163C;
	Mon, 23 Nov 2020 09:05:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AC69C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4AEBF8672B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xe1JcBZvqpti
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:05:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BDFFA86726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:05:21 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f24so4283203ljk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XaBqDDPJL3HLBnms0Ixvz/F1NwF3Bgl8gVECLmIQiI=;
 b=Dprj/NYgpo2wGwvJcQ/Ukf6Nzb/3auYXGzfjUbwtgMzxL9zR9LzOO3UCG7vh+0yiJN
 Of2JW+1mupBMXSy0EZXfPJMw8j+ZWtaK4EDToqoPxoa87s9s9rTDYxu3qnqHpCB+aFP5
 wHCdhvby2pWZxW2KNCj5PaweJhcrTdfSGcJTNFgCERpq8CX9lo0QViSvQfxkLXuyFO+l
 TPb2IREt3oZeWZmYCfisjuyrRQ6zJ5T8V6/aSni22BARZr049BLKvMQVBRERIOzH6QUO
 ntTP2Mv859iNRdEmfaHIQ7+LejNAKNfDFyinrlQ2XQWjceLdtfnBB96DAhPti52GMLG2
 Bz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XaBqDDPJL3HLBnms0Ixvz/F1NwF3Bgl8gVECLmIQiI=;
 b=E/XYX2dovLEPZi18Gtx9HxXXt0e7iNAwrlpKKvb6dAHQfDQcQ3if9NxiapgIN6PHUV
 8MmQ9f57Su/16uwDuF0gAZQM986k5+pqKSD+Tizywil9QPX7AHKSQdOC3lLm+buBh1TK
 pCzfzKl2L9we2QDh+hPFEmFI+JShVzt9mJ6noK3F2/FXf+tGV1TBxmC7P4RGP8pty+eN
 DtryBxcPUK3YrPKMyjhnRLvajDb/t+UNYx7qExi9mtme9A7cXRCWC3k2OTG/HtRJG1sP
 oBoUh8FuspTKZu7ZGjxe2AAOUvBkcmCcaO4LYjZYyLzGiYxP0UHSurJx2vaIUDBBkkdW
 DmMQ==
X-Gm-Message-State: AOAM532YtC56wLN3ppOCxdk+YTm0jTeVSxtFYy5FTA+og74YElL1Zt4y
 KeUgjreJGZhiFdRiUt38p28veyAr+GorW24cwuY=
X-Google-Smtp-Source: ABdhPJxUl6QJbAo3mZz/mFi7DkaXpyrgX8fJfx+qo+dg1t23qvjkhTnp+OvGKTc71ZorK7COmj5OsEtbaia8UJfGvV8=
X-Received: by 2002:a2e:8143:: with SMTP id t3mr12002350ljg.269.1606122319731; 
 Mon, 23 Nov 2020 01:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20201121212414.170840-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201121212414.170840-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 23 Nov 2020 14:34:49 +0530
Message-ID: <CABJPP5Bg_Ewgsu_J+Bz-VGaa+D3W-wRg-_2f-590HZWLL-K=5g@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add --fix option
	for INCLUDE_LINUX
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

On Sun, Nov 22, 2020 at 2:54 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Provide fix option to INCLUDE_LINUX check to replace asm
> includes.
>
> Macros of type:
>  #include <asm/percpu.h>
>
> are corrected to:
>  #include <linux/percpu.h>
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>

Hello Joe,
Could I get some review on this if you are not too busy.

Thank you,
Dwaipayan.

> Changes in v2:
> - Use \Q..\E quoting
> - Use @ as regex delimiter
>
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0da6422cd0fd..e4feb91a0fe4 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5468,8 +5468,11 @@ sub process {
>                                                 CHK("ARCH_INCLUDE_LINUX",
>                                                     "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
>                                         } else {
> -                                               WARN("INCLUDE_LINUX",
> -                                                    "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> +                                               if (WARN("INCLUDE_LINUX",
> +                                                        "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
> +                                                   $fix) {
> +                                                       $fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
> +                                               }
>                                         }
>                                 }
>                         }
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
