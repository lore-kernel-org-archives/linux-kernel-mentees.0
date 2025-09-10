Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5E2C11F1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Sep 2025 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757487793; cv=none; b=lpZsGElB+l5Ui69dtM6+nqcxBWfRnNhSGcur8hYSxMe2+4gkS733dtDhgidPHoYvd7bsFqsFzK9AubmwKeKcr4Wyj9B2qv3vdD4qSBUUnIn+ng1iOzTjDw1zZxBpU3hGZZv+8AHbg+x49BiUiB4+KzmesGmPPdp6JFzvjo6zBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757487793; c=relaxed/simple;
	bh=K3sb3O0WaaCu0/VJziTkMwe7dsY/QjdigziLXVPL3Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKoMVw6FIWanrgRCO7QJt+bPboXjo6qga8X/GfvisJSwiGCQU64ns+Rd80j2Zb/h9wlV0VkjGPx56j0Ar6W+6MaQHDB7yc8srlowPMg7lUcrtNTxnXnue7XTNia36ug7YI2sJVijT9zu+5KcjyOaXXSJdpM4Mx8J+bpqfTe0kjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbkKxs3U; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbkKxs3U"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3ffe6666f8dso16385475ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Sep 2025 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757487790; x=1758092590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3sb3O0WaaCu0/VJziTkMwe7dsY/QjdigziLXVPL3Iw=;
        b=nbkKxs3UEuKdW/brmVyfkVDmnt6UAlLqCTFDhwk2vSDZwpYwerYABAO2OZBP4ZDw75
         aJe4E/GUkp/mOthwLF6C8c3tFotYuFDfe0CSoydy/J8QYeU8x3Lup0u+uKJxTB8mDHYy
         XF3ICUI26L2FroHkhDnyoHsND7yhwNnNQZ3NOGPlIU/XGKNRh4Y1SWBdloUPa9dOq7MQ
         ZkxAFbwoGlQw2ZnkqI5sL4dkj3fBUitf6BY/JSi26d3vCdwqcB6nIxZBmqofFBqMsZBg
         b2dvKL+mKYPq9CiUfynKHq9WigMfx4wvmVeskTqaOJr8rPHh/Ze9Pj2Zs51cmU8+iSy5
         Y0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757487790; x=1758092590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3sb3O0WaaCu0/VJziTkMwe7dsY/QjdigziLXVPL3Iw=;
        b=djMB2rP/HyIFrrFhdUg0idV8G+bmOf9EAyWzMT1jIm6/49k0kkWAK3A3a7qTbEr6ce
         k1H4vTlkq0DZ2UYeANkvZMiWratczYxQnIPR/hN9U4TEFbIMZ102gF7jy1yoW3s2e3lH
         TamFit4kOWWsPdwOhLfZLyHg0ZeC14LPSk1HKRNTkBEzfeDho0yvH68Zfhv77jUZfRru
         88eiCIInbU7TzeSn6AyF+9WU03BSNCrUYSCXAPDtPJIvxR7cUKzs8u9v8CtqXBu1woiQ
         gGzNCK7FmQaKn0tQz8ugDTvzTISqUG13AW3fRExYUMAJVRHFTQr5UCM9089QzDRHRSJm
         iGog==
X-Forwarded-Encrypted: i=1; AJvYcCV+RWwZ3Uy00di1VHaAsmn4wS57WTG0rwHsKjHBdaz0k1qv9n8aK/ae3za9Sj9l9NP0Y+aggMZdARBJagL69dNc3pGYSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YynZPt8os6RZCty81Y+zkYBHNsCjzWWjWAiP5AZGRyh9CY1hhgX
	ObSWdtd0JPRacEpkEk2lNPYEdBajwJ/OjUqSkql87mT+v1zpTI/lzerYucDpoVNq/MJsS7Y51JA
	ITSistwU+4cZ3va5AOxE2frBUbqeFqEk=
X-Gm-Gg: ASbGnculbOsXViY0GmF+qirfLBErnHqU8CxbNNFpVB8jal7CIRNGjSpQ8FgCXiSpAd7
	CE7/y+0zCGGVSGDbiMkf54PxzYtu9zZf3o9izA9fbYyHyHhZ/1C7iGkZeffBLZffpmo0gVlHF9P
	EJjvJI+LqTj76s3iRh5Qzawf1HDPo7FC3eT1bBAZPPBSMGnmL0ehEkHMfJ+eu1p6bp4kSMlgYoK
	GvVkt5KlgON4gOi
X-Google-Smtp-Source: AGHT+IFRXCqGqREn+YxT6ZRBQQ+/gQ+Gwx5iX5XmgokBagKB2BNEC9oKGjvvsbIx8yoWxpnf5nOBNea7lamS0o/4C6A=
X-Received: by 2002:a92:c26a:0:b0:40e:adf8:ca2a with SMTP id
 e9e14a558f8ab-40eadf8cc5bmr102324035ab.6.1757487790409; Wed, 10 Sep 2025
 00:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com>
 <93578759.11447.1757322260340.JavaMail.zimbra@nod.at> <mafs08qinn92v.fsf@kernel.org>
 <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com> <589829523.18235.1757447430401.JavaMail.zimbra@nod.at>
In-Reply-To: <589829523.18235.1757447430401.JavaMail.zimbra@nod.at>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Wed, 10 Sep 2025 12:32:59 +0530
X-Gm-Features: Ac12FXwBsZJOjWnbMMWv1I2jpV-70BlTyF34pse8dnrTr5YRb8hM2Y46Rkfg8n8
Message-ID: <CAKY2Ryb6CLLYBWH6pipDGV5SHv8GiZJrPb-KOWU29g=yYkzUgQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
To: Richard Weinberger <richard@nod.at>
Cc: pratyush <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees <linux-kernel-mentees@lists.linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I sincerely appreciate your encouraging words. They motivate me to
continue improving and making better contributions.

Best regards,
Rahul Kumar


On Wed, Sep 10, 2025 at 1:20=E2=80=AFAM Richard Weinberger <richard@nod.at>=
 wrote:
>
> Rahul,
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Rahul Kumar" <rk0006818@gmail.com>
> > Thanks a lot for the detailed feedback on my patch. I understand now
> > that this change does not add much value, and I=E2=80=99ll keep your po=
ints in
> > mind for future contributions. I really appreciate the guidance.
>
> I hope my comment wasn't too demotivating.
> You are *very* welcome to improve the code.
> One of the major problems in open-source projects is that
> we're short on review power. That's why sometimes maintainers (including =
me)
> react grumpily when code is changed just for the sake of change.
>
> Thanks,
> //richard
