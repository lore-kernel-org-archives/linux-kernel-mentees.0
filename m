Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B271C3C04
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845099; cv=none; b=dlziWdwFZtSadRexRiDfZpmxwk8MjRCsAZIVK7rOA/EmaF1QIxKI++h/ZMWIGRnjsuarD+Wv2sGkxYbLIiszG8HhDFPddwX9RrO3roguer/xLosF2TCji6UK8/T3Nb4LTZgRx1iqaW8cks6kwUoJdOBav5CxsLiLfcqtvK9z1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845099; c=relaxed/simple;
	bh=CYC+j8DE1LKhEPIIAtWsmhv3JgdGMKg+YUwLj9onV54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9Mn2XeqzU7iwFz3dATtqVw1GjDCkj+/bHX/ZxvXywWuAz6kgTQLpfWUu+Jsl+fp1sUvVzDJIJ88YNz2buhRB/Qf/MDZkShy5LUvL43P91h07D2vec46wIkJ6sDKUAEmuU3dgDvtJQcVRMAXbRyc9htxof1UN+z6HTp+9NP5H6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUM6dimd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUM6dimd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7398d65476eso2156683b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 02:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743845097; x=1744449897; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEK0W0QpAa1ZezYhp/Ge5p3VJ+97NZtwm+z2v9PIHNw=;
        b=IUM6dimdkDctcvny4mem/zvYHQEWIFubbiSi5m9waen2lgclv9n7BMLkzM/XrsTCjS
         jTSUCVpeKtixXuFEbxASqq6KbMpPu+2QzNm44hQ6abd2+S8Zjxe9ne/1kasQJayoqZ3Z
         ArwBtQ4Of6dMKSOYCnxDw5gu2faYS0SEurePtwQ1WztxocnJCojslFOG/H4eTf7FHeS8
         V0yOWkdvZ8EzAt141Mz1RppgtDmACop/pNch5u5Br+jnDCGQUxAgpwYN3u9ywEcyfb21
         PhG5MU1E5L8tU1xo3oR16/vm15l9BV4ZCsFyMZ7O7nrXIype6Q7//bYd7vk07cCJuy+/
         Ju9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845097; x=1744449897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEK0W0QpAa1ZezYhp/Ge5p3VJ+97NZtwm+z2v9PIHNw=;
        b=gAmNhYbarFnihYYxyGgtQdvqZiic4PBQHQI7uYRdnv29lDaxrnks+2PJg8nOvzs8AK
         WdWACq/bL6RaOYN/C9jIT4OK7lmTazUundNXeQ58ty5mh4PUqvvt8FXD9W8ZyrkCxShJ
         TuX5o6xQ1VQVdH1EEth0YSYoDkR/qgHJBzOzVgH+zeYtfAP7B5+EkaMiMw6ekvZcKDbV
         1sH9nYU6Hs+IWOcFyforwH3iPWO/6H43fzNkg4ifnP8z71dGUBb+5ioQGkQdWI75WjN3
         02oKCgWcEdYti8avgH+sQK/kca7q1nHvckqhb/hQ/WONW2hPHQWeahSkJq6ouKudyus+
         j8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8Uw+2dVvPeWyFVlkJYfU4uSxQ9i7McYleacrKQKGWwcLOmzA21P8Ttqi/eJ0o0VdI8euBPuNxbxCz/Jis/YXMugz76A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0R+b0KxxNQ4iA1+5GiGLWKlCeUd9/peAxvhh1foClb+HJzdPY
	C8ZAmVOcBZQ1DDHOOLBSJjOahe6l7GITSZxPrGmmaMidwC/9KMeY
X-Gm-Gg: ASbGncuGrjT34LNRTT9nnEQtR/5WMtCRxIVprZk+W3gjsROVY7mWirQL0tSshJgQtdE
	ULwZx6/GPa4zDzlVgTdCLLKJ7rbDJFUI3WB775Gm0cnBZLYz18Hkn0M579bV1yuJWx9XkV2Q+zE
	agRZYLoHwdiNeClK2mYsuFxO0WzVIh/VArYdjA/f4QQ72lQV5WWdxaMc83b1kXgexZoLBHXtxgU
	awfqg+LDL8hVxfbcd7yewr2sAV84a2KgQfHLz6Rmwoi5YZsJwchNVWH5DT++LBSD1WZpCXzmEvK
	C6smcYxF8/FiVWKCo7CqClPCc/c31BLS3gL+LxQaXmVB+DKTM1JwflcilxDc6Q==
X-Google-Smtp-Source: AGHT+IHSH7e84O9pcdFgnOtCs0i95OtpNIn1swFj4yYiGDsyPfoRCp6D/9QBy7kZxrLD01zIqjbo+A==
X-Received: by 2002:a05:6a00:c92:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-739e590a313mr8719587b3a.3.1743845096937;
        Sat, 05 Apr 2025 02:24:56 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb4b:850a:b504:c8c8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97effb7sm5017104b3a.60.2025.04.05.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:24:56 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:24:52 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: akpm@linux-foundation.org
Cc: shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] selftests/mm: Add missing gitignore file
Message-ID: <Z_D25JBTUcZia2GW@vaxr-BM6660-BM6360>
References: <20250405091913.520889-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405091913.520889-1-richard120310@gmail.com>

On Sat, Apr 05, 2025 at 05:19:13PM +0800, I Hsin Cheng wrote:
> Add "guard-pages" binary file into .gitignore.
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  tools/testing/selftests/mm/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index c5241b193db8..c9fd69ece95c 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -58,3 +58,4 @@ hugetlb_dio
>  pkey_sighandler_tests_32
>  pkey_sighandler_tests_64
>  guard-regions
> +guard-pages
> -- 
> 2.43.0
>

Sorry, please ignore this. I overlook it's being renamed to
"guard-regions".

Best regards,
I Hsin Cheng
