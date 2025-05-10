Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9931D5CF2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881058; cv=none; b=k8oLAqslmR4HsJ40u+GtL60BqjkbhhJ3B0eDQgGBfT2CVQinKMkfLoRsQTkpthCWsEhw2U6V2JqtE+yPQ2uCl83U88TpwFtH+0e6uA3HAVu+41xv0Rb1UHsyh84YFjaWyeNVC3EmW1SnWq28nVzKwK7iGWS0N6mxSiPXGtYyFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881058; c=relaxed/simple;
	bh=xUnZrRumIWjSwNtFDMxrJAIXv6RamDfkmG2efjYupgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWE6wuYKftqZVFSCqQnO51QOV/WLcJRA6I2LpF2JW902G6aCh2IOqR9nVtBDaQIxmbUWMz0gg/TyCNUJOqSU00bTwQKrNrSEms8NdkU8AUcUy3B6L45uzUMMcXduQsPCGeIYk68QHwL1avQJkKMobAMhYfodjrQnscPl+lDy7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVV0evZF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVV0evZF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7399838db7fso2987312b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746881056; x=1747485856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eu31/aJJu8OERA5r5dU/7oH/7L1eXKv2jBwzYBTSj44=;
        b=EVV0evZFy0MAvhPnhpNYD6yT+qY6QMXMdtEKRUPYqSTTLsFJYs1LQt8PDiLMIAnxnU
         DFkGApQR4HPI5Q7f7ssxmmlgNFSZkf2RoB0ZdVYeTaf1MI2x/rSMPdHys1air9Il1uc3
         d7AeoRwysvMasqy2D77idskBpl8weEAi+KxdgPff6ms5M9euUEP9kVBRBDfkGb1MAm3a
         hxWoZ8ztGo3GWEFQf/Hlaa+ZD6NL1gnrmeABviE2s2Jl/Zyk6cht+7zg2ruYFVAu3RD+
         C7m01MLIYJFiECGLtRgaAFUmGprDE5sBkozgfXo5IXFN/SdQp3VACTu7EqxI4KfKOQGA
         7TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746881056; x=1747485856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu31/aJJu8OERA5r5dU/7oH/7L1eXKv2jBwzYBTSj44=;
        b=Ea62x3SQ3yTIF73B0poUoHnFQIPxP0IO6rvGJoXW3tuCFUOByUpmVzOlTvc6AtMiwY
         wfP8XWc2pOgQhmGvYaXfCIkd9vJEpp6f6rhxRqbjhqVLLEhi16ODiOuNvi4JDxgVgmGR
         h9J26hiKnPnjPuVmAd8KZqJ+9uYXEtHm/8Tvn8JeKT/YHJxy8FL5ozlCovf+ju/MNl3i
         usPr/q00JdQxAvTLW360Hnf0UXTRU6OFQOo5MzlJnN7JO70gYAA7Fvo5jVh/YIvilFbR
         jijETk7+1OBG8V5xGc7CAhu+a1jyxKP3nujGC/Ol/vd8JR/7dcTG4oBzmfeAvnYXVyhd
         w8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xJWIpEN8zgd3XcK9KU+N08fjb7ZLfhvcOTDMDNe8EyvBAyBzCopqaivvh6MZN5CfQ1VdhBItYYFQ/Sf0BXhRH7wvIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj/gbHU6kNESrqSyUZqo3LcKZG6bL6lHLGc+rPAGUJFCjQkO8r
	EehiFtVJCXIZmuX40/EizK3CsTILtD/xRb9wgyis1Sy+boEn0wOW
X-Gm-Gg: ASbGnctuUTsmRFCsmBgEzd4tKnO/yGSbbNFO23/LXjD5OLR5HNfraf+bVqnpR0XT60A
	aZ7N+GsMUhGo+YMCPRgSOLfwcmDxQlXUvj4J/p4KqfpHHo4UKFBjXzQd2aK5UGEbXZka+Go4jMs
	Orizb6/pL3ZFouQqdJGpKdjF/4hOCH3/y0rpEnOUM/avBDWVU2RiUyD17cB/MhBmZu3oRZF9Eem
	Rl2j8IrfIOWCrZ/GLLHCpgmNHs7Jf+bZGyn59oyPu+5X9R5g9lpII2EYOdhBuYJyL+Zwu4t3sOZ
	PKBb5TlFNq0+93IMSzuPC2DGdw+nwhEHDIMLy1QgYXowmZ8izOQQCnzOHq36m4vfA2qg
X-Google-Smtp-Source: AGHT+IEqIrCBylsxkiW9S0K7wrfa55EBhlhJH7qiVLVyafg1jVuSDpo5/JGQWJXb1le+4eIM3gC2jA==
X-Received: by 2002:a05:6a00:ace:b0:736:b400:b58f with SMTP id d2e1a72fcca58-740a91d0efdmr19435665b3a.0.1746881056569;
        Sat, 10 May 2025 05:44:16 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bea7:51b5:8c2a:f16a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0d012sm3251660b3a.93.2025.05.10.05.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 05:44:16 -0700 (PDT)
Date: Sat, 10 May 2025 20:44:12 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] fs: Fix typo in comment of link_path_walk()
Message-ID: <aB9KHNNBzWxMJ2_j@vaxr-BM6660-BM6360>
References: <20250510104632.480749-1-richard120310@gmail.com>
 <20250510120835.GY2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510120835.GY2023217@ZenIV>

On Sat, May 10, 2025 at 01:08:35PM +0100, Al Viro wrote:
> On Sat, May 10, 2025 at 06:46:32PM +0800, I Hsin Cheng wrote:
> > Fix "NUL" to "NULL".
> > 
> > Fixes: 200e9ef7ab51 ("vfs: split up name hashing in link_path_walk() into helper function")
> 
> Not a typo.  And think for a second about the meaning of
> so "fixed" sentence - NUL and '/' are mutually exclusive
> alternatives; both are characters.  NULL is a pointer and
> makes no sense whatsoever in that context.

Ohh thanks for the head up. I'll keep this in mind, really big thanks!

Best regards,
I Hsin Cheng
