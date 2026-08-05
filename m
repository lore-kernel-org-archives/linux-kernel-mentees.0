Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE33EB7F4
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Aug 2026 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921618; cv=pass; b=lsVswfYrxXg7QgdrEFwKfdmP5IBLE1BaURV31SYIbZ7GpnGcK6IY69NaEraG+QOlkaw512rJGztmx4mpjP2p9wz7jOv4aI/5yP/QaIrrPWLDOygfYPs/jEpq96/nq/b3HneSCC5yVF22pHisrB01s6LRLEHms3JMmsQxx0ypjTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921618; c=relaxed/simple;
	bh=axlEM3fgX5sf6tpDr6oDm62vYzzd5lG+OjtCYy4uiGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5wrVTgAgDYHZSh72J0ohfWe4vvlksFtvWTApUMvXL67f1iNsavhJCxakjv7zvxq2vnmnc85GbCaiBjBtxxfv+tpNPBroC2WW8OfaAo/xPGjnSmKgsDKRWtXo3iKezZrcOJ5Qz+/9mvpljDwJjtB0goCFYnpRsoFVWmOYU9iKus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raKhV3z+; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raKhV3z+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15dd4b9132so131770866b.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Aug 2026 02:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785921614; cv=none;
        d=google.com; s=arc-20260327;
        b=PeoApLBIs2ANjMxyECcH3GNjcYhhn1g+FEjvM939FAfOQ2Us280NShM8pByLQSY9Ns
         277Y9Xx5IfIs6+ZTvEEsswP10Wvz9IrUNAM9zG+9tIJPE7mUJYXnIKBOGo3M4kkDS1Rf
         RjBYCD25JwZWeW5wECH67TTZ7ePV8tE/zEL0SMemLEDsTHOCfkvidP44uanNKESQ1FMI
         ZdsnGwzOKvWa7rAO+ZgKDJj6D2bDxRaqc/T59pPlkG/ZRGghvmYROaDYB8g6P2yNOxtw
         Q7hGziiS21/wN/izOgb5kpx3Wplqs4ID4AaTaCs8woL7KQfL93DMGFXqA96sAVgSPf1u
         njHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlwkeDo6yXakPtOLdepmMmrxJfsb1eamCAvds4wEgrE=;
        fh=fJGNK4HuzKKo/UQndMVRKW84bmWj5Fuiz/NsgK5n35k=;
        b=D0xAzpSYO+YGXqAlq8q9cAr28YqkhGvZY09giQ03a/At6WaQgnj429O+1w59ldiQh8
         5ZPbi11oTtPRXXnmDb+2JaO7dsB52vjICUtXdTZxoZd7xqAYICdAm3EECWnV+cr50mkT
         i6h5x+JP9nwcHRoSR1BN1Kvq5sdiutdVwWOb6+XFGFsLrc+Azf983U8uuA5khU+uPeZ/
         PCijXWEHxnmRBZ6VehfmQcJjDu0GaZVaOX6JoLdVviYIjxgO1FNZS4b238VWQsW+UTcH
         efcfOpCVSEJx4Dln2CVpRykjg9S6TItOnJiy2Qk40GeqfGocAn7HN1lNauTEMOLVjAfO
         z0jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785921614; x=1786526414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dlwkeDo6yXakPtOLdepmMmrxJfsb1eamCAvds4wEgrE=;
        b=raKhV3z+gitQvXo2WKiOrH116RdijLKQnLd9i/5anGuFtm4pbKjFJZoiG/ENq5JdeV
         u7hxTBAdbahn3fCFLRcvBWkeQhyIL4aDUyFiMmrYRYIse2DeXCQLCDwKblpeW7SSDbgg
         hClWoc4cWptrAzpEbrg5jSJxpczrme9z10AzS2cuap2C2HvQIkIzZtqxRxakzydg766Q
         y7A0USCeriQynldzDB2IqIwQHHXAG/cdpEzJQN6cNwDBHVLULp2nGerj3uiAORLjuKby
         uB6GpHHjWPm2UgpAq7pztuO4TMTwX17K7++qYCHSwgkZ+TQVdYNTQY+akFSTMbiqrsHf
         9Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921614; x=1786526414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlwkeDo6yXakPtOLdepmMmrxJfsb1eamCAvds4wEgrE=;
        b=VF/WCsSQ4m/jaQ9aSPZReBez4jU6KEVZVZxrW5DSx6U0xtoubIM3754Y7T7/lOmS67
         YUFIAWO6w5ySaM1yEmICB+ZsEvtyjgS4eYstSXb1kBZsvcG4EM+st1hKoE0vqNx9jp5n
         ATiLBJ0OKiD2hZMyzGd+4HF/5rcSB99CvmHDWZFuqHwMHlFYZOnhcJMSIYrkxrwc1yTv
         jOSt1OIfLnO4hhh1gjNoBwMvgBppKHNlIHwYQZkliH650/I5Bwz+HL6Bun7QmqKNVKK9
         +7CJQ2lWZtBKP7xXvHs/NRg/cGijRI+5LwPkBnE4/diI16JqG/XhGCz2aTikaDNTO8+x
         wyrQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Xxw5Mus5Le37StGm4OqTB8WBCQdBSPPRByQWm4xFaVOkk88JhkuPqTLfteS1pGTLafcQwVCqqDSF3JnFlU8CSTT9ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YznPd24Z3a/vGE0VqvfsUtz1Vput/sxrydW363SA1IDvCYDJ37x
	OxZ8sjS1ukYHYTjzj6GtN7t5qnuaVByz7WaBDsTT3NeukZNty5pPwcSMP6t1H5LOzb+Hp1sXgPt
	mYdzPRAuAy8AIut+1MTKtAQ0ru+WG9yU=
