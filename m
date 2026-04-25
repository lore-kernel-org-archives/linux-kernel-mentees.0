Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5E1A682E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Apr 2026 04:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777090297; cv=none; b=gG3e5RbAUQ7p5iAFp1AAo4Y2aa70jjGVIKH27MH3U6S5WjsCvA2Eq0vRyM6iUzWeH5XMll1604IyPHifbWSWdpXj+kFz3gy3B8ITzDzsf9Bz+/iDYrFdrC3Ue0AStArCHSZJXUfmTgKArCanJTxd7kcJPxB2HQCQr502/905Ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777090297; c=relaxed/simple;
	bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s08muSoiZphdQvvej69J3fV327ZDiSgvAxhKly01k8rCdJuMAOUJHXfY4uZ7unwDmNd29qGaOhJwwx0Uka2ZEOULJZ7IxrAhHcLh+pTu/UQs11KRD2PMu6Ny4IfGR6Hwe3zn7h5549bGE38A18bQVHq2zwPnZA8MrzFv6JDwaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT402cnl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT402cnl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173E940F53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Apr 2026 04:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ks7a06ogHQ3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2026 04:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 399EA40F52
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 399EA40F52
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TT402cnl
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 399EA40F52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Apr 2026 04:11:34 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so9488818a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777090294; x=1777695094; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=TT402cnltrVyYmb0f+cxl5NPBxfX1FXtMKgaX/5wrUsyYzAlexoQm+0UtM52ll175E
         DBvhEc0R+3tYB/SWfE6miFZ5PANXlGWf3otRQ99a93zXEZX0Mb2/pMHNZHiPfWsAhQgm
         Kft63FgBIFzi3Gp2hxfbWUDgA1PA7LJdppeHbhpPt+ihJV9LwjQYN6oM7uEp8uxQ5dDj
         QL5eIVvhhziSR6ScHmR+nl4DaOKrqTVz3Uo1yJdBz0XpI+lcW5VpSuOjC9w2lXfpqCKK
         pZCKV9mUskqsMGAlpEngJlSxEgUlDJNZQPjmiz7wKKVLrTJvnO7sQEfT1w4k7ns7BSdZ
         IGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777090294; x=1777695094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=Bk+8RSoBPRfGef1MlplnXl6VmX5B0bU2L6AbF75KsRjo0GLPjj5RvXatfDYU0L03UD
         Cnv4FSkWhhQcpFKgLkrLcqEHUys/1Y3LKyxCxRsNNUAJ68Nf11YB+S0UwxA6QHTGWQMm
         2eQp9eSACorEJGTInkV8n3sQzxNwdBLl3AgEiWgLJqz76XePHDrYiXW43gFPwXcX248Y
         ckgYjAEimplzZXklTdWN5Rq5dpGp/8Z2QOLvciPEJaGyZZak4B4GR+6RCexGdwjBr1cY
         Dst5q3H4hpNQJj3e5QQmpPR0o8HunNupE5g/hH2KyXL1ncuLewq3okzTpw2b/WJoQoqg
         o2Jg==
X-Forwarded-Encrypted: i=1; AFNElJ+dz4OPRjl9OqsmUHK0nuKj2/o/YYurKPNjIyJRho0yhE0YEcp2OuR48sVlmpLCMZ5tKz6tg9SHhbaBV3L6Pe76FxTW3A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzso5fkjq2rB0MU3KAtLI+qLmQE92ciQNxNtlX/CaHUUZqM/EZz
	XtW9xP7KKme+QgUBxqavCJFQ5L1ZTzszFbidGa6UKmmTYuRvtgZBNlGh
X-Gm-Gg: AeBDiet+9bS+ZIQ83ImCCCXmVwR2QJHrQa7VNiThjivlqAmHlwMOV/e82mzQwGdw1VN
	riOH903hw0tdaze/EZnjo0z4SPADPX7KPA66E0Mm4nWgtHY/dXzoBaW/OVoQBiQgmYsRlzHP1FD
	GoFhJKCV9zHwuxq4nhyozdIKMnP8qVUl5LsBWtZqvOZIsPILrFC48PzgubjYrfTIArlH/NwAwei
	IaHAb3FiIZxwpHxFH6XuPxHaLEFiC+YuY9J4bV4aKKa5pnwD+kx3iO/Ox6+rfG/t5erBT3N17v3
	HesUbZ1iBSsYkHjmbznqYtxd3xqpe5stL6fWV8wdnQnoF0QT8xwba2MrAUnF/A+SCSE1RPTiRLw
	8jd0AnbuqJseLcnE9fLNWFXnCpHxI0Rfkvno9tJeZAbfv+HwrokABrY+jYOo7U49Qt5kMal91dj
	eudL1NWmKLYSIm5iBsaY4vXioaX6GZdrYKBg==
X-Received: by 2002:a17:90b:3504:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3614046f76amr38398081a91.18.1777090294301;
        Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
Received: from soyboi ([158.140.167.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361417748aesm24262122a91.0.2026.04.24.21.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 21:11:33 -0700 (PDT)
Date: Sat, 25 Apr 2026 11:11:25 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT v2] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aew-7ecz_4MCfu4t@soyboi>
References: <20260424081538.459564-1-robertusdchris@gmail.com>
 <aesudPcQ8Fec0_VU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aesudPcQ8Fec0_VU@ashevche-desk.local>

Hello Andy,

On Fri, Apr 24, 2026 at 11:48:52AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 24, 2026 at 03:15:38PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
>
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
>
> Unneeded detail in the commit message. Use the comment block for that (as there
> changelog right now and other stuff you explained).

Alright, I will keep that in mind for future patches.

> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
> > v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).
> >
> > v1:
> > https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/
> >
> > I am not sure if omitting the error check is intentional or not, but from
> > what I see from another ia_css_pipeline_create_and_add_stage() usage
> > in the same function, we check the return value after the call and return
> > the error code if it's non-zero.
>
> Okay, while this observation sounds like a +1 to the suggested change,
> you still need to dive into the code and try to get if
> ia_css_pipeline_create_and_add_stage() failure is fatal or not for
> create_host_regular_capture_pipeline().

After diving further into the code, I am not confident enough to
continue this patch. I lack the context and not sure if this _seemingly_
small change can have a big side effect for the overall driver.

With that in mind, I will not continue with this patch. I will try to take a
look at another driver.

> > I also don't have the device to test this change.
>
> It's a pity as this driver is quite complicated thing...

Yeah... Let's just say it is _a sight to behold_ for newcomer like
myself :)

Thank you for taking the time to check this patch.

Best regards,
Robertus Diawan Chris
