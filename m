Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BC1A9FAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697653; cv=none; b=qrAj/jFHZvgE9z0RmADzxdd8W7iPSDBw0EsjnFcwMaB3q83ZxYo6P5dHJJXVpIYNxoaaB7ofiDmq90SGgWfk8o5fhr98o8n+AwgGxZSYczostiY0WMslxaw/zliLhyYLpmXG4b5JBlpe7Puhsj35pGj05cy+rlGio5CiAQqwajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697653; c=relaxed/simple;
	bh=qsn2kv1ghHVBAovnnwDg8QvK1e94HdrEO0p9T8nhxIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpR1DB4jl6rj/pGtiUamUcKBMR4xc7CpL4UvRmVGcxtH0oFarnlyz5FQhjZ+cB6LGyZG1bmS/0rzFb5xifn+vg+hUU0XKpPj1P1a9F4UzFmedIJ6V1ur2bPHGK2PPLMAWIK87ONp0jwjRRaiv7UFTbqnTXQ8xQq18CYqhmYwpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpOnz4RQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpOnz4RQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D54682CE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 13:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avg7wa1O-yTq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 13:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77592817B5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77592817B5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hpOnz4RQ
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 77592817B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 13:47:31 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-61bc52fd7a4so534871eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755697650; x=1756302450; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOvHRjntmm1D7/22TeGyMO8ZQan/YXdnVVmnvJDz8zc=;
        b=hpOnz4RQ53+4bTcI8UAjCJ2dWwnOX6V0DL+Wl8DD1metDHPCWFr+EMfkj1qtvTG5qU
         oNO6TDmUaCLA8TPV2gh1GLPUyl3GsqHTiB2mzYJP2ldmrnkLtqvwN4Lq/4gXftlTZw1g
         wSuwQAkxeS7+OFlt2xyplG6e0fveIFfpWvPv619bKB3S7FlUk+gba5bppgW/fM9kiu9G
         VESWUmUtQj0ysuuTBJqTa9dCWdiXSZtzFiM8R4uaxKUXKeQlqxUSsx6ktUx0wGfTvCwx
         4C8GNFq8DivINVn9EgFQXvyvB1u8WSoaCh0pVrcJEeub482An/uTRA7yvufvggVMer1f
         3rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755697650; x=1756302450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOvHRjntmm1D7/22TeGyMO8ZQan/YXdnVVmnvJDz8zc=;
        b=U2pJ7iPw503RkZVANQ1bahNJPnyf87SXgG3Doih0mOnNN1fE0FotIxhT3Hn2GYfm+l
         HGBmlUpYF3saXenYacwkQ4/ocK2tTEfMhvH9jZkr3dquM2hfifPlOYxR8ehxUnkqqd3B
         9Ou2L0UIQlWcBKu26FtZ/CYztHTzUAbc12nXZmh7HR9CmuOJUIzCs3DDIuBYvrlvPWUe
         /Wv1JN5bjmOk5kLRvGIc/ucEtdl0zVMj9ZQCn3/FM/xHfTM/OCS1ehe72R19UQ9LGS2v
         9wLVo3J+IVFEM8zpwa0hnQVN8Z1AaXS9EVVXEHF5BlwZmisvn0/UG/JjWxQWCIMo2wMV
         W3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVbVvpe+26lrq9Hq47sMJwUuRA49QIIp7zEi90V/bnqOj0fegdK9Zw3Yz6EWb5Zg+KzhhwHQD2nunulpTLzxlRw7Q3JIQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDR3DY5Cfpx6RHz/5v8SbEiDAZJ6eLz0V0qEHRtS0jgWGlxIam
	VMQW8qPG4VAnvTn3s08PecouLIS8mXfWuWJjoqw1L0iAYQYOwT6zfKB/Ha9nL8ZRzy0vHFx6w8p
	uJph++9zVGn7inOOAfbd3Qj3pW7OZ3o0=
X-Gm-Gg: ASbGncte24wtGtVglCA8Xu11MocaHKA+6pbQI+rtded1OZw3at1KPo5mvsQQmKw7WsC
	BXfrFyEiXi/w5m6FxUtuf3KLSTcF86PxjDQhYpmlxeJ5spW+a4+6DakemdKrm2oPJIgAahxp6SX
	CbXu3MZVuDezj3kTKcw4js9tcIg+CEkDfHiedmX+0snUyiPlB6J64zFzZghA9WqlKhcv6vThjZR
	SNVaaXSecBPMiqeYPmnKqAkO63lqw==
X-Google-Smtp-Source: AGHT+IHY5jMSk37ELH/V37DB4hs/fv6+/bFk3IbJ92BPMYrnSvTb7C3CyJn7jc06TM0KCwnaXT3uh+OVtxVv1LaKsy4=
X-Received: by 2002:a05:6808:22aa:b0:433:e8b7:14b6 with SMTP id
 5614622812f47-43771697dd1mr1901237b6e.7.1755697649974; Wed, 20 Aug 2025
 06:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250817155053.15856-1-marcelomoreira1905@gmail.com> <aKKvjVfm9IPw9UAg@infradead.org>
In-Reply-To: <aKKvjVfm9IPw9UAg@infradead.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Wed, 20 Aug 2025 10:47:17 -0300
X-Gm-Features: Ac12FXzaPx61N9NssKf12Th8UyxKpv6zTN6GDGr_PbpBgXIa4ObLTquUFAbJa-w
Message-ID: <CAPZ3m_g+KcJt_wxBjdmvyW+FqXAcEfVDUuHkp8iZ6XiUZ+6x-w@mail.gmail.com>
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
To: Christoph Hellwig <hch@infradead.org>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 18 de ago. de 2025 =C3=A0s 01:43, Christoph Hellwig
<hch@infradead.org> escreveu:
>
> On Sun, Aug 17, 2025 at 12:50:41PM -0300, Marcelo Moreira wrote:
> > Following a suggestion from Dave and everyone who contributed to v1, th=
is
> > changes modernizes the code by aligning it with current kernel best pra=
ctices.
> > It improves code clarity and consistency, as strncpy is deprecated as e=
xplained
> > in Documentation/process/deprecated.rst. Furthermore, this change was t=
ested
> > by xfstests and as it was not an easy task I decided to document on my =
blog
> > the step by step of how I did it https://meritissimo1.com/blog/2-xfs-te=
sts :).
>
> I tried to follow the link, but got a warning about a potential security
> threat because firefox doesn't trust the SSL certificate.  But maybe you
> can add what you wrote up to the xfstests README or a new file linked
> from it to help everyone using it first time?

Hmm, I've sent the same link to other people, and none of them
reported any issues with the SSL certificate. In my case, I'm using
Let's Encrypt. It could be an outdated certificate in your Firefox.
Regarding sending it to the official xfstests README, it would be a
good idea! If anyone here is involved in the xfstests project and
thinks the post is good, I can send it to the official README :D

> Either way this probably shouldn't be in this kernel commit log.
>
> The change itself looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks :)

--=20
Cheers,
Marcelo Moreira
