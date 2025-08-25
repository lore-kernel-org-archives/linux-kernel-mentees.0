Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBA145FE0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136670; cv=none; b=WQcUIhX79R4CPKNL8d5yVmt4mtmxKDcAm5cWsB37cjsqoJaEs4fe6JkkxpNH42F4soASxlrAWVJRaHVMd0fJpyKbM1uO7o3tb2uGREEKyn2m151Y1lQfZlEibTlR4RRay1lNYfBt/MsBQwR+tID837DC3dffclV9F74PL7edL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136670; c=relaxed/simple;
	bh=qXXtjVyJbPTnTSvv1jiT8zoxv/mOFKWMVHWirfu4Q9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es0ULExQB7umblV8dXGXdc6lFF/JrvLudbQWVF4KlRxpPh2kqvos48IP0zvqjKxKqWrMTyFnGADWiwsLnIIR4s6UQPL/kt7YcqG7IoyQs8KXgAXCUT5t98wEKa+0TNGNPURjzKDclkHRM3q+2YweBIF0mij5YnADBiSmSA8WApw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmLxMnUO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmLxMnUO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b60fd5a1dso9064005e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756136667; x=1756741467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsoEtYln4+6Ly5LWRix+6Kzr4MOEUJ1YKSS8CRff6kM=;
        b=dmLxMnUOI7mj7JFCdbgU63pV5J1AXoqsK/hX8TimMowqEoHoY1vtWo7Ld+jETMJKe0
         ReHz/z/EGo5NAOq2+3HZnaeMvEIo1hZocbDxRhsVjlXfmhFNqCSd23H1M9cNad+Skkia
         ZT1B22Y3XWwNJzlD4r4E9OWkmPkVyasKBErCfx86LbGEXk5eMFtQBi1qN2WPUtpCKjsX
         KdiA2pW1ZIDOD4DpeTVqA+2h3BY8S1zgSY8yoM7H4UgBBkoZvW9cHc+QgNj1vurfNFy0
         bKgDiIPAgDWuESqSq5JrlVR0DkF6zFCMSWxvtUyCoisPYyhFSdkXt0LoDLUQsk/VgHoP
         iB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136667; x=1756741467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsoEtYln4+6Ly5LWRix+6Kzr4MOEUJ1YKSS8CRff6kM=;
        b=TT397sA8324kwMuMcLth0/Q3MAPMp8jWZmpkLz+szunyi5QFRDssgdkvaGqeF1Rdeg
         ZUoAbmdxBkveD3dlVMBIl8Kq2UhWCFB2F3R5SJkwQ0ClngulIBQQCwDLJK/A3IMlqiyh
         XfVnLC/H/Tiowl8Zsrkk1cDp1H4H7spFDChLsodjiHs5z+ytkzcE6Gnqb+tfK/1q48gr
         ufZM2RlwcBZE887hKz9yKRJUJnEJOUWO/FjSiBOk550iHpjPOK7coJweJhUgG/jnOnId
         hgBka5DeK36Dp8aqLttKxDeLCr8WNo1PiiTqAoMDfuGFq4gSGMn846vekDqWwN0kMHgX
         /C/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCZ3b6Mo+K00vJtLDQ58pJvQqh2c+1OMzjfvdwMQ5kL6r+aysCds+IuapMXosW6VCJbSgaVacOrmCYoScsl7i6w/J3uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZAyQCpsUC99bwL1Ii81NbCLC/uSGPN06YdHla4lkoPV4d2QDQ
	EPnWA1/nqlkePHEP3x8sYxoFHlr5tLVlNNdgQ9isW2xgQo9yCqw9DcV+
X-Gm-Gg: ASbGncuQYzeCuddB4RoiR03eKzhkc/7+3GlwTCqMB0Z65WFVfmk0ar+t4KEAmbXg0E7
	T3rYhoCS/BmfGDIuc2NxKkI+fuhL0N6XBdlhe4uKC2gaNuQoU1j5dEEC5gYWcVYXhDPR6AUo0zo
	Pte4Ru2RJ3RRyLPwJxremG+XRx9v8xEmidYvN3mvpCwD1eYYiqKuiRDS1EMBA2MRPjH/j6pBxXF
	7eTQBizMAEri1GjSlXXIUIPpCUKTJlpxDzKO9mSCKlSSz3osnjb+SPWU07N9ZKOaLdBACa4HKAJ
	WrnHNpFwfrMhlEBVES4fhXXjTVCrNQQqYmo0gYT91X5rvoMuYoFwKgKcNMZUjNBfHpgPPGxCI5s
	Cl8a2hsx4R+tHaaAs47/wId8Kk5HMx7vECODUf6358BScMTMeZGU+zww/vdzpE60NNFW+8L+eCm
	o=
X-Google-Smtp-Source: AGHT+IFSi8NXd9p8dDHHrT8TXcVru6c0IjGWMlP8jM1KABVnPN67yWWMt5ZuiIUYpqnay3gjKhFKeA==
X-Received: by 2002:a05:600c:1c87:b0:45b:4282:7b61 with SMTP id 5b1f17b1804b1-45b517dae7emr101078695e9.35.1756136667074;
        Mon, 25 Aug 2025 08:44:27 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211cc8sm12028458f8f.36.2025.08.25.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:44:26 -0700 (PDT)
Date: Mon, 25 Aug 2025 18:44:23 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	linux-kselftest@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
 <aKxf1X1u8QHAdvqW@archie.me>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKxf1X1u8QHAdvqW@archie.me>

On Mon, Aug 25, 2025 at 08:06:29PM +0700, Bagas Sanjaya wrote:
> On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > > Fix double "-ed" in malloc return value check
> > 
> > Refine wordings in error message string literals?
> > 
> 
> I think what the patch author (Nikola) intends is "The error messages' wording
> use parallel structure device, where the second verb should've been in
> infinitives form. Correct it."
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

Thanks, I did not expect to get schooled like this (in a good way of
course). Should I send v2?
