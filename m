Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8F236F915
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Sep 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362314; cv=pass; b=CX5iQFRlme0MzSo/Sf+wMavhHal4yEKRdndFl7NMqiyX6QdE6XGNi6WKxEvg5iPmEZ1xrbk7cZoVrHIKEKoEsMyXjvtL6iKxlb3sTMaB2ZkbG63+cJAltsCABLk14pMwNnfWfuzP5qothyLwkUvVLRXp5YldGkNdwfZyvabBef0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362314; c=relaxed/simple;
	bh=3/NGhGUhliQp1YZrkIH7Rm4z6KPJQjJZGZasUOJhwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFqLT6d0S5NZ7ptVjPXyoE8xcII9Cu46sz3FoKFOm+PX6AMbQlpHK+V058opMM4CzeUZbyvBpsitiSn9FRrNI/00rJKpzg7orL2Rs7vXW+TgVIdk3Lbty6jfbWpVCsxvctmZnMYZcaikXfw9j4XDN668b3uKls2oaNZ4NhVnyR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=oKdFocJD; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="oKdFocJD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so590742f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 13 Sep 2026 22:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362311; cv=none;
        d=google.com; s=arc-20260327;
        b=kEvYZORk9dNfznxMGQXxaa11jD48Q0NqEG0zl6QvaVJfwOzmCWP1b6iwWcn+esG8mu
         nCl+6iqimHsbLcQacw6mzwQVtIzzv5SYT2zfGQolSvTYbCoD77AYDootKjmd6+l9JmTY
         4q1uZ0eQD0GYsPnxkTvF2JKLyJUMj8VSdrOQXeBUiGKD7uKdioHNt4lcH+LESj4c0v1W
         Rsl5FNIyCpazmIyHhbZIj8a41sg+IKKkUEW4BbbgNTjREhsqYlLxr1DJqKOZQ2vXW0EW
         UuIUWAQtA1ENTcYPaRFIzaT2Xib+H6HKJYySwq+2g044c7JWoRyFkPx6bTOYiwqRQtEq
         KSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        fh=SvRXXav7W5aCB5Zxsf2zdOYasQHPWPdzz8OREerAgZE=;
        b=ArsdEBqSQyVQOe1RGThH/9KeYIKQZeNQVz4T7+ST33hEZKW17X84YoByAINB0HdXfr
         qAUDmSN4Wfc6uiZGqhhzfsw5amhE46smmTQZncnDqxe6juqRXqQJZTqHI+7ALQU7TABQ
         oLg0sV74V+tqLQ4p/N43Py8cdKbRWIaIsPL3uJzip7tFc/Moy3bGIdlDEgJ0H/QxHktO
         jVK3rWcETG6Tof910TnlkjY5q/7mdKYfbd+A6S4iO746GS46Km4nSkFVQ8SSEjjzmv2M
         uMENUtDXWnqi2l3gEm3Q9iCdM4G/3vUzDrGLCc+D9dBND9JxB9vk+sBR2dMJ9CtYJ1mD
         PUsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362311; x=1789967111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=oKdFocJDAMjDylKJZsI6g8Qc/LnBEl3xRT+AcAF3qOuq/2yXHgpIWAhhqKpsOBpqZ/
         MzxG6IVjjxiR+Tl+lPXm9+sgwaifaR4KMTUYFylYk/O3p6D+4oWcz+X6sbXspJ4f3EPB
         0IBBGLlMV1IV6eWI+8jc5sqKqn/uJR1ziUbZ9dx4vvJeKn8Cdl/PLBj9AAriHaBnE/vN
         eeabRozkjHDmab6OmBe8NiAXpEJ9XIezseWCQvFZtAUYkWAAGhaZX1xhCZHJapQCfQ8p
         ffn5Gys7ifsSLKrqWfV71Nr8x7bx8bzwXvwI5EmX/FmtRPlzPDXfyIFBT5SR4U4XsExP
         Sb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362311; x=1789967111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lFbqmyGf2+vEHGBSIgu/0dJXwPUBsUwy+yR+CvMM8g=;
        b=oQDwx3+ruc5l9WH6xYeNH7Ot1GgqWvcQugdEqbpDor5ndAKmnT3h9OugkLXRt1dquM
         sW/c+vLm2Uy6PZTVrwy6Xusf9RMVlsoGvdXPCUhvlmj0MdgmxjLnihuy7kGsTw/qNrKK
         WQYFVIggpmudll278Bb1upbEWIKGz+49lrD6grJdh8zSIuP/29IIl1dnA2QF4eqwTs2+
         /ls2bZ3QXBJYGHDFSvs4G8/VNZPVvc+ogxMg/D4FtEWmL1n364TnY0hRGgdY2nyFxcdX
         9YcMsdcbCtsYYHV2sWY07uPaTasWFya75x5uqnY8QOLJ+pueO8MrMyUChJUC/QRj76ZX
         5pwA==
