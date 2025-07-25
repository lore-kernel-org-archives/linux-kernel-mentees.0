Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82842746A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444549; cv=none; b=uEOBqDMTGDyMN6qc0tRyxH0Vx4J3s6c9kia/N4xqfamwTCwILfocWk9SjcPeZy4cQl/qZEJD2w1tIcPecstnqVEBcEiAwmiEvrU3xoCaSIr4+tl4612yctHk+dmZ11r9fETAn+u1DvpHddWGhehfVKAIOffWKOvZlVcq/V9goaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444549; c=relaxed/simple;
	bh=EW3/RZewc04Z4GAtT/t6/g9e88MWqG2n6qtKS4h8eos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqsn2R6RT6ktZdwFrog89QNdwvsZ6sM4YvT7OApBwhlFytY7kV+Hp0bS28Cca3fs9O9ntN5Grnoiaz2ZL3K5qUQilr9RK9rWiAtbHXMvyeajij3bCQ73MXERo5F5l876RQBSWnSTPK23d9klHRDyTi6jFzDGySKQeyr3OTLSxZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5QbyhCd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5QbyhCd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43cce9efso14911331fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753444546; x=1754049346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW3/RZewc04Z4GAtT/t6/g9e88MWqG2n6qtKS4h8eos=;
        b=G5QbyhCdkx45KNJsyGFDbl9qGHom6n2xWACIfDiJ8HUN+YXOKv3d7Npd6iQhOJZ3FY
         67Ddt8t5umVoS7clAimlxfZ7Mg2+BStIqOAixmPTyNgPs4wI4t8byam/Xc7zWuP+kEax
         r67+qGiZr83bNQw0NYFF38AfRS28MPvtNWqF3ymhOQrct16yYYvDAZkb+Q1wmVasBQyh
         rOuwpBSiEo/vTH+hbtY41GcxjBrXgQa2FOSi0TSV4MB2bIgLI4NyPJsLwImBDMZhoGtu
         z0+kxzHlnWGsy+knOJ43ppn7uNjiHIQckqQAOFrShqrey+q/xkZPhunsplHd+dDpJh4H
         M9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444546; x=1754049346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW3/RZewc04Z4GAtT/t6/g9e88MWqG2n6qtKS4h8eos=;
        b=gu/10uVlGdmnxYPjGXBPPz9bJ0AeH/6wOyeiZi21Vr3l5JciGD3OcD1osZ+vNNl5ET
         C52xdynB00Gku7ktyHDFFV48fCuoSdbCgbbATns8zy225/HMPHMTD+N79x1bZs6+gZKG
         yerJVdVZ3qPAzK67f/oj1WfjvLHY3a1EbihRVVJMZWdHJKDbal2EJ+KdE1XiFBad3OEH
         q28bpaoLReviSgIFBOw6yqAN44F5IXHbsiu2w23RmTFjBVf9kjMHGv/f0OGrQJUZCXK9
         orjHpXBOEWweASCzdluqGU7akWKTWz0yE57Wa41fXaUuPR/gkrmW6LKuvxfZTtHO/+f7
         fE1A==
X-Forwarded-Encrypted: i=1; AJvYcCVmCC/nbqOQs7R1RrByyuqsi+YGKlG4Jts2WIKAiTgccjGctv8YiJRGHgQkK+b+b78z1MCtKh9WBQBw6k6K4TGXhyArXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNCbKleh8B3zRPwgdvs/kQVF8EthL1zL798to2m5+Gc16fGjxI
	OWfI6cECBkh4BR4W/17QdjiezGiX2Y5FPFwUKLPVBo4Ypj1I1+5ew1bhCdMF0U1xEplPTPNQiSH
	JtS+rgIozYj56yeJ6U+dvj6Cv/K5yRPo=
X-Gm-Gg: ASbGncvJ4piRNlNClhG61vgBvPBKJN+4nxiG9ny97ipkccnN2oEEyaVEN17Gz/Sstmw
	7M0bDpWtk+HMxRTy2IYEMILmbWMRr5Rm7nQDT4edk4rPzkfSFJYWRF+asBJV5VzDYFhn1ztbINW
	CGaeR0iVsmzzyc1424q+Yv1ILXtLY9YVWL2XWLohjTwxy0cBAPXwM/E3qNxkeTmWXZIo5ZYGSQP
	PrVFKRL6wUKSLlvN3wr8cJAe8YpDdH5ovJxg89kyw==
X-Google-Smtp-Source: AGHT+IFQLSGhteolx/BhOZh7kHImhRPByLeZr3SrV0xHcjeohc1TolIS9Rf5FAEeQLC7LR/UZZU7aU/rJ0/IuqEp9es=
X-Received: by 2002:a2e:bc04:0:b0:331:f04d:e689 with SMTP id
 38308e7fff4ca-331f04de9c8mr3170771fa.41.1753444545646; Fri, 25 Jul 2025
 04:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250715081158.7651-1-pranav.tyagi03@gmail.com> <0f6e9770-1c79-418e-9135-df692f495a91@redhat.com>
In-Reply-To: <0f6e9770-1c79-418e-9135-df692f495a91@redhat.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 25 Jul 2025 17:25:34 +0530
X-Gm-Features: Ac12FXz-wWa5xMiQLJyLbW0dhFUU7-B1JQL6vLwtj-BbP0qyqr7vZXvi1e48OKk
Message-ID: <CAH4c4jK9nYf2n51m=eaS4gtx9+cjzhXDAb741BA+burmQtD28w@mail.gmail.com>
Subject: Re: [PATCH] net: skmsg: fix NULL pointer dereference in sk_msg_recvmsg()
To: Paolo Abeni <pabeni@redhat.com>
Cc: john.fastabend@gmail.com, jakub@cloudflare.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, ast@kernel.org, cong.wang@bytedance.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 4:40=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/15/25 10:11 AM, Pranav Tyagi wrote:
> > A NULL page from sg_page() in sk_msg_recvmsg() can reach
> > __kmap_local_page_prot() and crash the kernel. Add a check for the page
> > before calling copy_page_to_iter() and fail early with -EFAULT to
> > prevent the crash.
>
> Interesting. I thought the sge in this case are build from the kernel, I
> did not expect a null page to be possible. Can you describe in the
> commit message how such bad sges are created?
>
> >
> > Reported-by: syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Db18872ea9631b5dcef3b
> > Fixes: 2bc793e3272a ("skmsg: Extract __tcp_bpf_recvmsg() and tcp_bpf_wa=
it_data()")
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> Does not apply to net. Please rebase and resend, adding the target tree
> in the subj prefix and specifying a revision number.
>
> Thanks,
>
> Paolo
>
>

Hi Paolo,

Apologies for a delayed response. I will send a v2 of the patch with all th=
e
required changes shortly. Also, as I am a beginner at kernel work, my initi=
al
intention was to just fix the bug and (honestly) I did not think about
the cause of
bad sges. But, I will definitely take a deep dive and try my level best
to look for a suitable explanation for the same.

Thanks for the feedback.

Regards
Pranav Tyagi
