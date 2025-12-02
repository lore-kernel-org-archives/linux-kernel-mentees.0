Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFA54774
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695508; cv=none; b=GLgAE/XGNGQ2ATJFlV3rtG0VK4JRLSjz4I4xY/1lhw/zlbduT3EmpDb9umalGopZjmbLAEzpawujK+7nQ6ocYAbtL52FQBi8NKOLFmpYQnWZ+OHgdgjOP5KzWD46jx2AeWxDy85BUIIqzp1ZxFvjaulGgTQL6SL6DkvOYZ9iM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695508; c=relaxed/simple;
	bh=NlRtEfjmqJngOZiPtp3BkA0Auz2ik+L2+TB7ln+mJTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOqmv94bKKUscErRNIAMpWHsa2JwLTkU0JzDUjWRfjgsRm1oyIsJY/N1kBxxNI54s40CMV5wy5Ku+O1pqm+5KCn888Lg6yeExQEsowhN8rJmTrj4WWD5A6tlVsLzcVV0gDmGK7ggJfpdamNuwuRkH1a2YFH3s/RiVvWnE4Lwx14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KZfuKUFZ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZfuKUFZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267D9827B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTVFprJWuERJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Dec 2025 17:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=cmllamas@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82C6B82310
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C6B82310
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KZfuKUFZ
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82C6B82310
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:11:46 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-295c64cb951so1061775ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Dec 2025 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764695506; x=1765300306; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2SmQzdPa569Mipnc8Fvji3wocLWE6hhRcSDli/sldQ=;
        b=KZfuKUFZ7DZZ0P1pr8HE9/pAMDhMCScDEIf0DsOgVGO1RsV7l3MRGM83aZF79km5g4
         xO6CHh6Z3vsBokNWyrgcti6EnOQTvZKn7vn5LppWLVHufUWB+uk0gdQnH8u1j1IhKZ7W
         Hf5FhvO/BNFYAd4Qwkp2hRLY4FN/ZyfEIOFUjOE4CD6doJRYKetIgNRXMsdRpLxGwf+x
         8js1mSWdpZxcIWPRaFsY9gz+LAZCchFwPvea4oWkwlfPvV1YYDy2LNTRwhzrFNQFAvXv
         ErDk5tDi4kduC52Bnr9cVCG+ouUZ19862K+m1C+fctmJEX266KNUAwuEMFXqlRqp0xPF
         JtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764695506; x=1765300306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2SmQzdPa569Mipnc8Fvji3wocLWE6hhRcSDli/sldQ=;
        b=C6G2ElQ7J7etWHUUJg70PsNVQlyRiQt0nJcXQSSmJb3sn04maPH1NiuemNMfcMSgJm
         o1IuLYP4pGldBmLOObp29N4AVfTc6lHEy1aD3h1rjvuMCHcDEIRRHQIuYQphe1rsScpE
         zwzB0STt8cCxBrKXa4g1T8SpOQYqRkor/iJBJob7zNG9K2SFCz5AvvPZw9FCJu/LpiH1
         mY1ksrOyncG2HJ8KCTq0TsnN7SUS7o9tyCsBUuauFyBdJd4fUVF+nP6F0Zo4eCeH6OKS
         AWOLyANBLhyKL1q0+swC+vqR7SzUOx4gs/O1iNDCi3Rhuh07NQVDBsGuSzRLb6N24kOG
         wQBg==
X-Forwarded-Encrypted: i=1; AJvYcCVEv3GnqKXQmzRbssqLtZtDhgM5uPvKuYKmuj4lrS5bAjY0sW8554ca3kbDYSMyCvBUF4uMBZjzLxvx0S6QX/1GSTOEMw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxDWTriiNfULWAup/r5Cr43HsoRiLOIhzBXvseu6f5ASQnmI9/c
	caaXdFrMNS3oD+787ffUmH/5be55DDvOU6oWixZZcX03EYmchR/Eyluzw8TWh5B3zw==
X-Gm-Gg: ASbGnct4+KQD6z5ov8aBCilfpjqDZ8hvnvE0mu/g31auxT6R2rDnNpX2Sbe3PLoZyFb
	Qu72Rxa2z1JpZASalqWSQnoyoOOgZ4qgyT9FoaJC3QH1aiFoQkZcgcGpr/BiTFFswbqO5o2Cd8B
	f+Qm48damwfk6aCKdYLV/TEKiHFK9sjkpLRU9MKAXrCpheE97NJQgF7zs8MEe2uccvCpx0wyJXr
	bIHALx3EHK1Kd5SPvYT9bFP6KLER2uGgoTTY20kmby90Q0umRyBSczH+exwELEW2zG1G/Taja0Y
	IcKNsGcA4I1+/lyCI0GGdP38+XIlafwDHonyS8/YGztXCfU/NgGqMHSvyaf1bQEJTLJhvAK2/LW
	J2SkvMg67XkdH/1uHH9xCRxHebz2OhEWUQXP9Qt8GznYFPk3HQCmARxkgdRJWt9x+qB/Nlo6KVu
	kEI8kvxbaERteYY5QPEO4GjhOiLOb9ie5teAZFzdpWqykxYkThS9zHlP5s8+mY
X-Google-Smtp-Source: AGHT+IGQATs7M+eeKshlxyjYti9Gf/nKtFGuAKmHJ/UOzDc80Sq2/zOORM/Dt7vPzhTo+0wiF4ueLw==
X-Received: by 2002:a17:903:11c7:b0:26d:72f8:8cfa with SMTP id d9443c01a7336-29d648b3dcfmr244005ad.13.1764695505646;
        Tue, 02 Dec 2025 09:11:45 -0800 (PST)
Received: from google.com (129.35.125.34.bc.googleusercontent.com. [34.125.35.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acd7sm162686665ad.17.2025.12.02.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:11:45 -0800 (PST)
Date: Tue, 2 Dec 2025 17:11:40 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve <arve@android.com>, Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/2] android: binder: add missing return value
 documentation for binder_apply_fd_fixups()
Message-ID: <aS8dzB6-CGfitagu@google.com>
References: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
 <20251121111203.21800-2-adelodunolaoluwa@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121111203.21800-2-adelodunolaoluwa@yahoo.com>

On Fri, Nov 21, 2025 at 12:12:03PM +0100, Sunday Adelodun wrote:
> The kernel-doc for binder_apply_fd_fixups() was missing a description of
> its return value, which triggers a kernel-doc warning.

How does one trigger this warning? Was there a report of this? Can you
add the warning you see to the commit message?

> 
> Add the missing "Return:" entry to doc that the function returns 0 on
> success or a negative errno on failure.
> 
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
>  drivers/android/binder.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index a3a1b5c33ba3..535fc881c8da 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -4669,6 +4669,8 @@ static int binder_wait_for_work(struct binder_thread *thread,
>   *
>   * If we fail to allocate an fd, skip the install and release
>   * any fds that have already been allocated.
> + *
> + * Return: 0 on success, a negative errno code on failure.
>   */
>  static int binder_apply_fd_fixups(struct binder_proc *proc,
>  				  struct binder_transaction *t)
> -- 
> 2.43.0
>

Thanks,
Carlos Llamas
