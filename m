Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240493ADBA4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931611; cv=pass; b=TadwUKrY303CSc7P3I95t3FoV9WcrAnCcwmXVRXGZkXIdcF2kN/CmpNtCjkQ5GxbqzlfNPgn45fbuahhRKEeBKtLQlOJlyqvVWemliPMbogcTQJv3uqU8HeCzRzvpgN8kQ6SRM8NNTxYk9CeaEmkz0cPSNMub3CBZQRI6bh4Qps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931611; c=relaxed/simple;
	bh=I8Ahcyx1157H3fyQeYshWuEx6yg3uTGMl/avrNEV+5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9XFeEyoRTF6aPZqYRMOwKCtSFb2e8v5KwFh3xMwuRQdykHenLqMdoUAhRqbXujD08ZWfjEqY4qL5LBOsgnlkwS+m5K8+jopAKgQ1xD3Ayn67eFhwr1ZELIADG0qyDDhP4epMy/E6EjM0/jS7DFGzsfJlEi6m8MQMbTec9lYYNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=ul8hEJvV; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="ul8hEJvV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b1710405so14314885e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 01:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783931604; cv=none;
        d=google.com; s=arc-20260327;
        b=eX89Wg7RM4HeN29mBYi6G5JUDhZXk1QSjFnubJ+ileEJo3C9vcxYsG8dYkztFcTTJZ
         4+IZbVa+LWsAhfZiEyXRls5U4Jj7RCQ4WJk3mbm3W8k7nSb+6ey/blPe/JPZ9vucE/w2
         y2Fd0bsSnP1Khan1iGFgotLHJgzgu+2XNboyisJHvmfTLXVu1fBeUniY2vgBDldSXJ1c
         vEVg/cmb/iVdUUCLNSE6upCe7KQvpJAf2W2uGnbUPEwEPM2UOW+7BsUuZDoR23OR2zr2
         bQkOvIatToYttKjdZeUVm9PXYBDJxEjm+KyTsB1MVm5DBET4ip6s2dUccbhUsnXpb8vm
         QXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        fh=oNiImXFJLz5/6aoT+/kHyqcBV3Gh4PGmKB+2dsajJdw=;
        b=gjdz1V9HtlwTqnOnPcrXb31NtqT2qKcIWdJU1vockbi9yUuP9eFSyf8tpS5b23L2NX
         b5epcA98sgKGshpWz3qtK/SEjDypg4TN4vW/fM26wy8M/V8tLO/CV9z2mKcOuhTGxGTS
         R5hX6Gyz2qLasgkfXdSMnFF4HZ8hXa6Ms33Nv+PuO+Ams0XP2TAURnoVOk1aQUNlAr7r
         V/lYPEq+AKB5BQVTOL4dZqToNIBP1RPnXBFGpE3jjBItpvVsu0PrR275IkAVXnO6+2xo
         pogoF2e+K1dgvrV8TJUcK3jOcZET8q1XWYISxMf6rNR3Idtom/s2WFJ8b1U/F9omw7pd
         ojRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783931604; x=1784536404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=ul8hEJvVT2UQ+X5upOdJ3rSamVlyCAuZOTR0SeJ4lcXXiwQD4bibHCg+Y1wXq4ME1N
         hyNV9ROzo/SQkTYcR1GIHHipqX/HGpnso0YPocsjRG4Hc1HNO1JL3a9EBWMPTEyjT2b2
         WjKzd+mq7pIaEdojVH4aUm22lZqdzsddCLfUnMa6NidxzGCg1q+D0zqa2fopGyfhTpnG
         hVCPd/QM+Lg07t6Fzzj6f56RoFBRWRrQ1ZY9KoOIs70XcC018AJi/GpYX0aMEJQ7zz4P
         u64AsScrBTWQV2flMTCpcH8XPT+EB6oQIk9i8oLuA2OuO/RPSt00XFluUY24vYij0eJO
         PO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931604; x=1784536404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=kus13w2Y+4C9rCGhIbWkVtnu1IDFH60vJyZwrmCg174k0065LT7jORLRfYBXp4T3Fl
         M2mlBfUrc1IbV8twTtGnRAyOHd/pT7+733uh9UBFSp3PdTPrVc8TUcNq0Mo6cVXeQ34L
         uUy3vDtiKd3UVBL0SPTGYCnEy2F8SEkVu9x2gkcR8tsUu/NpTAEwReWYPSuaVWFwcbzd
         i3xpk0PVxJpXzl0wOgPaLuIG4xBK1pgjY0I2GWt4kVCfvgp49ydTbghnDDAl5dWvesKN
         pNTKrT9ocF26/sjIaen5wTjY1WAlCqtsktw2MjcThKzZBOmTonCnzmaZt2DVl8XBf3vb
         G/sg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9nPaUQJJsKh1KfLZ0GH/0vjkm1OVf2iWD84YmHhyps3yzl5d4HthIZ0K5Q80qjwSkih9+uNHABAkfXaKIBOG2EXntrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXrf5hsO26gTVAcXuhBKfDMwmR0qMGTLauLUnD7q3MeJXvNiyF
	wijbnw55sWCd3h0gq8KUnpfgh4x4AZ1Q/pBW+9sSScrOAovWKz04+eU6raEu6sFoFksJp/ApeEJ
	UlQpE1aMB/PA32pqFKgNTerlDMm5v7YcUkhnoWBF8FA==
