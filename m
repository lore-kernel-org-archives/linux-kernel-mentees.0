Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC422F8E87
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Aug 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052781; cv=pass; b=eswwB4BIRiiKCHlDEacIEWWE1nKoBFZxq8PYj2j0p1yGPVDUjN6meTX7nkRnBKaM6TwS5z7uc+JMhQHZiuUqXzs7ZmTjwRHMEgRZXAqhcS/DIXA3dY7ADpoPe/plALWdtjExd6hoTkOSLvwzt1kqo3UNmH5mgF0Cnd3fYMSVmFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052781; c=relaxed/simple;
	bh=Wfr8L3wblvcW0Bq2ZrAPzo+EmjIsw9i/NV/YDRHbPvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bu/IbL9FPgW7BBeCINeN5yTJiFBPcglAidzcktW87+vn+SboMbseL0jn8Gn2W7U3RErJPYMSo3pTMs2i+ktqL/HCplz0x7+ZYjppnKcbyUJb3JlmVxqkF+WhbwZXbEG6JABYJBQqXTGVmWVdAgZe/A2ZQEwvxDtAH78rby7J+nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtSRqxpK; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtSRqxpK"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-451d8064238so1718251fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Aug 2026 14:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786052778; cv=none;
        d=google.com; s=arc-20260327;
        b=jXfTbIB2l44WLE/upxNVPZaJNHE9w+CetZiUMCpSWXlF7QZ7zXNM0BaMjfIX+yotle
         1BcDXuUs380CytPMmLx/JPDq+6nwu+KYsaNUXZZckH1Ju7DyomMjtqr5tB3q5T1FXNsX
         WUov1YqSupg6caCPAu7SO6ciUlcVo1kGs+O35TecohZcw1x0lphxcWAV0akA0CvwiXzv
         w7xIHTXwspu69daD9giE9W7yp+BO2lutwFFdx5LBkUelPGwbi96HmYFmmF9BEIPWkTd4
         jRdQg71eYPPwUUDnmPUhaFQoaYGNZuIAxnuDOsngIywITgLjtOytoAsyi0b0WQRWP36M
         Oyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LqB88POXPCUrm0OGXikTnU+sodKuQSJ3LtNfIU66ao=;
        fh=k0NYIw+q/LSoCsQL+qAwiel5lVcmnIMJ/I9YeAmp5Us=;
        b=d+2ALiwuRfQ57fDV9T2e3KNFcKTK4S1jX9XfsBlkVigT5t51cZ8Q9ThEbHj+KTXe06
         dBbkQkDGnvGSSnDEBV6ptVi0hg9hVcYRLjTxC3ilKbf5fle0ZuR5owd4wc5/4+/Roeko
         S6iEf23SAZUdykDIGBQDFYfvofzjfEp3dFaRHAw59Qj+NgGYux2NI/lrKoOsvpN6rDBe
         JtHTDCYTfqdhBbrcyjKFI3Z8/0rVSamKOghW7aESisJ1rWuRrXLFevrHeSQLZNhA2sQt
         HMl2Oet3xyrwA7uEoGwaMO+M9GdeAMUKRf458j/BaaeF5YFI+D5cJwVISqX0dRDDNP3U
         45Qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786052778; x=1786657578; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LqB88POXPCUrm0OGXikTnU+sodKuQSJ3LtNfIU66ao=;
        b=rtSRqxpKXmSU2vczKfoj1s1UUm053H25jOcUfPLsxY0R3NqL6VUPTnoivAIRQ3D/t6
         h1Uxf/NRmtmBH1SzEjQaJzcZ49c6BxsCkOtiJdKIKJETH3dl50Jin3tjCUAbmjVRvPt+
         nWAtIddR/HfpgyPjWQF/6VBWMBBPE+UvlKSwBnnlKLwp9eQ/wNDbI9OSin6JaCmYSAnz
         eWnh9RRO2UuR6Y+WK8JEI0HvxJemrNgcwpzAS8oILF96O5jmRZOCgllqM5ly6SFEpnFB
         WQ6Vy85NDuM0xIBWFyn9WVc3g7U59wwGfe5/4Vw3Qhch2QapEIDw6NtqS+w5h95mC5bT
         Y9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786052778; x=1786657578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LqB88POXPCUrm0OGXikTnU+sodKuQSJ3LtNfIU66ao=;
        b=TLPuwecz6Mdxh9XiL6J8dMMn94R6ObFMPIxMWmXi0NJ6bI5kDyyUVU0vXO3Le5uRZe
         c5JVoXnTJUoYLPnpCYLh+Ufs500IftHuKXo8iGeA7qnhcQOOy+rr1bW+JGBcBLT34a2D
         889KO+mVRHcipTQT5gjwVLRHFKQehj18DgeEPdw91eiKfh3Dm1n2p0cVzsI3xrQcWZwI
         7AI/aLWtj7Wqf0rbSbKC4BY8F66l1lq+DdjnUwCZK0xl91WEBVoe33I9fB6gOEqmj/9/
         3Sm03tFPVUJiYe0NHD6bl6VbkAmin9zxf7Am6FdW62dV6oRoOO6kNq9X4Su9GpEomnL9
         KCRg==
