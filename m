Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD77A2BFC85
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432948; cv=none; b=WyjzlrP046Bz6XJYMGb/F1+R67Nx8zVok1OpqzQMFy6DEWmrSL9EM5X31vXhntAYWFl9GHY1QFH9wjMQMcRDLvNrsyX/pv6ykRa3Q0+CocmAYxDN/VKt/crdD2y6jxiweWLuKy9ugECz01ZinHrIqyIVnxBfIx1O3vjyLusD//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432948; c=relaxed/simple;
	bh=0VdI9Xfav68u9AfVX5VANCV5qkHLL0bR3T+28mB9B2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1n3sxr2avjyfSOUyPrzLYCgn6qNHhYFr462eOeUHzCd+eP+/mfE5MlHa4E4sKxzuitQzIyi1nUX9LCEVR/6PC8rNj8QlrrOZ4/DcQwlOdmRtnICF9bxtbsO63y4jzAof2udjj3dQvN5daeIiy/r72HDDQ8rsKKzujvgwRpdJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqRwRMQF; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqRwRMQF"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ffaf8283faso1391281fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753432946; x=1754037746; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RtRwewxpwq6wdbx4qVBSFtRxsYRj3bEn6apmzcYXc4U=;
        b=PqRwRMQFwORzErdsUzlWOccERTpR75eJHDbTyxiVINkXytAq1rFBVvYhqfV4EjjWY+
         +GoXF/ryAbgoXDSdhYMOzbA5RCJwJCY8J7g72Si/NAA9QK/N8d9HyBWbnJ2P6mUk1Sly
         biJTkfFw9F1gD/gLRHZzdz+K7LD7IBhYjYEVoQPPVJn3lXMnfcZk/mc/x3DgQE5Hfu2t
         APrOiGTb5haWXvo+YG9gOrqUaeQ4C5bG2FWoFDJQ3qcIJyUbfF+LGAXuR0sO26wPOdZq
         HpubdQuL+uVu0GQPCDuD09tRL7GG+3RCdxQJdCJcnqLjki/STuPBJSF4DsM6JKUD5q9r
         lDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432946; x=1754037746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtRwewxpwq6wdbx4qVBSFtRxsYRj3bEn6apmzcYXc4U=;
        b=XPXYzN7Rcd43GVKMrt6/TzIkICQVtACvauU061QPLaYEKV4DCOEK5dIQIUPO6zg1Am
         fyGl6cUI4iuUjTsdOpSADpAZXcOMmHJIq6/cARjC1NGhNjzGlUxZW7bKa9aFs1ML3Y5x
         uxig7yoAIgNDKanZ/CwQvIq7QoGA7PU3vnYwyNIZ5ArpQpxN21Hd3p+2afiug8Zk5D51
         19xO34Wp+6qCnfAJiC3tVEvPjOuuphXfO4ISHd0xcjvc+qQJaFH02iWVjPhXl+vPpdY4
         9iGhtRQUD+tGz4DiNqGhbDIAx+zYCJIEr7wadVmYNTNCkKq/MaN3OSEoLoY2ly+4KBYm
         gEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkFnn5BjhkCxPGgXRrsYsSUEomJI+XwiNxIUMwjmqgPQ4vYRuHdiGyAn3dRecoQxj45fNmPp4dIo3fsbXNfSEz9zunCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy05ccEVdI5UlPV3DLO5YTm6bgKUyP+dMgdY9T43a54BI2nL427
	Kmu+A7ODSGiCuE8fLNljmjZ6F4U+2mPpgHe4okQgxJD+ogLodEgdQCdxCrIiRgS1qiL/A++ErhT
	x/LohJRyg8RhbaW4r+rjQjiTIH+atgjE=
X-Gm-Gg: ASbGncvnuzZM9hE4lgrcmwhjLSEhRde3O+dhXW4fgOOk79g0zpDVNHLm05qHi142/Eo
	3U7XOb3PiULB1aeVFxEqCrTafFFOsiDABr2ZO4uEwZoEA4gHQzIQIw4CuWdT1CJfLAG4JA0PueE
	IrEZhBYJAzRA9zCLJ0Yf9vXli7NqkmEAu+ZOHtaigCTOvvy4bObKEAjYjJnpb9pBbfNONV9WtW9
	WxdXr9Uw5M80BGvRIs=
X-Google-Smtp-Source: AGHT+IEVFljy3riv5EFfk3X+lUpRuFxZgCwOrvFCvupN/y94Ps1Jz3V/M3D+xKgRnuMZ/6lDOnpaj2GSxOEwWjj3QCE=
X-Received: by 2002:a05:6870:6591:b0:2ff:a6d7:52a1 with SMTP id
 586e51a60fabf-30701b95dc2mr743859fac.35.1753432945740; Fri, 25 Jul 2025
 01:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com> <aINB80UeE9pqKvrC@arm.com>
In-Reply-To: <aINB80UeE9pqKvrC@arm.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 14:12:14 +0530
X-Gm-Features: Ac12FXzZNc1wz0lfkqTulvOvt5tDVpytLFbz6qy0ZVkM2HN4QImTHaxW2rcRyCw
Message-ID: <CAO9wTFjYnNAiGXqczPMgmCMno2Y-T5GCmgBgjGfDRbEcvsyNhg@mail.gmail.com>
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jul 2025 at 14:06, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, Jul 24, 2025 at 10:26:39PM +0530, Suchit Karunakaran wrote:
> > The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> > This patch changes the minimum allowed CPUs to 1, enabling single-core
> > non-SMP configurations.
>
> Do you have such single-core system?

No, I don't have a single core system. I've just used single core VMs
using QEMU, etc, but I don't know if it's equivalent.

>
> >  config NR_CPUS
> > -     int "Maximum number of CPUs (2-4096)"
> > -     range 2 4096
> > -     default "512"
> > +     int "Maximum number of CPUs (1-4096)"
> > +     range 1 4096
> > +     default "1" if !SMP
> > +     default "512" if SMP
>
> It's been some time since we forced CONFIG_SMP always on for arm64.
>

I'm sorry, I wasn't aware of it. Thanks for the clarification.