X-Gm-Gg: AfdE7ck8fdDh2SXCe+PXLFymPRI/cYguD5+kpElnfBbddu3zVYtpG2g06liaDalm2/l
	w9bcEC/+to2z2sqtTf9NsGwjerzWaBjReYN8RCP/HKqGSRUnptPxAisbQqpqqNijnVVxWJPKXVS
	wWbuJG73Z7R9mfVHeo5/M8+gHjgTiP3iKchJxWPUN9eDYUfKLuGxWJSveWYaCwNgIchFYe37nLG
	0+Srzjec7oaZ+umEgBsvhvtGL3mnCcbTTjDOccaiCEEMnQhbeYGFXK3yhFhAQasrOeIhWSZuXrv
	Vc18tbm2L/65c7RJ6buaNRWD6YakedLGJzoxFBmeNDbVC5yL7qoHC6JFsBh8EgA9BO6mKnsiuax
	seOGwR3fICWV8sXRn
X-Received: by 2002:a05:600c:638f:b0:493:f762:45d4 with SMTP id
 5b1f17b1804b1-493f87d9311mr77398405e9.2.1783931603573; Mon, 13 Jul 2026
 01:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624130238.524706-1-suunj1331@gmail.com>
In-Reply-To: <20260624130238.524706-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 14:03:10 +0530
X-Gm-Features: AUfX_myLtlmicbiW4GefupawlEmm4GHGfSrV2gtz0C0tAQHCDS5effgNQRiwzOo
Message-ID: <CAAhSdy2YUuC8BLVDp53VWGnUYLShGkuWeHr87mpe5RnZx3PLSQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, cleger@rivosinc.com, ajones@ventanamicro.com, 
	skhan@linuxfoundation.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 6:33=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> kvm_sbi_fwft_set() applies the caller's flags to conf->flags before
> invoking the set() callback. If the callback returns an error, the LOCK
> bit persists and the feature becomes permanently locked without its value
> ever being changed.
>
> Move the flags assignment after the callback so LOCK takes effect only
> on success.
>
> Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as a fix for Linux-7.2-rcX

Thanks,
Anup


> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index ab39ac464ffd..1342adb3180c 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -327,9 +327,11 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u=
32 feature,
>         if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>                 return SBI_ERR_DENIED_LOCKED;
>
> -       conf->flags =3D flags;
> +       ret =3D conf->feature->set(vcpu, conf, false, value);
> +       if (ret =3D=3D SBI_SUCCESS)
> +               conf->flags =3D flags;
>
> -       return conf->feature->set(vcpu, conf, false, value);
> +       return ret;
>  }
>
>  static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature=
,
> --
> 2.52.0
>
