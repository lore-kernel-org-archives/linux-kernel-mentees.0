Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454B2EB5C9
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753379866; cv=none; b=twDyP718FK1bl2nio/LyZlNGkblahHlS9MWPlMEiXI5daciH/50WWlu8+cccA2FmoFj8X+GjWhVZ1ewWirc+yFHPjLf67LSm9IAb4x15tN5V1V316lEck3kYsBxKpdUW8QX/C5Mwk6+dXyzxfBYS29sDDzQRvAPOQhOybM6UY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753379866; c=relaxed/simple;
	bh=sAvbEdu6tyR7YWYvjUUOb8ahCP8/eyDCdpGxnthD93I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAothjHMxguGCzVkzTESfOIiAL8NjcPoW9h+DtV74WDknWmCOsjqL3MbFuEjn8glmM31x5QMRrPAVGzhi7PK9HxSlIsbU8c8qtboH4mn6IUWuvUrOouALtUoXCHxDb+aY3qTPMdXWkXh37ig6P3yF6BUvJggDtnOw4MEfhAE3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6hSgFtG; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6hSgFtG"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so641060fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753379864; x=1753984664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyd0m6/llDOLqTKGKBUszI5BSryEijFnil6SKX904AM=;
        b=h6hSgFtGcPUckx9YCyv4rRmW7CoQO16w2BAai/9FYrj20PwoLIa0AL9bSzYBrySHRA
         4vro7eax7u2N4xY0+FM1EzJ5SKX3EnD8mQyIPtwzCL/ok3jf/xPdKLP51R4NFzsPvWWu
         0OtOQxDesQxADD5IrMXLcwzTGxsMCHlegGMON2wBgzeCw+jsDSi94VBOq+DfMvEhcc7V
         iYO1OACViZjGd0xS99RVPUdH7A8lI+ZfYNfQe0KR82VVwytlOab9X53O39GD7APB4m4S
         sC5Z5W56C/31tV+FemfICbNVgC64GJa+/8rxf+OuWS9UVAXGoVvOT2ehzAJyc/P26vx6
         xIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753379864; x=1753984664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyd0m6/llDOLqTKGKBUszI5BSryEijFnil6SKX904AM=;
        b=r8WsW/1cKtXmUsOkmUxYvSlWRMHE+KGVuaAARVzgJxu4WbNVJPXTCofQ77C+VDFbNg
         Ja2XTA5TcXcTbXWc5AdJT//UAg/+D14BuzD8Lh6xT0fBdB/Cho9Thu3Zm+C73ORck0r3
         IDO2eY29CGK+k7wxQQvk8ej6VRpxBdkxJKVPQgIo91ciL6zNI9hOgotlcpznkwTr3gTX
         NgzqmbuWYjeRCkE1KT84bwk52ajJpXGsGS5Izbcfbyt9m2Ra7R1M8LeZOxjI3YeJQ/AF
         v0tAcqIFrdD1ORKi/MYz+TNrUKah7RM/mPEAvhfeHA0gglsI2Z/09LdIC6T9CIMCqL6C
         vb2A==
X-Forwarded-Encrypted: i=1; AJvYcCXolFchci6EwAy9si8VlnB54yojNFLIKJNAluWQdKALdeDuoZyUH+Jrxq3/5aOPF5ddEOlHa3fmGc9NMKXY/CShfKm0LA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwh9HHIg6EmbdqBCyshD7T30Rq1DEwLO4owMj+VTJ2TtWcQfBj
	avI/yi1NqMYuPVCVeIXrJfYPiynCcdaFZTfbPpmgZjG2lMoFtbA0o3o7bWBIzgUdNMatVkjPf33
	Uf3qYbmV2F6/GS43IgQtiH24zhpYACks=
X-Gm-Gg: ASbGncsk/tCJBVraTjIMWOEun0Ikh+ZcKrxUKhqlpqt7Ud76UFvnu99J8y+1zgBWdCT
	Fg9ri1jWrt5wtHw7lLjEqQuS5jyBTM2p5gfnb5WxWHcfHaT10B5t495j5GigczwXVBKMLD26fW8
	iEP75FrQLMKTBInBWUfvURWq0bSFudc6OWFhBL0/kTGoywVRnR7txcO4JvifIazIhJdZ3TTZ7SN
	ZeifPsHqg==
X-Google-Smtp-Source: AGHT+IG3/GyCL+VU5AJJltRsP0Tqqxq0Yjumuw9YfIJLpjiZLw0Gf28GIuEQWGeaaejWHUNBndHaOx9Y7PVaKw3h+ig=
X-Received: by 2002:a05:6871:56c2:b0:2ff:b276:97f5 with SMTP id
 586e51a60fabf-306c6ec5c4emr6012951fac.5.1753379864254; Thu, 24 Jul 2025
 10:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724172603.18701-1-suchitkarunakaran@gmail.com> <aIJxVDBXyFgrz8AV@shell.armlinux.org.uk>
In-Reply-To: <aIJxVDBXyFgrz8AV@shell.armlinux.org.uk>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 24 Jul 2025 23:27:33 +0530
X-Gm-Features: Ac12FXx7y99oCagbZGmHtRkYJYdYeVHvbVt_84oh7Yoa7X7XzSgt_3Uy39Ssjzw
Message-ID: <CAO9wTFitMEzPXNqrMs7U=+M3jAghZtO1iXYbw5YBL1bwpB_Ecg@mail.gmail.com>
Subject: Re: [PATCH] arm: allow single CPU configuration by adjusting NR_CPUS
 range and defaults
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: ardb@kernel.org, linus.walleij@linaro.org, ebiggers@google.com, 
	nathan@kernel.org, lumag@kernel.org, dave@vasilevsky.ca, 
	ruanjinjie@huawei.com, kees@kernel.org, liuyuntao12@huawei.com, 
	linux-arm-kernel@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Jul 2025 at 23:16, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jul 24, 2025 at 10:56:03PM +0530, Suchit Karunakaran wrote:
> > Previously, the NR_CPUS config for ARM required a minimum of 2 CPUs.
> > This patch changes the minimum NR_CPUS to 1 when SMP is not enabled,
> > sets range to exactly 1 if !SMP, allowing only a single CPU setting and
> > adds conditional defaults:
> >     - default to 1 if SMP is disabled (uniprocessor)
> >     - default to 4 if SMP is enabled (multiprocessor)
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> This hasn't been tested. NR_CPUS depends on SMP, so if SMP is not
> enabled, then NR_CPUS doesn't exist in the configuration. Therefore,
> providing a default for !SMP is meaningless.
>

Oops, I think I misunderstood the intent of commit
278d1ed65e25d80af7c3a112d707b3f70516ddb4(cpumask: make CONFIG_NR_CPUS
always valid). And sorry for not testing it, I wasn't exactly sure how
to test it. Could you please point out the issues so I can fix them
properly? I appreciate your patience. I=E2=80=99m still learning my way aro=
und
kernel development and trying to improve. Thanks!
