Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA42116F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761427099; cv=none; b=qqv3y55pb0JDQK4AdUgrcJfw84I8H2ooV3unZPE62HO/DBiQTGZBkY0wji52pZmDZNIbEpyA+4ctolG0RV+vV2gQ+ky55TpImNM9MfVxAoZz63i80InDMaCsBj3O0IUPhO0OlQ97M2fckpCoLP43aW8HbbAcTl73P8CK5LYzOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761427099; c=relaxed/simple;
	bh=3bsFJNE4DE47AGrHwWCWsH5kkVM8VML79+gkO8TWy4Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjV9zIPJZiMKB4zagboQGErG26LtL4XJhYkqa/OufZ3aIZ5m8F8arX8WeEdn+LxuIHKDLMt9OhIGeP8tyrPbzLfnwGyWIy3UATDhlPCtDIuVLxMa0RNO6QMTdDll9S+/zG34X8lUj8Dz63zn1mJYrPL049oXIz8dIpolRvxpsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbBZrdVd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbBZrdVd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC754405A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 21:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iNRAYUXlwPa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Oct 2025 21:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=olsajiri@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEAD94059E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEAD94059E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XbBZrdVd
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BEAD94059E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 21:18:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so5512565e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 14:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761427093; x=1762031893; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3c1WBcRxq8wi3EgsqQk7zV+qxOcJsiv7FtZH/pCDIvU=;
        b=XbBZrdVdfYuY0oMwXA3x4DcNFnmUnoVv41uAJxRnHYm0UJ5YfdoYGpVMKxPMgnKkKD
         NjmCCPYIUJh/bWqjAhUQfXM9/HG14N003VkmqeuHZQEdDYvKyvMJ6FRFNaj8oM82OT+b
         3mh+AuHFIrwvLLJpPVXm/vvLCziYcOrNQ3TXSHc8N853Y3zkjdjKI7XBAAiVvnw8zMrF
         ByhF6VnodNfuhqopJ8PVZ7HcSSrBPfjXDPfsN/w2ZiqR34EFvqDoeEKLy1fMsT+QCxuF
         7qrVrwqPxsJ+C+U6XubPgtBqS2cELy96kHapFo4fgy3aUO/xmeRvgLEfzbOzM361zh57
         7ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761427093; x=1762031893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c1WBcRxq8wi3EgsqQk7zV+qxOcJsiv7FtZH/pCDIvU=;
        b=kxNHWppgzU+Y1StyqRrH2JULPPhDDcE/eVa9Xa4/L9vV7yD22zkJldIrB++OGa1bCE
         8b5UE4sznzJecge4+9CTF2Shx4FlFjex8v366Q0m5xLDysCB/asz7LJASL1i+316HSL1
         KCYQveenbukOSJQBfrnC13s3j8xlKScFwJ5fza1nJ8fcOBpm0kfIRaWXbBb46cOaa+ey
         II3DwOv4jFscKc4Whv3X2UfdFinvRCMIKILaWrZjwnAJKYhtiP0jfbZsotlL8oQ1dPX1
         oib4qJwvLtbax/qq0C+D6nS+efHJSfVw02arsWu/2GMWPLrDPziSba+k7B6CmWCr97BV
         gQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcs8YL2YPBErpUmW5ynuxZSz0fnNrlJix9308tmDZEpVJIWseOlRsFTVNkShdbMqIx0oBCQD7Ifal+GTlWbpmjAsEV7Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyJhG0P62lXdNyd30rZePYIo/2atwxa4R8jUlU0QK2zbtfe9wol
	cDTXl8yCBvbof8D1QihQ1Mz3WJhkYYGkCzxTH/67NSNXPc8ihDl/No9K
X-Gm-Gg: ASbGncsLKdAUUuIAJO1NAz1gTk8qj0edC+pnRAQxFMWKi/gmVM2hCjBBPE5tCTPzjs2
	Bj+hXl6jLQXOb5mIhYOrfVhp3umVS3FsguoCBHgxocq4MuDy0ZMyoBct+hyEWUxE5akmsKTHj6a
	+qrzc2WG1z1PIIcy1s/gfJP8ObkQxjlUzV6Q7rWaamdLAxBx5ye5FuZlP4TuL4/1qPBrT0FUsLf
	uJWzIWbqBDgwcCR1RWjorDIYfv7r9fYnKYrjdAsmySL41aX98mU4iL+rrjQi3FgDjERJOPCj+Oh
	5mrfoeTrSGpC2nB1WA6PRrR3h7+SVTi6Oa1rGUm8iW2ZxJCcvJ3bHVNEXjQ6C3rrHncE0BO6PHb
	lWGW5HDIjQwp2VYUQ4oFadmMeRFVXtuEyj6JMWib/QR5QOxoMD/TLDfjtAToRFpLs3FV2KDMScC
	g=
X-Google-Smtp-Source: AGHT+IEKmGV6iwycAf4O/Au0c79Uf5s26+e12RwvflkfNHz45yscxbt7voylHffu4v/BbZtKilFDgg==
X-Received: by 2002:a05:600c:64c3:b0:477:ad4:4920 with SMTP id 5b1f17b1804b1-4770ad449b4mr8309285e9.10.1761427093382;
        Sat, 25 Oct 2025 14:18:13 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db964sm5427322f8f.33.2025.10.25.14.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:18:12 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 25 Oct 2025 23:18:11 +0200
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
Message-ID: <aP0-k3vlEEWNUtF8@krava>
References: <20251025184903.154755-2-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025184903.154755-2-nirbhay.lkd@gmail.com>

On Sun, Oct 26, 2025 at 12:19:04AM +0530, Nirbhay Sharma wrote:
> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in ternary expression. The probed_uretprobe and probed_uprobe function
> pointers have different type attributes (__attribute__((nocf_check))),

just probed_uprobe right?

> which causes the conditional operator to fail with:
> 
>   seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>   expression [-Wincompatible-pointer-types]

curious what compiler do you see that with? gcc-15 is silent,
the change looks good to me

thanks,
jirka


> 
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>  		ASSERT_GE(bit, 0);
>  	}
>  
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>  	ASSERT_GE(offset, 0);
>  
>  	if (variant->uretprobe)
> -- 
> 2.48.1
> 
> 
