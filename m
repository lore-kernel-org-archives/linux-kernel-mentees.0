Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F01E489
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 05:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753076432; cv=none; b=TRECQh7FYj9nGFcnbiEcbd7ow/JCCru6qDqSPgwqhKxmDq0JFgqhVzfCbk/eqpHyoxWDH5afe1La2+m8nky12YsgZCLbV8pnqDcD4I8Y7qI9d4RvEFj7s8p/aVpAoX5T9qjEHl9nQQHYmN1PVQZpKNCMLI5mH7XoGcRzijx/Ee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753076432; c=relaxed/simple;
	bh=iX+q2jNSRCnOrj9thY+MottftiVMIhrYnrO3+IHfSHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNaT4JSO42jx+w3O+WNLGaWPqTpFafINT2+a1P8t3DwsTKPZaBCAba350lATQantxot84MYEoLLn9SbXikfGz3v9YrTz0fUnCUiJs124vUKpuS49lfU2X6l0Xw4IS5AfTE/2ycWpUHxKvJBGOU75FsXxZt/9IvIjXpSC5i+8W98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF76Hubr; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF76Hubr"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ffb85aed35so3032395fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Jul 2025 22:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753076430; x=1753681230; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iX+q2jNSRCnOrj9thY+MottftiVMIhrYnrO3+IHfSHA=;
        b=GF76HubrLdp82o6ap867FXcGcy98YPX5IAyF7yDeeFo6L1twUhsJbyQ7ORpY+taiVi
         wLG6Dv4/k5bVHNLyCgve2Oun+WA7nAss5HhOlW02/cTm62O9OMNYHlySKKW1DePyT219
         bXpWcB/TZ5Ov1p3wBpF66eR0TLAsH+ePxMsefadQzR+4q5ukgK8735RYWyryfU1kl71j
         ZfnSfcsAFel2QNZt54ZMGh/H1HGKk0NoElZeiYeacuRHRhM5ZrMi4Cy9n3RXvyQrLcfq
         mUJXLvs0PYXgWLyOpiOgdw3GpFg3wWkJ7fEv83DQNuWpqVllMsck8Z8PgTKXUuiXKqdC
         IVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753076430; x=1753681230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iX+q2jNSRCnOrj9thY+MottftiVMIhrYnrO3+IHfSHA=;
        b=rmckdhJHBD1TFVtNVR4wUbw5eTpEAXlqgWciktt12l67dVZhLveAtzgq7mZe+DLDUP
         WDnMfuQXcYBgTquXw6zPkYKZ94X3UoIyhIqKFyrsEArHsskMu4UVMmpJNvRaQAa7emKR
         Z/wYdmVuvITK7FWcp4O1WuUAYsfkhuLdCYdUOpjaFOwT2C8+wN6AlPVayanlqSj4JBGB
         BgkeGfhvizv15PoWMJbF/6wS4QxbZFHEW+LIWjOcsvmCxbCDp9+fineXzLjPPX/jZ26R
         YQz5kD7UpHeWty8vYpA50kwxwMtXS2DKuW131qYgFsgt6uU3/jeVCe+wEEjjXF1/sblD
         Dfpg==
X-Forwarded-Encrypted: i=1; AJvYcCVSSUrHOo3n3urFeOjTY0VS+oxiVKPYNS6WdZX3flxxXBC8h8JlVcowhM9Utn+QcIfLDz87zWDPsOKSqTaqCiDiIxm0DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIo4CUJCNHMVSnKnL+pC0INirar/EycGbFAAMZFhFS+UkMld0c
	+jCjBWpnRaYvrxo53L6V4oBByEdwr0nwORh9t9MA5g5tD27/h1aKHBtg99HGRytbfJ6Ot6z5jLN
	A6c/Yw1FltX7XNY6WKT4plpchqGbg7zA=
X-Gm-Gg: ASbGncubQ0PizMdxp2HDl7HQgY/ht3vrYD9mZYPdHRukkFFFW8rb7pgs1hKFV5XHL51
	jwRDMHagi89xNxDUHd/pj8DnTq9Zq0ojCedJQiMgS7Jg64htRX5VOgsb9jG2tTWCtr+ahS8a1RQ
	t8mS8EuFWc5x0SsLxSr8jN/1FWtm/EL5ZBV9yWQGllpN162khXWSFfDIqovUFCPzi8DV1aQHu9G
	lQy0tiHxqDm3pgxWxHuGwTLPvOkiE4YQD47dCep
X-Google-Smtp-Source: AGHT+IGVDW5DwgDPsxtNTio877e0JtvRpQ41q5Aw4TFpzMaMt/rN9gSbqjnLe52enOAAAhcl6uV1/ExSkCOJ9+m5z0k=
X-Received: by 2002:a05:6870:f60f:b0:2ff:96c6:f712 with SMTP id
 586e51a60fabf-2ffaf53f5d7mr15591342fac.26.1753076429897; Sun, 20 Jul 2025
 22:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250720085905.192652-1-suchitkarunakaran@gmail.com> <aH20-KEurjw5qJq0@google.com>
In-Reply-To: <aH20-KEurjw5qJq0@google.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 21 Jul 2025 11:10:18 +0530
X-Gm-Features: Ac12FXwqf-5IcxmRRFhweSopLncsfbo1HAHsMQAomXOzJCIeeRuDKPaBaCleM8I
Message-ID: <CAO9wTFhdgHEFQDVt2715qP6-6bsE9+AeAAPYe4C8N1mqpy7g=Q@mail.gmail.com>
Subject: Re: [PATCH] perf tests: Fix lib path detection for non-x86 architectures
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, sesse@google.com, charlie@rivosinc.com, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

>
> A dummy question: Does all other architectures have lib64 vs lib
> separation?
>

I had assumed there would always be symlinks, but thanks for pointing
that out. After your question, I checked various architectures like
x86, ARM, SPARC, s390x, etc and only x86 had both lib and lib64 (with
symlinks). On the others, even for 64-bit systems, only a lib
directory existed. I also realized this behavior seems to depend on
the distro. For example, multiarch distros like Debian use separate
directories for lib32 and lib64, and a lib symlink pointing to
/usr/lib. On the other hand, Arch Linux has both lib and lib64 as
symlinks to /usr/lib. Would it be reasonable if we create a symlink
named lib64 for non-x86 architectures? I'd appreciate your thoughts on
this. Thanks!
