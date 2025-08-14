Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DF225E44E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156728; cv=none; b=hcffIA+1lPINRkG0KUcPfWrdxqLoITXyzAF8Eyu2ADRlj+9vY8OMMnw5nkACN84QCdeKay00FkEhRqngYqfWoi1hUTO5SuuJKI/LGVmxqNXQmOMK2sVltvlBRPWOl3jAKO7G69e0oZqSosb9z2PE4IbO+VYh4cf8bERtYJuYT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156728; c=relaxed/simple;
	bh=UFjqCGjC2T2l58LjYWnnAMaLc2HwHVj0+K2qeYcVEWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjGCEhiaaBDTXWokyimrYLc3FbX0JSjU9EVEIn0b7fqg3KFJ0p8w8El4HcQ0+4u9gBGlmycgbBWzXCLPh5+0xTcYEwNiL+InyoGRHzoQBaY5cg4/jBA7Jx9rdi9r4Oi8Y4zaRzX+qYQULlDiorRUg23QUt6REZet7aOC/NGlOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTX1DEKm; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTX1DEKm"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434A24015F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIGGYLDSABbH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Aug 2025 07:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DDD5400A2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DDD5400A2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NTX1DEKm
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5DDD5400A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 07:32:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6188b7949f6so1251229a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755156724; x=1755761524; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jxf+gByVA4g5tMcDiCo6taSZy/O6rnQzhuXufSwiDk=;
        b=NTX1DEKmr6SSAQti2oEf4uDNI4UxQB9L29qki7Dc7ToVSqJXkfFp/6AW2TPQJMsieC
         6FJW6nml6rKjqS0BKL9RFxinlqgpxvAzcL1efIXQAqm2l0vRPW74rviF5lj77cCRej5J
         A/eaR/wIic0bvEZePN3yb6NUG8GWi9llh4IccDUp4Za3fT/ovUU7rUltvukA88XEjxww
         YtvylM0k6adGJp/h+Weu26YHCLjpI1k8RjzQQg3T3xNBeBon8vE1Vp51bhhc0HYdlrr7
         M9cCL+cNzWAMbGyRcC0stiWo06GwQ32oib4Nla7W9b+es4Wivsa7qDAjhO/wMUZC5gQa
         NvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156724; x=1755761524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jxf+gByVA4g5tMcDiCo6taSZy/O6rnQzhuXufSwiDk=;
        b=g4kMTCWVDtRUc7g9cRQcacuAdoj+mafRs5TFlcuqo34biskQCJM/7HeLjp7yPTdFrS
         dnmgxPAquF86C8VhZdfc5XXdxDjKB0tkUpf4Qv2TZG0662xtHjWO5BdkAbl9QPMG7ONR
         lmMdD6AerM8Rvi1jc5uL7BL+U3dzsD1I/KuPfjEW9Yy1BkHmA+mHokIzaWiGnbVzmmvZ
         52KfwhvMirkHxhMwLc1/9wT9R7ZvDJBCTu0WIEtYatQDoCR9J1uTs804BLnL+clgsAW0
         dNHl05a588SOeRV1g//BNaK0gq7bsBDIvnFP0/sj3+Q22RL7x8wcki6VbHxlYfkBRie6
         Zacw==
X-Gm-Message-State: AOJu0YzlrnsrH8jdodebjAUoUaWa4Fjra7T2H0h31mUnT5sP5ddxAXkG
	Z0bHLmFBCTwTpd8bYrlN+hz5lnu4qpy/oCqcJAcVM+HJiPpGgds9AbcaHvQfnc8ci8EQqG8IZ9G
	Dj5u/tzMxTFItf4vzakXK8R54g7AlRSQK7Q==
X-Gm-Gg: ASbGncsN8Z2Z9rZFU9d9SDDvdBFuItLdGwuw8vUhQRycF+Xz83G+SJ+zUI6SbQ2lDuR
	kekzbzRS6pnULO/GbarIQxjDu2yNIdXRnTF31UP9axLt9EaljTI3yv5sEXTC6Ph/yJ35jucYnNT
	+Row5qQzNOcGQ44ntlIcIAwPQiTDIwJ+3R0hzhAnUSjm0YOI71USMiLAIXttCzNl6exJnmiAXdm
	UlLUGzBfvfYb74MG6XodLe23rZfQZuBluaCD/v8
X-Google-Smtp-Source: AGHT+IFEAn9SVGPoOARPaBpRhZZcOuxqY0yT0kkof6z906Xi442wWsLLVpa2Edup3PkthuPs40GstPQgRgpUAZWEJBs=
X-Received: by 2002:a17:907:3e8b:b0:ae0:b7c8:d735 with SMTP id
 a640c23a62f3a-afcbe212092mr141721966b.42.1755156723976; Thu, 14 Aug 2025
 00:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250814041610.28171-1-vivekyadav1207731111@gmail.com> <29ecd4d8-2af5-4854-b4fa-2a1d6b312e9b@infradead.org>
In-Reply-To: <29ecd4d8-2af5-4854-b4fa-2a1d6b312e9b@infradead.org>
From: vivek yadav <vivekyadav1207731111@gmail.com>
Date: Thu, 14 Aug 2025 13:01:51 +0530
X-Gm-Features: Ac12FXwg-LoK2P3dpIUsjy3b1uUSFw1tJtRL2_zQFPhYCBkl5ubZMCIQ4YEEAGY
Message-ID: <CABPSWR6f-H4KBm0x8NT4XrF6bcvyiLpVQ2pzF8NM0fNEfx3Q8g@mail.gmail.com>
Subject: Fwd: [PATCH v3] kernel-parameters: fix kernel-doc warning
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,
FYI

~~Vivek

---------- Forwarded message ---------
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, Aug 14, 2025 at 11:47=E2=80=AFAM
Subject: Re: [PATCH v3] kernel-parameters: fix kernel-doc warning
To: <vivekyadav1207731111@gmail.com>, <skhan@linuxfoundation.org>,
<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>




On 8/13/25 9:16 PM, vivekyadav1207731111@gmail.com wrote:
> From: Vivek Yadav <vivekyadav1207731111@gmail.com>
>
> Fix kernel-doc warning in kernel-parameters.txt
>
> WARNING: Possible repeated word: 'is'
>
> ```
> [command]
> ./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-para=
meters.txt

Thanks for that.

> [output]
> WARNING: Possible repeated word: 'is'
> +            The format is is "trace_trigger=3D<event>.<trigger>[ if <fil=
ter>],..."
>
> total: 0 errors, 1 warnings, 0 checks, 8339 lines checked
> ```
>
> Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 747a55abf..302145870 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7506,7 +7506,7 @@
>                       Set a trigger on top of a specific event, with an o=
ptional
>                       filter.
>
> -                     The format is is "trace_trigger=3D<event>.<trigger>=
[ if <filter>],..."
> +                     The format is "trace_trigger=3D<event>.<trigger>[ i=
f <filter>],..."
>                       Where more than one trigger may be specified that a=
re comma deliminated.
>
>                       For example:

--
~Randy