X-Forwarded-Encrypted: i=1; AKwUvByygLIaPHNal6eyD/I/ibWyuzwMdVEdG5p4s7OO9xfiI810sV7hv/c9vfVpURUbi5CqIxeceJ0GkF7txIZqhP8zNUWLxQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mDs/AlQWs5xrRcNvD+XdJ7hcP/c1zFfRzHLrPB+nDChGqOn+s5
	AN7yv4HlCqIJeT1HlCbUaqiHO5LfkgffkLm5YFTVKQofLkQfzPtL3yxYHBxKs0qwSk4THyYSl8I
	lCjd/ncHjNYa+mdPmRER3pU+t++SqplQeCVoZ6jd3Tw==
X-Gm-Gg: AYBFou2vVn9XxeIjiz369Otag9QcwlMUcb9gyMQsBo9wEEFSghuni51Ow8mcV41gnsR
	uStCoUEn94rpUB+RR7hQFj76J+XGcxb3ltGM+ctQWjG1yOevr12pM1huemkYcHC+XieMlKOBU+k
	VsOyDz9XMEKTAOUGhY+4Khv3yzF/PIsZHp9WbUi0muivbNyJIPp1kEdKh38IRimiRZKJl1bOW+u
	GkzfsGfJTyGCUiTIwH0wRC0Pp+t3c9ZmqweU/5ajiRYOr+vcF0HgohTLQgyTXNI+IxHV4Po5mNa
	mZCDbHYt5lTAwZyuL/4/b2vYSGpP3oSxYTC5RE7QCApaPKr6G0BFlhsvbnkFAU8PcA9fVH2vhZB
	hAQ8CvFv9oBN6Yn4svw686GFIQeCM32ynSE1lldk2JTMoNXCaMZeTbHE1W6avRIATrQe2F+JStA
	==
X-Received: by 2002:a05:6000:2891:b0:487:212:a412 with SMTP id
 ffacd0b85a97d-48702ae4de6mr759634f8f.9.1789362311187; Sun, 13 Sep 2026
 22:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825083719.643970-1-suunj1331@gmail.com>
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:34:59 +0530
X-Gm-Features: AcwNN1UE_9mObcL_0yUCsop8W1hIdGl2EPgpfLQFtwqx2oRTCfP20KwRbzdJA5Y
Message-ID: <CAAhSdy33LqjYrozd0X7c6kLGz=bHgOuPAk+r6Je2R9a5Nh_-VA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 2:07=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> This series fixes three issues in the KVM RISC-V PMU implementation:
>
> - preserve firmware counter values across stop/start;
> - report failures when writing snapshot data to guest memory; and
> - fix perf-backed counter accounting across read and stop.
>
> The changes were tested with the existing KVM RISC-V SBI PMU selftests
> and additional tests covering the affected stop/start, snapshot failure,
> and repeated read paths.
>
> SeungJu Cheon (3):
>   RISC-V: KVM: Preserve firmware counter value across stop/start
>   RISC-V: KVM: Report snapshot write failure to the guest
>   RISC-V: KVM: Fix perf-backed counter accounting across stop and read
>
>  arch/riscv/kvm/vcpu_pmu.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>
>
> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
> --
> 2.52.0
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued these patches as fixes for Linux-7.3-rcX

Thanks,
Anup
