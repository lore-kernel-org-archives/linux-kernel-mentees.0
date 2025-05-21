Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABA221D9A
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842076; cv=none; b=cQfUyxdAAvVC7bp1TOK53XbxtU1NuA0oL9BtDkM+ebmOBbCva9bgbyefjpyfb7ddz6E/6nK03xCLfwo370J5G/gUfRMZOVGaVkC2SF6Mxuwm4Fe+Z4zJTvMBDhNAIvEeUpKixe9I5X31cMWt+1j58/Cy7QZoVeDw0mo8oXD12xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842076; c=relaxed/simple;
	bh=jAtWLy1ghlyAQZQU+F7/CpguGAIrpkZQWbVBzpNAcm0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=l/VKWcTTYfu7yQQzbN73IUHJXZxMdW+TOdwTHw9coKlDKHwYVLOkj09IreM+HYTONfJHUxkCLQZJXLWOoKXreC/One9O4Iq59T0c/kiKf+Oc11ib0nLuej7LGA8H03zcOuQNStcwWC1hwAmYmSWYAnpNLVb3RJGETCpZhBQFkSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Ey2DkYy1 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Ey2DkYy1"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dc64b08343so18330435ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747842072; x=1748446872; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=Ey2DkYy1few3pT5AIL3z7zDtLHXP6FM2vKg6uuArpYLbNviKuIaglDN5tXo53J9Fe3
         Bq7R376rv2S9dC6pGW7lbyQi6PFIL7NBUHr6ho+ELUstGoS8NvPY0AuUcY52NIdBaXo/
         LPq2xv7W7wlEUbpVMMuIxhHoY7VV5BVfbUeZt7Dr4d26lSqg8+HC2PcKfYGdsBg5eML5
         Bn+M3xoqbVwZNgpsFTIttRiR2u2BNX1k2JG09aWZun6WxCepNvOE6FdSaZXBmdixO05O
         mgWLEr3VHP5m9LZyXi/2VLIDY8nqC+nqEne5iJhCEhGXXfx06EBWOOQTErdqDM6HCp4d
         9w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842072; x=1748446872;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=prrZOuPCRF1Xuan+sIpK+h036/SmubxfEAYOawObTAlwLgyE9fTMmIDWMysqGFwX94
         KQvczEMXvtt7EPWJtLVEd2iRCm7R6kavBQpPg5ybkt3+mP4/E4qkis8GKuCEoNbR/vOp
         3OAyKjx7xFtFE8dXdjZIdyTXyUKGV/CDTxc+NtlGee9xvv4z/BOHojNsYkbdvmfg+iFO
         0NmuNqGuBOk78PU+awuty/Ir5vEKZtgBqdX0tMJbgK9rLtqwHCpNyzZ8kfcHwcUEOteS
         m0JPywqahw3bJYIjsDRVwyDlbcKyGQhz4txl+mMgRsp+hgXnV1VpSmBJ6nvuecjoT8GN
         2tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ib4IgWjZDca0z2J9BDtmbZKz/5H11Z8zCgLcTxnah6cHEc/xoop7eBYv5ioBh+5nYyEHqlhFMbqC5RMC7nZHotmCyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQoR83BsvwH50L4JdoGNXuVEQUhV3NFCKUfIoLB9gPzOzyvWc
	rSON6Vj62qgfB5me+XcBgmmkASiDOosLJtqW8FV8JMimoLrgr2CZd8cUZ2U+q5hDA04=
X-Gm-Gg: ASbGncuzAp4DTbFLukMKl/YIW9dZ0pioC3Z3LhJN6l+VDI34/kBRbXCTRkIRFIXKFWk
	5ETgbqh3KayCwQkF+26lbW1OJDZLS7UpwieUfnNAmK7VG+UjZ7mlcMfZrKnK2cR5s7siRuZDUqX
	VO/bs0h2M9XXEjTNdjJzZnApUmaUCA6p2Y46MyUpT0pLAtjx0dnpCgd+3vAePrwVN5TiqCZR46y
	g2KyV5tTo5FyA7wX3WU5Qd8E9mZgF5YHGiYPEJurkT4MglaHzxLB4+HJ09Xr/+74z1HtaQ+Lksk
	O4HsI5vNVkA2j4yosdeRdxd4rnVKRBJE8r5vL78fqB0P4nhT
X-Google-Smtp-Source: AGHT+IF1a/jzMbO7F6gJPzIDd9TjYyvBG5uSioYyo5MOYniqFNvItm2zBIXk5D1DSiZdNl+D5LzuRA==
X-Received: by 2002:a05:6e02:1a2f:b0:3dc:7660:9efe with SMTP id e9e14a558f8ab-3dc7660a1b3mr97393735ab.9.1747842072167;
        Wed, 21 May 2025 08:41:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4af638sm2638635173.105.2025.05.21.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 09:41:10 -0600
Message-Id: <DA1YAY60022M.2IRYOYRE5IEVL@brighamcampbell.com>
Subject: Re: [PATCH] docs: powerpc: Add htm.rst to table of contents
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <shuah@kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "open list:LINUX FOR POWERPC (32-BIT
 AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517210757.1076554-3-me@brighamcampbell.com>
In-Reply-To: <20250517210757.1076554-3-me@brighamcampbell.com>

On Sat May 17, 2025 at 3:07 PM MDT, Brigham Campbell wrote:
> These changes fix the following error, which was introduced by commit
> ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the

After submitting this patch, I've become aware that it's customary to
add a machine-parseable "Fixes" tag to help with backporting and
bisecting:

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_=
HTM debugfs interface")

> repository without any reference to the document.
>
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in a=
ny toctree [toc.not_included]
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/po=
werpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs
>      imc
>      isa-versions