X-Forwarded-Encrypted: i=1; AHgh+RoUmBkCLJ/blXZ3z9x33KwOivGCtpT1UsjxatHEtW97NbwI9iyehFtplfU+y9eCs2FshgkKPcJM0TmSYIwf9GARP0XZlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHmcv4asFEVYb9brHewaYmjbtkextr4KOhpFk/CExB0Uvcjbu+
	Ow8UV5/LXEgJ0pgqIxWaPZ3zEOlicc9t1GehzSpqRNzQhcfeV5yFyG/vYtnDKNsJOWIb+4ZhrQc
	J5vXeJLyRpC/d8xk+Aenm7LYTIYi3qKE=
X-Gm-Gg: AR+sD12OpxT3tOrNKwtAFGJrbymqRQddizShTOWQOqa6mX7lZgEBPeq/SMAzakrtVhA
	p4PsYAfCjqhOKt3IbBA6z9/jvyJAlIiAwqSk+8fXnZYXS6Yu1DtfTCL91gFORGT6NyLCc17BW58
	rusUhmYvOGInGAZHmeaPpNdqRIcVhrbBAT1GdBfk/5JjsBQbzpJOEXCPNXcb4JOnXtwMei0TmCt
	NLl2w5ETshUovJ2vaCzxZS9xsTqK/8yc9MBwXPEa/3bsJ9vIRh18WkyrCAQZDo3dADjnePwXsLq
	9WeOGXuvsLo97uJb53X8AtGn/t67NdgCB7H+2MfsM4g=
X-Received: by 2002:a05:6870:e136:b0:451:ffac:5643 with SMTP id
 586e51a60fabf-4599eda4d93mr9510272fac.10.1786052778574; Thu, 06 Aug 2026
 14:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802020614.19732-1-adinata.softwareengineer@gmail.com>
 <20260802173852.32b4bc52@systembl0wer> <20260802181233.535eeb12@jic23-huawei>
In-Reply-To: <20260802181233.535eeb12@jic23-huawei>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Fri, 7 Aug 2026 05:46:06 +0800
X-Gm-Features: AUfX_mxV5h_WhCX6rdYpCZC3Qyu8dhQpGeTB5wv3UFz4WE0D31WUAnv1Muga6Ow
Message-ID: <CABZ6vuBOECSgu=OpnKmk6jsrE-xQd9-nZO_VUftve73AtOEJtA@mail.gmail.com>
Subject: Re: [PATCH] iio: humidity: hts221: Fix checkpatch blank line warning
To: Jonathan Cameron <jic23@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lorenzo@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:12=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Sun, 2 Aug 2026 17:38:52 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
>
> True.  This highlights a broader point.  When making
> a number of cleanups to a driver (and I am generally more willing
> to take those than many maintainers) please group them into
> a little patch series with a cover letter.
>
> If this is one of a set and overall the seem worthwhile I might
> pick them up.  Plus this driver is pretty aged so there are other
> quality of code / modernization things that will make much more
> of an impact than just this blank line.  Take a look at some
> of the other similar cleanup series on the IIO list and see what
> makes sense here. To give you a starter, dev_err_probe() and
> checking which prints are actually useful + stopping the driver
> rejecting Device tree falllback compatibles because of the hard
> fail on a device ID mismatch.
>
> >
> > Also, I feel like just putting checkpatch warnings directly into the
> > commit message is bad practice. Much better if it were "Add a blank lin=
e
> > after variable declarations per checkpatch warning."
>
> Fully agree with this.  We really don't care what the print is, just
> what is being improved and why.
>
> Thanks
>
> Jonathan
>

Hi Jonathan and Joshua,

Thank you for the advice. I will create a new patch series with a cover let=
ter
for this hts221 driver accordingly based on your feedback.

Regards,
Adi Nata
