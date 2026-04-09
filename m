Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64933B6E3
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746261; cv=none; b=VSAEw9L8Gpma6KEd+1TQjUb1syoh05SDAW9+U3V/MdWqLa9RHnH6kG5Mw4RhMtSvhh/ldo/A3ssjOO2VXgZRY/NqN4iS0xV3FOIB+9rgIe5HW5C9u28Ut1DjskNhB2eht5+++rA335/yC4xCossj+Caxa59C8OnBScc8Jvh7WPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746261; c=relaxed/simple;
	bh=U+JsuIiz4aVzMqa1gkLEaVKH1yVgXrfjSe82DThAQh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FU7g9sDLPELubHsv1ce0S+JKnqHbRcmENSpfPykf68E5VVM+iTv1pHLMh9sOXBUv//DM6d+T7L3P1EuuoEcOgECUfcbtNDCqtBcuLn2Fq6l9EZOAA7FCmDLGECpt1rjsZPlJDUb42huY1ftUUUeeQ6kkj+j1/6qp5enRx5nbj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsX6XfaX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsX6XfaX"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce0a9b3f7so530167b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775746258; x=1776351058; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y54Oy57C3TXGFr3MeHG6GB7G+DPz4eaomITtMIsmbk0=;
        b=DsX6XfaXRESPAMoU6JhcOVK4wz9WsYjEK0wX/fZT/R2ndQHLnnAAJCndpB4yuIrXr4
         QdUSaNW8YLuGXKq8zM9w9exIorgWRSVi0x7foR1lrCZVy0zEKrXPo3qyFc9WrF75cG8k
         lRJMeIz8iSseEUZrdnqLRu6fRyPpYBu7nz8bWKcX9XQZGUmYBj5CYc1y1Iw2LMOfS9SL
         Gl/RqZCdsA5kWd729HWYJ09bwCkeu5uVpHFGjJNrnW2+B1qB0jsAor7I/rqmAqezcquK
         F3007ih3vMzbWBU/RErwCtCfq9DpRllPqGF34YTwEsesH4QjRuiJ0ORfflw7/3+5iKb5
         dKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746258; x=1776351058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y54Oy57C3TXGFr3MeHG6GB7G+DPz4eaomITtMIsmbk0=;
        b=W9lgZppEvz9jLKTO0TbPn/eUC34Cry0w+R4cdprCOCi7dXGmsrjdqMiNdjjfND2L+8
         BLlGRej8VuggtMuxoZAEYpPCIMRWup7P8vzgB6GVgHfqNl8CQcYSRBQNJbSE56U7z5Ul
         9SSzXjwHLVRNFLS/bln8nqrFuVGcbpoUdZm8bTtrX1GMD/hmcEEO6fdtZCUvNKDhM2ID
         rnA/dN3JYSX0X3fRMpQmKmr1gT2WbaTXgZ/xFweM5+67Rj38IGrHtAZRxRgfzHS/1sHp
         J5/1W66ZW1k8CXVRJP0CpY3bcmSoh7rxJHLVH5GEnLGya1njoaKtvdk7je9UyzN6BXHC
         XdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV18UTXEHqLYOZa8B66AOxqPcbN7oHEq6B9HEZvdqRdtHCJtkNyRkqERmLe7csCI4jl89pNexrfXqvqcBgz9wagEtX49g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrKDNch4tgQr6BkXUfspKZVGCX5xkg84TWOmkoXBK72LFOOHZO
	uE8tY137699ns9Wl5OTKlzflX0jQHCE7zlu1pqyVjn1aQU1aPtJp7/UV
X-Gm-Gg: AeBDievklnDFsQhtHkOtDTiKPe1M0JMJpTIlcLDJmieE5B/OraYPk2pX0KxkZd8A1vE
	SssUnGFueDpU9KwzsD7GK6e6SmkHuwxXR2UiCN8NwS1EWKepsQ2UqGsiFx723fDRC/DCsUk6Bqf
	x/rY8B/Ng0eJC6Ud30odaogtPCpSI0Sn8PSm0ftJ2iH5LnQ4UM3BbbCUuyhxNAn5ssfqQ0lDSIp
	jlIwbvBu3fnJ57cknf1UJ/NBAjpZ9IhnI5mYtao/g5L+ibGulw5+FPVqKNyw+aQMl2sg9g7qxot
	u5ePGZCNyfYZAO9Y/UrGW44ba/SWgwIT9ovc9lWzTsrC+k0rthwA6U+TdsYzq2V+IpALOBXm8nf
	zAzGQacUZdvl1u++JAWPJPDM6p+xzL3hHdyYEaTTTGT0WUPynzyMcRXckzuqEmT0POuc47f0I8D
	aOzOCQJeVqoQ2Jg9c9Msd5joA=
X-Received: by 2002:aa7:9e47:0:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f024ee605mr1385982b3a.10.1775746258214;
        Thu, 09 Apr 2026 07:50:58 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27064sm31330063b3a.9.2026.04.09.07.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:50:57 -0700 (PDT)
Date: Thu, 9 Apr 2026 20:20:45 +0530
From: Prithvi <activprithvi@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com, rayfraytech@gmail.com,
	david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260409145045.44r4f5bleklkk4ha@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>

On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> > This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> > majorly focusing on fixing checkpatch warnings of constant being on right
> > side of test in comparisons, deletion of empty if block ,use of
> > read_poll_timeout_atomic(), and other code simplifications.
> >
> > Changes since v3:
> > - Rebased the patches on top of staging-next
> > - Remove compilation output from cover letter
> > - Add changes in each patch version in cover letter
> >
> > v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
> 
> ...
> 
> Hi Prithvi,
> this seems better, but I have one question. Did patch series appear on 
> mailing list to you, because I cant find it and my emails sent today 
> don't appear either. Not to be misunderstood I don't believe this is 
> your fault but I would like to know if you are experiencing the same 
> problem.
> Best regards,
> Luka Gejak

Hi Luka,

I just observed I am also facing the same issue - I am not able to see the 
patch series on the mailing list, no idea why :( However I received the 
sent patches as well as your reviewed by tags on mail but I am not sure why 
the patch series is not visible on the mailing list.

Shall I resend the patch series?

Best Reagrds,
Prithvi
