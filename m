Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992B1D5ABF
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142672; cv=none; b=bjUMQD6KNXZeY04BxC/XOTPt/B5tOhtYx7qwSMVYtnPTkXlpGadGsUiLMu4nyzyCBbG9lF2PFQpXjZ4KfDoYjawmZ1mceGi1q6MhAWwWDEQsUMhEfeHrvnOqtNOEV5+w9dFTfcvs974xLUoGS4s00PTNNTu/P/pfWsxrUEVLniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142672; c=relaxed/simple;
	bh=XhWDg/JIuuCQd4L0mouLCvJf2fOoYTh89nNKKlrcIks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcHoFurxhAI92ot3/0+GUDy9GK6+42OYOPsV9x0p/WLjf2ABzaeSz4KYws4r/l7/1M0dl5BHdiE8F8Rx03Ik6ebgDi7vf4arstXHSif8k2IbjdZpSLLJIshfjjwN5BMZtI8D6AaWqQj+gyTzp0LFI+9dQ4jbNMonPJycsBPDNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWl3OpiJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWl3OpiJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24611734e18so11435ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756142670; x=1756747470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ORHuStfojgrwK2UdFk3EZ3mv0VOd3rvM8MRoO+GpXI=;
        b=mWl3OpiJoLMnHDbIik6466K2pHD3hy2stwLE+Vb1ROIQFKEy3/pZy38uJxfho+xqnE
         cUDj7t6/VD4tSRe4NRgcGTy2vZopjOdBNPdrXi4uOi9dOPNO3blUwCnb1bh8tsZfA6Ig
         RuQU8Md+QJlxlD3KuvT01bKilUMAcdgKqXGomFoYzZsTQDs7WMJOkrrc160Vl0hcigdP
         f7yIctSnlAY3ep9J6mo06niO1R+QFdpt0kgh62MX2aZWxZSbIpv3MZT2vbNkhDvUTpOE
         isKYrmanugMzqVbYygKVcdcjtfDPGuDZCOWKMayVIfIrdzUu4hK6GQOdimIsm4JjByZn
         C78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142670; x=1756747470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ORHuStfojgrwK2UdFk3EZ3mv0VOd3rvM8MRoO+GpXI=;
        b=DPKD0hUhkdmKfdWPkJRXqwpImbnxOS5vjCbc9d3tNnImHIBho/jXS/fgaXjJDp2tf8
         9/y4cEX1tVYIq0djxkGIT3/Hp+etuyjtH3Og+FqrDtihlyxBt70xUi0KFrT6/MB6yaN9
         NT3761eVqAkxp4Q4xHJakbjXyLlGJH73grYPT5XEeHsJcY6Dsbp0bjEac/jS6l2BufWI
         fcp1vLTIVh+Itrk6qyXOrKCDtYHCsgf1kteECqXJOVH05BuFEKNe1BJXom08LR5QVtwT
         BE5nhXtZf8NT27XyJxoVX2cLSntCNRxTThg+Ztua+goJl+oYIV3grwI2dcTqKYhnEiqC
         b5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWAbZIdN8CpQnEyE2E6ErQOuyoDWS/KicBlucjCSmC9OpcaKEcAFWY4UTORpF0TL5OD0woRAQs4GMDGnZp699M3rF8sxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHNR4oHc4C4KQs+vHbPnWexsPqSInCAoiTaMsdsJzCqshkNziU
	nbK8E37wuLUjrZ5lwVmeFyy2fUYbAr2c4h6b50ZoIIEb2SQfpyGpT0uZLAiKBt7wjqop5sa8nVU
	FuiG2fF1Lg6gtp/CXfpWUcG2r9nefZ/FuK6j94ilj
X-Gm-Gg: ASbGncsYvgShLHaBfJ4ubvpuUPLctQXghbyiD47ST4oONijuGx8TnhVpSjy3Usyqic3
	PfGZHS1pNF49ET8csmEBwOhgOleYephUVoWrZ6ARHoNDujl+48n1NaiRnCTi9UOP8lhOvPvYj1S
	nxYqetPvCZUxWAEfsUKlfR8XhNr+r+79L9WgzsprCIOXU5n16jy7e+Szh1gjWl0BRY68Vu5X1o8
	HTlBI8LyXHk7BPugLnLmBqb5pPEnfkYR1q4d3iVeVqY
X-Google-Smtp-Source: AGHT+IFDSFCq0edWCtHzT5OvxvY5tWpWD1aTjc3Lol46yrNUvieLKtXYNl0Pa+8dgZxjSHXFJ/lZHYpA827qlGdI904=
X-Received: by 2002:a17:902:e548:b0:240:6076:20cd with SMTP id
 d9443c01a7336-2467a3cf14fmr5726415ad.15.1756142669923; Mon, 25 Aug 2025
 10:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
 <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
In-Reply-To: <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 Aug 2025 10:24:18 -0700
X-Gm-Features: Ac12FXxRIuAN942liX6eW3sy6FarCbSuSJ3avU2MB-V3vtAsi5N_-7cGnerDC44
Message-ID: <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 7:17=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> On Sat, 16 Aug 2025 at 12:16, Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > Hi Namhyung,
> > Thanks for reviewing the patch. I'd like to ask if there's anything
> > else I should do regarding this patch, given that it's supported only
> > for x86 and powerpc?
> >
> > Thanks,
> > Suchit
>
>
> Hi Namhyung,
> Following up on this patch. I would appreciate any guidance on further
> actions needed, considering its current support is only for x86 and
> PowerPC.

Can we just make  TYPE_STATE_MAX_REGS 32? There's no reason to assume
the architecture the perf binary is built on matches the perf.data
file being processed by perf annotate. Given 32 is bigger than 16 then
this can just be a maximum value (a comment to this effect in the code
would be grand). In general, the use of the arch directory and things
like "#ifdef __powerpc__" are code smells that are going to break with
cross-architecture profiling.

Thanks,
Ian
