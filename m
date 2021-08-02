Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0820C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 17:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F8761103
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 17:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F8761103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AD6E403F7;
	Mon,  2 Aug 2021 17:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14THCUOw7LoJ; Mon,  2 Aug 2021 17:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0777C40190;
	Mon,  2 Aug 2021 17:20:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA3A8C0010;
	Mon,  2 Aug 2021 17:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2060C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 17:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D36D3403E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXWfW-ssWd9s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 17:20:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D75C40190
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 17:20:28 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z128so3157347ybc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skXRhjVoeVXq9z9dilMd1zzLyvzBQ0LVNqIbMGGng50=;
 b=FcjtshWMsDyEkMLGBCW14UThrG9ZXnP2criirbovyNamThQ+fwwEljgJDsftUAgyWF
 P3YoAtJ9aJnQIgHCn8CW9sMh1ADuL3tXyeCViokOh/K1KE/nIgTKRNM2BESNBZW6kYOe
 oo8cwX3ZDiSiNmKBw3qo/VXrZ1D3nllftEuu3hpyVLO5os5DdT9T+xArnH3FuoSCtPon
 9TnjiuuwQEGkg1caKN4sNbKjTAhX0dxB9F4rIMU8f3+EoaOfnEnz7YakYxgLUFqKSAJu
 hROl7NsQ2/gUn16LPN3iMJ01tlTN2+rA9cmLGKnpv2uNTBwSdhoO34MZ7GJuj8egNc+U
 mcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skXRhjVoeVXq9z9dilMd1zzLyvzBQ0LVNqIbMGGng50=;
 b=Crfn9ZyfbAnDC6qwNkKIXAS5+JKikiypq6hSgQhRbYzekPODNrrg/gS3IHkcirIZzO
 MCemPxq+EhEQAQ/gz8E6oFgLyAV0eMCnYw7TINZHn5jsi1evnERIGwRMXjp/HrKUCm6w
 TevOICprZ60/UogY9yzcFEdBJdiNDnwOqZV9ViGL4RnqD4++yUMSSZETbEXbnBWeWrDC
 M6GL1e0qPGHvgpa/GbCZ/0kjmjUlOdBvL5awB/cLgdAwzh4gqhZQoLbINBOE+MOW0b7P
 J/XysYgf9xr6oRgjFNRGmt82o7QAL705ruxKG6nC/dXC4+tAyNKAbxAt0hI6o1/k+1Ga
 YPmA==
X-Gm-Message-State: AOAM530u+Pm4uYGjuEPTqYfCwFZI8TGs56veaAk697w5jVE3A0FPM2t7
 aZoOZ9jFtLdsDLt2qd+cjVXWg+zIzsi7SbAxKz0=
X-Google-Smtp-Source: ABdhPJwWPZwVOl+YNhppX/ZPWu018lSfw88dYfCNs7HeC7nlxpyk8/nogtXnXVtspqy8iyFUctIytb9urVqfWRU25Zc=
X-Received: by 2002:a25:3046:: with SMTP id w67mr22785894ybw.134.1627924827395; 
 Mon, 02 Aug 2021 10:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
 <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
 <CAMqN5U5Dwd8Jya8ETOffHFtRxaecSHAqJCUjyi+hygjPuSzOFw@mail.gmail.com>
In-Reply-To: <CAMqN5U5Dwd8Jya8ETOffHFtRxaecSHAqJCUjyi+hygjPuSzOFw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 2 Aug 2021 19:20:21 +0200
Message-ID: <CAKXUXMzWSAjPfA70rJhuLkcEL5zJTrcJy2NL=OsoGu7bjabX1Q@mail.gmail.com>
Subject: Re: LFX Mentorship application
To: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Aug 2, 2021 at 5:46 PM Vinesh Vilas Raut
<vineshraut2017@gmail.com> wrote:
>

(snip)

>
> Unnecessary cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
> casting is not require in this situation. It could be difficult to
> trace bug if any in
> there.Because compiler would  suppress the warning due to casting.
> Remove the extra casting syntax before the function call to fix this warning.
>
> {scripts/checkpatch.pl code}
> ...
> # check for pointless casting of alloc functions
>         if ($line =~ /\*\s*\)\s*$allocFunctions\b/) {
>             WARN("UNNECESSARY_CASTS",
>                  "unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html\n" . $herecurr);
>         }
> ...
>
> WARNING: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> #1009: FILE: drivers/message/fusion/mptlan.c:1009:
> +       skb = (struct sk_buff *)dev_alloc_skb(len);
>
> WARNING: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> #1051: FILE: drivers/message/fusion/mptlan.c:1051:
> +       skb = (struct sk_buff *)dev_alloc_skb(len);
>
> WARNING: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> #863: FILE: drivers/message/fusion/mptlan.c:863:
> +       skb = (struct sk_buff *)dev_alloc_skb(len);
>

Can you do some further investigation and research what this warning is about?

E.g., Look at the commit and its commit message that introduced this
rule in checkpatch. Look in the kernel documentation for relevant
information on unnecessary casts. Possibly you also find some
discussion on the mailing list.

Summarize this information and provide some documentation on this
warning with various pointers for further reading and share that with
us.

We found 9 cases in the kernel tree:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:355:
WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/message/fusion/mptlan.c:863: WARNING:UNNECESSARY_CASTS:
unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/message/fusion/mptlan.c:1009: WARNING:UNNECESSARY_CASTS:
unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/message/fusion/mptlan.c:1051: WARNING:UNNECESSARY_CASTS:
unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/net/ethernet/freescale/fs_enet/mac-fcc.c:150:
WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/net/ethernet/freescale/fs_enet/mac-fec.c:134:
WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c:572:
WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
drivers/video/fbdev/goldfishfb.c:241: WARNING:UNNECESSARY_CASTS:
unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
include/rdma/ib_verbs.h:2272: WARNING:UNNECESSARY_CASTS: unnecessary
cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html

Can you please check which of these cases should be refactored (so the
checkpatch warning points to a valid suggestion to refactor the code)
or if checkpatch is wrong with its suggestion and why?

If the code in drivers/message/fusion/mptlan.c shall be refactored:
Can you provide a patch that addresses this issue?

You can find various hints on how to create your first kernel patches on
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Please first only send your first patches only to the
linux-kernel-mentees list, Dwaipayan and me, NOT to the official linux
kernel mailing lists that get_maintainers.pl suggests.

Thanks,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
