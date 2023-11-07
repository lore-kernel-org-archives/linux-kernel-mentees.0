Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA18358B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JtLNtThK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318B340983
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 18:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318B340983
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=JtLNtThK
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIp6kL1U2IIR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  7 Nov 2023 18:37:20 +0000 (UTC)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1545D40981
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 18:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1545D40981
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-45d9ceeb8b8so1711971137.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699382238; x=1699987038; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGe+8KAfcoYncVaF1WDluZGp6nq86LlBM7gCmB2IIRo=;
        b=JtLNtThKjSAA1m1Ow+9/r+GbB++Q5NhNOpGxRKPH9ZrJf2GRIknHwxRHUz+xa/P5Sj
         1+bvXvSAu61bgzb8GpRpQdXen50/1wnm1Na4zEQUz3iA/5x+aqeEugq/VjBcS44Z2cp/
         j3UPR54D7Y6tCyGNmpHj9VSbngB6Ct0r+0+YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699382238; x=1699987038;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGe+8KAfcoYncVaF1WDluZGp6nq86LlBM7gCmB2IIRo=;
        b=M880iuoa941EjjPLHHLk6I+lNDEsxlMAwgHey+QSmK2rMTttJBlSmBIPwBrMaL+Jo/
         O9qyK9NLH18m81cH8f1SkwQyQ96sPRyTEdiZ7cOOQEcJz2MJZ01vqh8cclGpDz4pqrfq
         dzkqbCuy5V717Neg4OPlCPdYWcRlL1s7iEM9LX3FV9LBbq2yU9bAKkdyCpwowilVKj3o
         rEuIxCCWHCY4f91uNqY3pPRv9cTS3eHPyKOopoTuij9xhnAdj3rMKG2mgHUSVTZUh8Sj
         heiolg8E+uaA0mJuKd5sLujCGg5gAeWfaiqaSW0x/dCiwg9sCK6A+Kzm18s0ZeA0w4Ma
         SwOA==
X-Gm-Message-State: AOJu0Yz1QlHSdREJPlBq2Gxgu/w3C2TF8eBzfcjMuQj7IexgFoHT5VB5
	jkEKS5GoP0HiqhnZ45hwOlBgNpuFdoWVxLnblfbaOg8dN6LI4G/Vf8w=
X-Google-Smtp-Source: AGHT+IG9yU5+mm6OtCCxWQHd1OGrWt9NcMUGn2or/vjZZCOee2u7G4XP8plVGixVXRCXeWwEn1uba2hMKFe1IFKoWtM=
X-Received: by 2002:a67:ef5c:0:b0:45d:73a7:121 with SMTP id
 k28-20020a67ef5c000000b0045d73a70121mr13823605vsr.11.1699382238543; Tue, 07
 Nov 2023 10:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231101-piculet-of-flawless-abundance-acd6cf@meerkat>
In-Reply-To: <20231101-piculet-of-flawless-abundance-acd6cf@meerkat>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 7 Nov 2023 13:37:07 -0500
Message-ID: <CAMwyc-TzGmNZ7Kq7-kmTv4M=hu1A+t76KsVJ8w_YaLdf3tbyDA@mail.gmail.com>
Subject: Re: PSA: the linux-kernel-mentees list is migrating to lists.linux.dev
To: linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Nov 2023 at 15:47, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> The mailman-2 system running on lists.linuxfoundation.org is being
> decommissioned, so all lists currently hosted there will be found new homes.
> *On November 7*, The linux-kernel-mentees list will be migrated to live on
> lists.linux.dev, but the impact of this move should be minor:

This work is now complete. This message is partly a test to ensure
that delivery to the old address still works. There will also be
another test message to make sure the *new* address works as well.

To remind everyone, this is the impact of this change:

> 1. The new canonical list address will be linux-kernel-mentees@lists.linux.dev.
>
> 2. *The old address will continue to work* for the foreseeable future, so any
>    existing conversations can continue and any new messages sent to the old
>    list address will be properly delivered to all subscribers.
>
> 3. All members will be automatically subscribed to the new list, so no action
>    is required on anyone's part to keep receiving list mail.
>
> 4. The archive on https://lore.kernel.org/linux-kernel-mentees/ will be
>    automatically updated to track the new list address.
>
> 5. The List-ID header will change, regardless to which address the message is
>    sent:
>
>    before: List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
>     after: List-Id: <linux-kernel-mentees.lists.linux.dev>
>
>    You will need to update your filtering rules if you filter based on the
>    contents of that header (on or after November 7).
>
> 6. The mailman footer will no longer be added to message bodies.
>
> 7. Subscribing and unsubscribing will be done using the mlmmj supported
>    commands, documented at https://subspace.kernel.org/subscribing.html

The archives on lore.kernel.org/linux-kernel-mentees should be
tracking the new list location as well.

With any concerns or problems, please reach out to helpdesk@kernel.org.

Best regards,
-K
