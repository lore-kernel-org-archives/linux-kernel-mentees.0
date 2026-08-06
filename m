Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D049422E2E
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Aug 2026 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052603; cv=pass; b=ia+o+qvHAjCV+uyxQa43J6KjYDdSqpZUN94VFQmla/R4Eu/7XaWlR5hfYcB2TC/uXQGxeueNsJQ/4Iic9affKu9O7YcGR61t0b8qBywkUghTi5MaezpgM8zb/KjBfgU9wnixIscM4d/Yts/v6DdKoS6cy8ZKLJhmhT37U9Pit10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052603; c=relaxed/simple;
	bh=B4RhCkP9S/2UPiy2bHOf4EZfWfEQo8ptwLer6SDVHUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMxFrlsofbxfrlzijyhtSLve9PUPY7OM5TVxJoC37PGL14+bWIz6ijPnjvy54melpI3PV74U5hb/knf3VA6n1V8LCcNBRNinnHd60Cf+ScK/Z3l2UF9Om3mi75oTCJ6qheFLnr12MeivgBuVzqftN/ZRN3cgcHGkT9yLl33WhY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQH74ZFG; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQH74ZFG"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4566a5bc186so1120542fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Aug 2026 14:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786052601; cv=none;
        d=google.com; s=arc-20260327;
        b=jPsa0nLhPk0T7nEkErg1n879vZmEbXZk7pQ/aCYoL+sw4oncp2ldeL0nbWOPaO/Ehm
         hy2LS1q0XezUdtAxjejFHVjqA8cwnKpA8aS1sDZrtOEkPiN+hQwQEKWBMjiqzgO7VRlw
         v3XMMC9WXG9TZTEC8ctuUSFGtPSBWCWjkz+MEJd0ch4rC89nDhAdY6XaQgeB83D4IcAY
         J+qQoDxxdbrBuZTwxyR+4fZDto1bPRkhzzqudbRBW+1SmT4XTyMI3qI91+1mlCTVkWf+
         PMEqUr3SLWqHJNnxLtxUItafMkNtWkqAHIQ3rQ42H+BOwemvBLwxnIEiB0Kt5gBnhjqL
         q5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=teq5dtPqyWSwQIzSbfOi9mILXkjf6R2fNiUCCXuIGlw=;
        fh=XftiYnXqbmppbeJShHRI8ls5sWwf8j+My6LhDQqRBLg=;
        b=sb5iGD2jEcMDs+3cXWrTaQ7IGWB7uDspHf/tU3Kc/yEdHnoSV4W7l/Ft9tH1JgkNel
         Nx5hpaUGob3E7Ns9o55A2EDAFAc1/1gLZ/GJF+/NaIOgeaFw9WvRGh/b3+wBXdfoCD4c
         6U6x+mvYwuKWn5cNerG2gQcfLkTCUtR0gETLkwMmEnDIxZ8ckzfaSVQ2Sp0WGQfk1mwd
         dAcvOZ3EYosXncapb3ZrRHzA+pgWdDNbRYGeb/lDA1RWELPHI/C0QbpHuDV2grPkSn2D
         0MyTiaMnYHUwhL6VMHQ7z5bX1Ux54RgyNdkIpA4On83pyG30k1fZ8TwvqNhVxX652ilN
         fHvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786052601; x=1786657401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teq5dtPqyWSwQIzSbfOi9mILXkjf6R2fNiUCCXuIGlw=;
        b=KQH74ZFGOVUnaeH9PDmXTR3e74q6SHONhuDiXm1wxtkS4wrddllg48rcqKzcqWQTuU
         JP/U/q1Z3b7Aw27Qz3RA1JSOFQVgEJcdKK4o7lWug2RcjSnOkKvpA3ptMS22f5moUrbu
         x/i/n0b+GsnHzj7QHUZg0+f61jJ1lu0xKHNNkspVNI9pXV4sZlFvVWh2vfuBmO8rUzoi
         aTbCUKRUsYUoDlsHeoHLq9qeioVTkIKGBmEeZSPLFcgUX+fxVnuqzn6dKqAapSg5cV5b
         VXE2Z2S7iHI7A89WljojhxEwIZrpv10v4zKtrUVJFbsUOLccViaMwzmq2Up3AGAOTpx2
         BhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786052601; x=1786657401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teq5dtPqyWSwQIzSbfOi9mILXkjf6R2fNiUCCXuIGlw=;
        b=mP6ecI46yOAkCPNMEkoiJXeSj4F2w+HJo83xcPXWy4bla9p1j9shExTXah9KKm+f0T
         ogZXXZQuvYI6JMmHY9ELKvfDWkxt03ucQ01PFNs8T8NWebPU4dtuVFcQhG9PF4AKT8TM
         4s98BqRS/yGAzwfuJ4D4yCSZV98LK5PCwBVGXC5EVsAp1zRi5U0ABawAw5m6YQcJn1Lc
         VBi4l0sJBP4dILc6IdcBrjjYAPHd0yRtx93UOq2LG7j8d3lkITyQ8Rxfk4Y4IomK3rAe
         TVazRWEm104QB8jgW4RH7XEzpXeVoBXGXB3O1D+K3U+hQVf6O73O/KZk/bXK0yVlDx9i
         2KtA==
