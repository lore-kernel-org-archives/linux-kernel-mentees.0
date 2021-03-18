Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932EFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 19:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A2A64E99
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 19:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A2A64E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67F260610;
	Thu, 18 Mar 2021 19:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNxxww31sLak; Thu, 18 Mar 2021 19:06:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 926026062A;
	Thu, 18 Mar 2021 19:06:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70559C000B;
	Thu, 18 Mar 2021 19:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62494C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C5C34ED4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGnOkPwOMRSS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:06:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 484614EE09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:06:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id q13so6266031lfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiUtC/pB3V/d/b9KZ0SslhB0R0O2v49KVHoJYipb5Z8=;
 b=aav/Cwh8yEsoTabw/0Xf7CVf60y1hq1ygYpLOzSEEpR9Jf3GAVIUcMDaCKq4c+BKs9
 g1z3HXCRga+upuPcCV9s+AuRWumuuSl+rUH5rYkSeK1Tm314XBAJvApZ7X4czqBeqY6a
 IRKJCARRov3X271sqSxggA0G6xIhwqgXgUfS35ts315jE+WZfIaZBXGde4xG2Ja/4FWk
 SXQizpXIXwZLwU5sXlOGxq7tbXUDE0V/J5xZBA1rCsDPcND4UKec2Wn+8t7E27xgLHcj
 FvJ/xYlD3YEG0vi9zU/0s6+/s5QbhahqJ3q07AEvG9rRtCPM1ka6lag5F9se3hignXu3
 EOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiUtC/pB3V/d/b9KZ0SslhB0R0O2v49KVHoJYipb5Z8=;
 b=UuqCa5O+awyECOgMl+urJlnELMlBzd5kIOUEBF03dunk7Z4pKcRI5zBJl+IaDE9ycX
 EiOxHUxK1p1QSeXbEjON89FTgjK4EEGeQFzPmTrm6OkGhIZ2PAqioHkPUlrRNkq2CJl7
 R5zOCX3/Zo1km+eoOYiw7yrmAcqUU3wm/9yJGtkYAZPvqEgintpA+5JyNJ0QiPkak/HH
 B52pB+GijFgVlC1lxjc0CiUkZmIWtVjkPRS2QA+ALQd/lhEUfjuW1cG+ixT2RMkFq2uu
 puC8K7RNgNa9knPDuMPZUDXtyO+3RHYo1wCOO+prfF0qqDtpWtkoAs2ON7nT4p/QQs0G
 v8zg==
X-Gm-Message-State: AOAM5312q2fC+hdpaqbfoIF/BpUGVS+srnM6VuXggws//kSFPxZJDjOK
 EiJNym2322q1NqX34h5BSctGr+HuEpJJwfFmbq0=
X-Google-Smtp-Source: ABdhPJzHsbxRfXNZ3ZpSuIutuRHdIRld2ioGhWtOIxAHzM4sWhOsWmfkGSJ1bxBrObDpqdY6jdrzyU549QPl8Jr/Gqw=
X-Received: by 2002:a19:3804:: with SMTP id f4mr6427395lfa.117.1616094369837; 
 Thu, 18 Mar 2021 12:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210318190303.4454-1-dwaipayanray1@gmail.com>
In-Reply-To: <20210318190303.4454-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 19 Mar 2021 00:35:58 +0530
Message-ID: <CABJPP5CWYv7C5kMPZRpMEG8cqUnsdib6KUDfy-oEC-bmXOOnOw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: document all error message types in checkpatch
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Fri, Mar 19, 2021 at 12:33 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> All the error message types now have a verbose description.
>
> Also there are two new groups of message types:
>
> - Macros, Attributes and Symbols
> - Functions and Variables
>

Lukas, could you go over this when you are free?

Also please ignore the v1 of this patch. The checkpatch change
was accidentally added to that.

Thanks!
Dwaipayan.

> Rearrange the message types to fit these new groups as needed.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>
> Changes in v2:
> - Replace 4.10 kernel doc links by latest
>
>  Documentation/dev-tools/checkpatch.rst | 316 ++++++++++++++++++++++---
>  1 file changed, 278 insertions(+), 38 deletions(-)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 2671e54c8320..8ccd63a18e10 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -280,43 +280,12 @@ API usage
>      However this is not always the case (See signal.h).
>      This message type is emitted only for includes from arch/.
>
> -  **ARRAY_SIZE**
> -    The ARRAY_SIZE(foo) macro should be preferred over
> -    sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> -    array.
> -
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
