Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F222C11F3
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741626; cv=none; b=W30B7oWyjE7sxEac0DjI0m4ziijm8P4q2w3CHq505T7CgQMwzJ/zRS/5aWa3F+t55fUxH51XwTpl1tAHdILYdZn3bYx5xV65MDiYevd+Nv9S7LAHJy3ZSj2kW1HLYxGrHmYhSu2Q7z75vkVpFgVord2qDx1xthPTc5p9vIzvKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741626; c=relaxed/simple;
	bh=XfpBAvZqOwTNEUSgCaCihhmfUk8k5MtTf0aA2qf2430=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQOmek1b7I2GlroRxgj+W13/DQcD5huuzqUQ+ysH/zmUfpt3yr0pnsrTK/4daUekF8SMgnwYC4hqDwg87bhpKBXdcgA5LIN/SGq9V0dJ/k6FFmih4690ps8Aa22D92kHxqfeB4ul+cJAd2tEWflgQhYrX9YNWoCCDjDSXpyInhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkRqe96a; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkRqe96a"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b23f90f53aso9288105ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775741625; x=1776346425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fgbBb0rTw3TjhBwEVZhM0hVo3RNJLGilcX30rPUyy/s=;
        b=MkRqe96aZlK/vTXOynb/Yk6pmy2uZ7jGTHHPzOlzsGF2txlbdPjMXELFLeN4A/X7vd
         OHZSF0WgSHMULNGT31PRhkaFqMHt1538mIIf92qmn4RiCpQv5gJLxSfRJQFylQGr46JA
         RSmBEdJpGYOvzb0e4wwK0nxSq+jMk1UmD+ifZGrHn1QEHlJbj+O9Mo+oY7BEyhZOAjEM
         +3DdHrf3BllPJhq4MmIKyVndvW7+/i4E+Zw2OckspVcbFEPOBve3brTTPDYPHHpUTa0n
         qRhbwdbFwbZtbHzBrvnYDfsmJ1fkeyZpYI7BX0PWGbbk54ohc/TXOJaBECFt31kwUcwO
         VbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775741625; x=1776346425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgbBb0rTw3TjhBwEVZhM0hVo3RNJLGilcX30rPUyy/s=;
        b=PjIVn/XtkuyUbDFFJbRxt5dKM9oyTG3FXG3kXa+TAG1X0gfx5ukoG8jNqdwswBOhPE
         nKXrwsRZkA9nOa/YYNU2+1dLatAOmRL8Dv617kcly4ouRbbpMi/05/RaJ8EPDIyIsL4A
         plEjmWifnZN4wcbn/xCC7Q+XXyFQdfY6nTVT4+14f7CR+DAx5DRAyxxDYrfxuA4PayNv
         QJfbV2+iDmdGWJIIRKrCxznFwuXCjWJDFmHoTZz/9gGf1KKAGLYy4qPIkDC9ufnLkU8E
         Ivmk282ICJjGehOcLarL+8arkHogz0zGZ+dww4HCfJpDck4cHw56VfjvuNGJPB4cNT4a
         pdQw==
X-Forwarded-Encrypted: i=1; AJvYcCUiLR+rCKWe9e9jQB7ZwV1Grv0RW/DvQ7BUqPJGGJzH2rKelJFNCfUK82OzVVf38NsmWKBhVIK8+u4kA++H4kI4u8oCfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxREZwyQNPoCEyDSkCERM2OndCgxushlODozllGyANNMbaKpgll
	9CMgj3QZ2w+rmljsyUPf9+EVKt6REBC0g7XRbui/WZ1GLyIlacX+Emso
X-Gm-Gg: AeBDiet+Tunwl6yY9WVXFIQt7C4ysI2ABEHaF+gn7jT0hXIw2JS5pLk+3TinHPW74Ox
	Tb6LTTlaBPoVEEelsOWlk70PEy4QbMy2GYI3ohGmkIAFDLiMljDitHM/jo763YU/IKIVHU6N4fY
	ILn7ch/rv6KXK1Qovs5tbc/g0VkGwJA58Dem+vePJZIpGkBUw7MoMbv2LyB6NcCFvh+xSKG0Qwg
	W0dOitQVpaLtHcLIFpPNKbIRIrJ4AyFxhDRJSrrzwqprNzqGhfQHLpr0MF8B6gF6V/UBZ7mYzjN
	yi2859k9oJRQ9odrFqQBsRrj4RQV2GAyE5jcnA3cd6a/kFuV3dlpNIHF6DNxWrLurpEDo/U04Hz
	0oVIBwnsSu+YiheqxGBrc0GjzNATVmvh2WY4xbSfhh4XbjPhaNKWT196TzXjJevImkmqgV42NBm
	Ykuw6+3yKs2qgtchFD+LiTVGc=
X-Received: by 2002:a17:903:1a26:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b281675682mr257644655ad.3.1775741624625;
        Thu, 09 Apr 2026 06:33:44 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm234132035ad.52.2026.04.09.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:33:44 -0700 (PDT)
Date: Thu, 9 Apr 2026 19:03:33 +0530
From: Prithvi <activprithvi@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: ethantidmore06@gmail.com, gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com, b9788213@gmail.com,
	straube.linux@gmail.com, andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [RFT PATCH v3 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260409133333.2nspag72z5yphioa@inspiron>
References: <20260405114132.310774-1-activprithvi@gmail.com>
 <20260408195940.m2nz4xaz6vdquda5@inspiron>
 <1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev>

On Wed, Apr 08, 2026 at 10:19:13PM +0200, Luka Gejak wrote:
> On April 8, 2026 9:59:40 PM GMT+02:00, Prithvi <activprithvi@gmail.com> wrote:
> >Hi Ethan and Luka, 
> >
> >Thanks for taking time to apply this patch series to staging-next; I 
> >apologize for it not being possible to apply this patch series. I just 
> >realised that I mistakenly was working on mainline kernel's staging 
> >directory rather than staging tree - probably thats the issue here...my 
> >bad
> >
> >I will send a v4 patch series to rectify this issue. 
> >
> >Thanks, 
> >Prithvi
> 
> Hi Prithvi,
> That's kind of what we were implying by saying, "not applying to 
> staging-next", but don't worry it's all part of the learning process. 
> Please rebase on top of staging-next and integrate all mentioned 
> changes in v4.
> Best regards,
> Luka Gejak

Thanks Luka :)

I'll send v4 patch series shortly.

Best Reagrds,
Prithvi
