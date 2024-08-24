Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE215DBB3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724498313; cv=none; b=hXBX84Gqd/XUTOp/7H+48Opyv6suYQOEHbazOrCi3GwQEAqUZfXVLAA8WYGQZ+6vu0d/pcEgZwRDXoI29Er1qXCgdMrFaLkQMPwqFU39VWAZjSyZO+zrlJsth0edet5R+jVOrJejd9EElthjwWG0DYAHB2uFtHT+ZS04qSrOS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724498313; c=relaxed/simple;
	bh=ArEqVk23aqUOcd1GpupV1li/luninoloc3UULGN4yrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKHwaHUSA0e7m3PwhXJGiblVQ/IqtfXhQzsemVCu4ZRvwdjVkxJ3UcO2g4yXtRHsmi5r+DPq+ohQt1ERzuKp5L2ic8fWVSxEu5YHJYG6Bmpqp2Twg9o/l9dtYW9BSjMCDXzY3z9bnzvsI4XOnyDygLvijH0sfd5/i8CQS0Zk3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LiHwf0d/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiHwf0d/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F9F81A3E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLduxtKZPMkk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 11:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCCF981A34
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCF981A34
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LiHwf0d/
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DCCF981A34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:18:29 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso33994781fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724498307; x=1725103107; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gYbbaRAr9Ic3qjqTHNZx0zH/my3OprgnkZd3LOPXAv0=;
        b=LiHwf0d/HcvTc1+AvTGoQU0IYZblsBeqbIDWydF5yEt1qdCSKpaMNJVGf7cQ9wV+cu
         8yMCqoa14VD+10M3/h9Ndzq06xo+b2UThMdhwcX4zf8/YNW7bNlfi7zXVC2L4YVz4yka
         hTFx+tTT1FXifa83fJMPGaZna0c4ECONSUFkk7CfEEeOZICJ1OT4uhmYuENt4bDCnCCJ
         bk+qzN3WWkR41a+c4YQEPPuYFJsDWoMMhPHDcUtWGcOI3HQi4+DRKaKk+wkg81TGzg2o
         CnMhYbUVIWQOqCT7w7YD8iWjc0nzvgFeWNouCXTTrnap6IexeFHZLjA2E6PZh8Cfexqn
         sOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724498307; x=1725103107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYbbaRAr9Ic3qjqTHNZx0zH/my3OprgnkZd3LOPXAv0=;
        b=dzgYtIB+ugcgC336ruRkiXuaV+2hLAPwMI5SzHJeX1sfgxiDazfnJsefMkEXvU5a4B
         r6DdpjNUWUtuKWxyklZWOwFWwWxVeQZ5bdv1rKDWyhIklN5uN421bDTy5Xhlg4p0gls4
         MevIBcnVyXyoXWtzYDrgLfWGPczJwOC/oph/nVRRjZUaOe+24hic73vOPd0qyBc5Vsbh
         p75CPU/qINsbUzjNgcbj+z6a7GO2i2sVAv3g/kiPaa2K/ia4qcWZc7BZJsw5ZnEZ/UM8
         9CGhinUtwoAbyOCOK/S91cN+uHXFqfs5X4cIqz2bxv12CeW0jzXfHxuhUzfzTV+Mo33f
         Txmg==
X-Forwarded-Encrypted: i=1; AJvYcCVeEl9XpRtXCByQE87Om5OoZ2gKxkZIHzm8QTQtGm2MVuJNpOnCUmdnDy22o6K562BCRB+6zWAfnGsevdcX2HZ8lnMsxA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxfpNQjrWUReS3A0JNafxDAhdXLHdby2XBC+lsrMMdOg91iQ7ca
	i9ALJF271Kai4ZDOgjZI3ED28X7BMIDyV3vS7E8zl7Dr3tOKJFwi28jRyE+BOAA=
X-Google-Smtp-Source: AGHT+IG88fGzP8xPqOhCEV3ZN8IhUmVcvCaclZzixTMUL4q23NOwvu12fStPyuQYpPZvkBVEIDbH2g==
X-Received: by 2002:a2e:b892:0:b0:2f3:cf43:c2a8 with SMTP id 38308e7fff4ca-2f4f579e8eamr37332881fa.42.1724498306972;
        Sat, 24 Aug 2024 04:18:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2adc84sm386803966b.81.2024.08.24.04.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:18:26 -0700 (PDT)
Date: Sat, 24 Aug 2024 14:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <aa6c0c3e-43fc-4a50-a1ee-7afc20388ac6@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
 <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
 <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>

On Sat, Aug 24, 2024 at 08:35:03AM +0200, Christophe JAILLET wrote:
> Le 21/08/2024 à 20:23, Dan Carpenter a écrit :
> > On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
> > >     - if a "mode" matches, do we need to iterate the whole rtllib_modes
> > > array? (have a look at wireless_mode)
> > > 
> > 
> > Can only one mode be set at a time?
> > 
> > regards,
> > dan carpenter
> > 
> > 
> > 
> 
> Hmm, apparently several can be set (see [1])
> 
> Base on a few lines below, it looks that WIRELESS_MODE_N_24G is exclusive
> from the other ones.
> 
> So the 6 char array seems to be sized either for "N-24G", either for a
> concatenation of a few other modes that won't exceed the size of the buffer.
> 

Yeah.  I started to review this patch and found the same thing but I never hit
send on my review.  6 chars is enough.  If you look at the commit which changed
the buffer size to 6, anything larger would cause a GCC checker warning about
truncating strings.

Still, it's kind of ugly that we need to do this much research to verify that
the code isn't a memory corruption bug.  It doesn't feel future proof either.
It would be nicer if this were obviously safe from just reviewing the function.

regards,
dan carpenter