X-Gm-Gg: AR+sD13dg15vd3jxId8AX+CKcGKIhaS6JGddWjNtVudyHz8R08RbItcR6iu1zDQyTlJ
	IvPgkUa0il93ED55nsApe9Ltr+NYgwly7BfVADPkvs9X94AqG+HW5jVPxWMpbiPt/JPVJBypfBM
	URvyqbBVq5p/Kd6ZspYVXBJT81q5eM6GJxIzeoGVd/mF32Jgi95d3f38ZSPQ+vWXYc+tLaDWiGq
	ro+7vvH60rdBmEQRuDKexTc9gv4FZxkp2nMypa2zPdHfexRp6zrHJC9Zie5B0jGNrFRn2RsdG6W
	G2rLH7ZsYFBI/m9Hc9PJ0FB6jTzZXRDW+wZsOFM1iSDr+rTJFHCpZdnetHzhKZ93+FzLmLcKcoO
	Y2V4V2CRGYQ0UmjILGiB6wgqyySGrhLP18uktc5eU0P8PAXgvCBe0g/1vBabKYETMT3ADxBh4w9
	j+ft/oZtkGuxWfL7u5/9U4oBuWeBvrrQ7kf7Nv3v8LS6CG6T0pho4lRc6WNPUZpis=
X-Received: by 2002:a17:907:3e22:b0:c05:b9db:68cc with SMTP id
 a640c23a62f3a-c203997b6e4mr292585966b.0.1785921614024; Wed, 05 Aug 2026
 02:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805040621.84843-1-marcochen.dev@gmail.com>
In-Reply-To: <20260805040621.84843-1-marcochen.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Aug 2026 12:19:36 +0300
X-Gm-Features: AUfX_myhIIB_JTz7NAD1bcLfDF1q2D1KmHo_OyYoZAD8hIxO2MH11qNDDtG7GMU
Message-ID: <CAHp75VdL+NarOfkY7mOB1U3Aud-TMjM8MPEsCapjYCoL0ikpbg@mail.gmail.com>
Subject: Re: [PATCH v3] iio: health: max30102: fix NULL dereference in
 interrupt handler
To: Marco Chen <marcochen.dev@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, pmeerw@pmeerw.net, matt@ranostay.sg, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:06=E2=80=AFAM Marco Chen <marcochen.dev@gmail.com>=
 wrote:
>
> The interrupt is requested in max30102_probe() and stays enabled
> for the lifetime of the device, but indio_dev->active_scan_mask is only
> valid while a buffer is enabled. When an interrupt arrives while no
> buffer is enabled, the handler dereferences the NULL active_scan_mask:
>
>   Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000000

>   pc : __bitmap_weight+0x64/0x98
>   lr : max30102_interrupt_handler+0x48/0x160 [max30102]

For these two lines see the below comment

>   Call trace:
>    __bitmap_weight+0x64/0x98 (P)
>    max30102_interrupt_handler+0x48/0x160 [max30102]

>    irq_thread_fn+0x28/0xa8
>    irq_thread+0x184/0x30c
>    kthread+0x118/0x124
>    ret_from_fork+0x10/0x20

As Submitting Patches documentation recommends these lines are not
significant in a traceback example and may be dropped. So altogether
drop 6 unneeded lines.

> Call max30102_fifo_count() at the top of the handler and return early
> unless it reports a FIFO sample is ready. Because FIFO_RDY is the only
> interrupt source enabled in max30102_chip_init(), an invocation of
> max30102_interrupt_handler() without the FIFO_RDY interrupt status bit
> set carries no data to read and can return before touching
> active_scan_mask. A negative return from max30102_fifo_count()
> indicates a failed interrupt status read and is treated the same way.

--=20
With Best Regards,
Andy Shevchenko