X-Forwarded-Encrypted: i=1; AHgh+RoA61peUqKPToGBfZTtXaAv0VnopqD2fFuF9fwBs3dtdqBDV6kVFKdw+aiRLB67nnw4BxMHMw2gXWayUL4NGjWENlM+5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5k2gPUQxmW9C2vKTyjUyM+xhaiIuBkMVQRSeKqM750j3EY+LY
	5fVRhmg2AJ1IYqq9Bj3tnqlowL7OpzSuIB2WEYQvfuwYxAahEjqLks2SqQGYl4VLHyPfKp5UYxf
	FDA3WgKu9xoraqnVoLizHd7o5lbrXtpU=
X-Gm-Gg: AR+sD10m8rWGlZ03ylVqnyJ+V+ml8vD1zUOYGhftNZ/R8Iwt88FzZVNTrQpTJMcQwBl
	mweEU/vc+ybjEbeqNmiAbvA9GKZsn0U+cPXToamxWlktr5mcwK1OeIEXLnR/0B7pteKJwQcCWwn
	CLbdgTA36GzPKLOyDJNyDZjq8I77NUb1f4V9Y1NsH1FkT9hScO/qgPVz9lH5nlRdD3rnHOMZ7f1
	AJaW3N/GTAgphVUinFxZcpTxbkJHf1IycfzQTqtwINH/ZdXXTiet9TVaxpUilsypc0ZIwGpz7d4
	dEJfE7HTIyT66KcejuJItn1hBOsaIKqtiPHjg3kadxHo6St5vlTT/8s=
X-Received: by 2002:a05:6871:10a:b0:44a:e7ac:b14 with SMTP id
 586e51a60fabf-459e2f73b52mr2523280fac.11.1786052601015; Thu, 06 Aug 2026
 14:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802014945.17221-1-adinata.softwareengineer@gmail.com> <20260802181449.12b7e117@jic23-huawei>
In-Reply-To: <20260802181449.12b7e117@jic23-huawei>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Fri, 7 Aug 2026 05:43:07 +0800
X-Gm-Features: AUfX_mxkCFVARBKks4zpYdZV7Yd4C2QJHclf4P5bGdi5j-O4q42jHt_KobUlmNU
Message-ID: <CABZ6vuAL=FMMQp5UTJQJMJi+7nnF+OOYtdRYbbZWveSjninsrg@mail.gmail.com>
Subject: Re: [PATCH] iio: humidity: hts221: Fix checkpatch symbolic perms warning
To: Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:14=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
> Hi Adi,
>
> Rather than doing this minor change please take on making these
> report via the read_avail() callback.
>
> This is a reasonably old driver, so some of that infrastructure may
> not have existed back then.  Moving to the callback makes the
> available info accessible to in kernel consumers and ensures correct
> formatting etc.
>
> To make that sort of change you'll need to work out how to test it.
> Probably just commenting out accesses to the device and reading only
> the files you are affecting will be enough here.
>
> Thanks,
>
> Jonathan

Hi Jonathan,

Thank you for the suggestion and feedback. I will create a new patch series
with a cover letter for this hts221 driver.

Regards,
Adi Nata
