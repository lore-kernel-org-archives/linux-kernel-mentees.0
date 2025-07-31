Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8106243379
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983594; cv=none; b=RPw6K351LC8p9sg+fp2snWAwdysDZ4bHxjkKBR2ZFNdvlXG4TWUdui6s7od2lLJmY01V51mP+FlGKXTbetW1DSGBssU3Gp7Nq1NiUVQ97qvKc72U/rCTcl2pYTmkCsZuUiwNOvhtxf4Tv8FWBZHtTiE/UJHtKoRcTYLMcmvejz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983594; c=relaxed/simple;
	bh=D0eyeakQXkUoxnhS6LOjXaO2NDWgEEQN8gNn6R8fmQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTRNTPanMkCBJQqPlkQwpBElNLShGEPhWd5M/G9qIAW8rxSfJVLn19G1xjMIKirsVWuZwAYosqD6q3k+fZCt7opt5faO4hXblkVtAh87qj2uNZyi+YhCAPsEpdiBv64mmKWoR+A8mBx0IFcNBam8o7RwO/vWtWxUmWS7Adx5zEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFleoqiY; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFleoqiY"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e95ab2704fso646311fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753983592; x=1754588392; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JQSkOyzA6O++KgoodZR4f5SJR35/IGJdbUx6uOChaLk=;
        b=WFleoqiYg3tjTXW3ouiOoqK/cpHjWRhGGno8UuwG4ha4I25RFN98HYm31r75rrM6mY
         GsIndY/HsIMCNyGu/PgdhxTDtBiXCsckdyth9D9LvsLFsUSQUyS2aCnzQB+IgDF3APa8
         QMf2stnHTa13/L3quWFDbNeafFJSWlvL9BObg/2F3BccpgzDPCfIKd6P/yQ9nLS7yW4q
         fjZuDF3U5W0UR0h1K1q77r6pbK+O7MqkVZCdC/ggKJkUQT7Y3ZRQZRWpK2hfiKPAhH3w
         V8W77G580Flt6x986K5RxRu1anknO+LkbNYdkLlBm08u5/wR0mYmmPbrEeKdx7St8hwV
         3wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983592; x=1754588392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQSkOyzA6O++KgoodZR4f5SJR35/IGJdbUx6uOChaLk=;
        b=AERwHDIKwKq+usAi4rHo+lmJDhf8zVywT6Ejz+lP0LET/ojxC74YmWW91E4BewqiSu
         UhbebZUC2hSMcVVl/CAflpGt21toL55WcTMNug03y9RCWU+7DIlDbeIJl+P1I/B4LPSR
         YfPdfl7QSn666rszS7pkgVarBCDTv3oMR/Hj+Kjwitbaokfu8Qg947wH2zgswWHYsEfr
         B1/NYUVECKwfAMTBOTRHLtRba2jXj4bvdeUO9O/kV+TMn7ZTvLweB1cV4EKTjJH3Ax3x
         c9UpzN2VbLGLmtpdQXQp70d/yObqIxpf53EHOjaKGH7FQ4+4tvxOI6hEciMR1GCLMnlx
         MlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq28HBU7t0+dSssc16bWwlbpq+QDo4+S9n8q6QsoVW3IY/pe9HpMoTD06/z+9H/UYclvkvaRL8bniWAj4HpTPbeS4cPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGYliRloKIDiq+uEDvFaYQcXkchLpSAF3pHHdE9ZlBqeQTAH8r
	U3ZZQr0trggnYwgat4Jen9sF4YnXT4XwnNfp0OaIiaMk490SQ0JMvy42qnGzBrfP2KifmuGXTXN
	K8uuvXHw29dRvemlJa7pBQMdJsXZ/Ls0=
X-Gm-Gg: ASbGncsL7qzPI+dsZ58KzPvjyxjAVf7fUsijq4w4IftmPvrr+p81tSPY17xi3AKnYoo
	TWahnnS7/BAGwkH2GTFFJjVX62zrl5syp/MqnXV0DR9feIvsC7+lBThYzsBBzZs2DB3ySwk913l
	XB9Wly+uajYRM9ANI9hyaN4he/D03aWaiN9Ydo2R+ieK/2RQC3FBb4SeS9K6iB9IzwjZvVUyLII
	bP/XNtG
X-Google-Smtp-Source: AGHT+IF8K1aMntK0gup5gkIQtDoiv/HeMVtZBk8VrB6eUvqSgNrGCf42CNoqy8Qy6/0IJ5evV/G3Q9oWUL49MuaiG6Y=
X-Received: by 2002:a05:6870:702b:b0:306:eb45:960c with SMTP id
 586e51a60fabf-307859bfb80mr5396845fac.5.1753983591809; Thu, 31 Jul 2025
 10:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com> <3093fd14-d57a-4fc6-9e15-d9ce8b075b30@intel.com>
In-Reply-To: <3093fd14-d57a-4fc6-9e15-d9ce8b075b30@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 31 Jul 2025 23:09:40 +0530
X-Gm-Features: Ac12FXz5Tlex75MwJYIHpIkLDLQm1GiTbT22FXNrlirDozssD_dMrPmRplEz7ws
Message-ID: <CAO9wTFjaQZFg3U7eGjk+xXV6S-gKSAoV5sz7fqsuyYUkAMu_4g@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Dave Hansen <dave.hansen@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	sohil.mehta@intel.com, peterz@infradead.org, ravi.bangoria@amd.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 21:29, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 7/29/25 21:26, Suchit Karunakaran wrote:
> > The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
> > wrong. Since INTEL_P4_PRESCOTT is numerically greater than
> > INTEL_P4_WILLAMETTE, the logic always results in false and never sets
> > X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
> > The error was introduced while replacing the x86_model check with a VFM
> > one. The original check was as follows:
> >         if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> >                 (c->x86 == 0x6 && c->x86_model >= 0x0e))
> >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >
> > Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
> > Cedarmill (model 6) which is the last model released in Family 15.
>
> Could we have a slightly different changelog, please? The fact that the
> logic results in the bit never getting set for P4's is IMNHO immaterial.
> This looks like a plain and simple typo, not a logical error on the
> patch author's part.
>
> How about this as a changelog?
>
> --
>
> Pentium 4's which are INTEL_P4_PRESCOTT (mode 0x03) and later have a
> constant TSC. This was correctly captured until fadb6f569b10
> ("x86/cpu/intel: Limit the non-architectural constant_tsc model
> checks"). In that commit, the model was transposed from 0x03 to
> INTEL_P4_WILLAMETTE, which is just plain wrong. That was presumably a
> simple typo, probably just copying and pasting the wrong P4 model.
>
> Fix the constant TSC logic to cover all later P4 models. End at
> INTEL_P4_CEDARMILL which is the last P4 model.

Yeah, I agree it's more of a typo than a logical error.
