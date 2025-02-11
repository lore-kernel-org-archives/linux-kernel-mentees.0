Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80431E9B19
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257128; cv=none; b=XXXGymL9IKQTjFsDrU37HjYBRgilHL9DZOUygHIVmu5ik8Y/jmqrGaxdSgTVGMWHKq3uHbDo1xzpMMzJVTvb77UHv4lpM9hSHIm8ttCbfPDNHejicFsQLbvVxDRExw9z/q8zBP633zpFeE4yWRKUI2XJnMkawySCRK4eNnxbrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257128; c=relaxed/simple;
	bh=y95fGU1MM4LPX/GdpJQ+n4qKaswP/rgFqTDMBehwQwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvIT4nqi7TNE997siv27ZBioGkfss1wc5PMrD0II9zk8f7/nt7Ud2AZSl/x6PfIRSvVNFmtaLzk1iXhBj077jn90MJYJLmHTW51h+xI7jIceHC5nM0AqiYLpCsXDUS6Pn5JIPsNP0XAw01BAqeJ7T8Mcz7iJS7o0yjx2RK3bCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0oNdXdk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0oNdXdk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f4af4f9ddso59103095ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 22:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739257125; x=1739861925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbbHUiRCm1HRMSRoMw9y9z9V16wOdtH431mNWX2Wxkk=;
        b=h0oNdXdkg8WZmxQiLUrTegzy5Q4qu9txyz803muE+zBOytu42CglpaY8+qFvXFsiwx
         oHddvm6AficUgAQIgxKtJeimP5AhuTtVK3m139eSYtwuYVIy1PwnNgpLPYDZJ1pOF1N6
         rzxFACyK0wvfezF/Bw1u9RKwfume9OpiLdO3NwfSCtsmbtyyYtHNqS0bYzP4FQvBP88P
         6rapwvuYlZizdhrJYasYaaoCYdblYMaX6t0VqXlyq4pi8v1BvDbdq+HToMNb+IlNuGaM
         kQW9MnMIeycfU0UolLnpQsAp8dZVTABjCohOcORFPB8wMeQBkBF6QcB7dLoPlTjEY6DF
         eIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739257125; x=1739861925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbbHUiRCm1HRMSRoMw9y9z9V16wOdtH431mNWX2Wxkk=;
        b=dYwqs1jswdq+tmxmvW2lSztvWjOTl301oj9kLGIDkMYk4LbXeph0/lGQ7fIKMrg8zs
         nON8ByaHrdxRBgK0Ebr8JHR0HgjY+mEZcSq6P0PplyjbDhq0TPn7je8ToR5I+indhhsH
         O1/W3l1/2JjFewN3f2M5s0LeQOHzN8CdtPa5UMVXLfuMFrtjzXDIDSpArpO4OT3+EP0Y
         SXb5W1mnFs3YAV3Pixam4x65Vih7tw8Dnok9GhCKxzzKA2W1tJV6Ei+tiP6RPLj0YNP9
         8bOxEI+VE3QxqCNMngDXKtZUDmbLqtFmrxXpUxP+A8rz0sdoWf2b+/CW0EVKMZvzKDoe
         0GpA==
X-Forwarded-Encrypted: i=1; AJvYcCVuEgGn5Io3bBsIK5qpbn3bU/v0VuLHMwLa+/XSHVwf1Q7OD7sSsCNpiVNU/cUEyOkmDKXj9MLkBrw5QYiTb1+soQ+GKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbcDf3iFQOusMN19Srcc58p4HlStA6O3GXfi+eTpzVwuwzwKK
	bUmuFY7Yd5+ONN1NNuGBe3klumRMAl2aUCHn/KFlkaATABijkFkd
X-Gm-Gg: ASbGncsnkpTtktVcAb+/RzSDBYZ+CHPPthEMcFDf/llt7/m60FKRWPpDhD6jsXi+xsh
	aEHVYc9141P5NzAVCseg6jajH57bdoyyoXD8hUKh19s4JdrUN6t4UytafprBTCUy9EERJWXi73H
	8Mw2rqlGWlYtxUblAhn8ZH52qWAr0x7rFuHrihWI9FEFs5+XEyFBw+V2cUVibjC0RcDrLyRI2cx
	DGIVC5jzDs6eGiOnLm6rhyPgNpzG868RSNASOMnX9uiNHuMzaXX2OACxDANsyzh3NA77+h4E/RA
	GghOeseq2Gdf2QKS33XBWmDuJ5nli92A
X-Google-Smtp-Source: AGHT+IGGYypNjNwNWDfoiOb8NXySt3jh2IW0/2tkps6gTHppURLbDKRPahotbtiFs00rCt6CJbO61w==
X-Received: by 2002:a17:903:2f91:b0:21f:90ae:bf83 with SMTP id d9443c01a7336-21f90aec1bcmr150010335ad.44.1739257124773;
        Mon, 10 Feb 2025 22:58:44 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb40:c00e:5259:b412])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b5d0b6sm10215220a91.46.2025.02.10.22.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:58:44 -0800 (PST)
Date: Tue, 11 Feb 2025 14:58:39 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Brian Ochoa <brianeochoa@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: arch/x86/sva: Fix two grammar errors under
 Background and FAQ
Message-ID: <Z6r1H5V-m_xuEu0q@vaxr-BM6660-BM6360>
References: <20250211025054.4062-1-brianeochoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211025054.4062-1-brianeochoa@gmail.com>

On Mon, Feb 10, 2025 at 09:50:54PM -0500, Brian Ochoa wrote:
> - Insert missing "to" to a sentence under Background
> - Insert missing "an" to a sentence under FAQ
> 
> Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
> ---
>  Documentation/arch/x86/sva.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/sva.rst b/Documentation/arch/x86/sva.rst
> index 33cb05005982..6a759984d471 100644
> --- a/Documentation/arch/x86/sva.rst
> +++ b/Documentation/arch/x86/sva.rst
> @@ -25,7 +25,7 @@ to cache translations for virtual addresses. The IOMMU driver uses the
>  mmu_notifier() support to keep the device TLB cache and the CPU cache in
>  sync. When an ATS lookup fails for a virtual address, the device should
>  use the PRI in order to request the virtual address to be paged into the
> -CPU page tables. The device must use ATS again in order the fetch the
> +CPU page tables. The device must use ATS again in order to fetch the
>  translation before use.
>  
>  Shared Hardware Workqueues
> @@ -216,7 +216,7 @@ submitting work and processing completions.
>  
>  Single Root I/O Virtualization (SR-IOV) focuses on providing independent
>  hardware interfaces for virtualizing hardware. Hence, it's required to be
> -almost fully functional interface to software supporting the traditional
> +an almost fully functional interface to software supporting the traditional
>  BARs, space for interrupts via MSI-X, its own register layout.
>  Virtual Functions (VFs) are assisted by the Physical Function (PF)
>  driver.
> -- 
> 2.34.1
> 
>

Hello Brian,

It looks good to me, though the commit message is kinda redundant and
confusing.

> - Insert missing "to" to a sentence under Background
> - Insert missing "an" to a sentence under FAQ

"a sentence" doesn't really help us understand which sentence you are
refering to, use "insert" here is kind of weird to me, too. Maybe
something like the following will be more direct

- Correct "in order" to "in order to"
- Append missing quantifier

What do you think?

Best regards,
I Hsin Cheng
