Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60758373C04
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Mar 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423383; cv=none; b=aC76j2ARWEWyrLjqXErV/L5Ph9nlTtlLRQBI9ZyWMOVSPMWAu9n1eFUoKMZRZ6DyAq8MKVN6JAECtNjzOfD09+kV3JukqmOZ5TQrhtNk5x3oP/k/9+tQ3Dm2fBJNmI7jdPde/0RXynDe+Z+JwMHZAxtsyEyjqkwvPN4MOyw50Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423383; c=relaxed/simple;
	bh=7ipQqte2yZ9MDbN8E5IAsgZVd4f3naqAvh7sc+iSMis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+4K+BVD7h2eq55CDcNd7cr7Ych/iOCIohst8Ud+pTg8zYkGATZyUOMWjvazfXLOHeJnaLbm1Vz5B+UcDX5kAFpGVwECP7CqA95RlnonlaZZpLh+GALtWNib1ARkZUxsYK8UXmhveLxYcdJ0TXP4ZVJzpzwBNvwrNnQgq2EW788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLwxX5u0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLwxX5u0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so23350065e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Mar 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774423381; x=1775028181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QktAvSAbPbJn2FQ5qCNJTp7ZAkBCXrm/IRSUflqLguM=;
        b=bLwxX5u0FYU5gWAlLUdFYBpretVTKS6DdKpXSJlS7PV6/gXdtmUhzh7DB3Y3m45puU
         3z6aL+4ijrbh4Js68nWDdbJBjuldKEsYaoS06tRl5ebi3AZEkyl9ND1tboctU1sQK+36
         fTZPs5HpThtTjywS+1djHEbgjKub0gflY5qRK0pyraMO1pcjRA9kuBPyxHdqglKO3XnK
         ZNzyTnIRCqtSi2pbMrqffr5u4DzZrSz7Z5M60rMIL9f/hc50vMdpq+rtUcJC0/fBNOTN
         7UmqQygqZ71dpF4f3VkTVXYqpPxlUK8YTbXXqNxcrq+LBcKJWQQsg0T/nwZ013VB6A4c
         mvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423381; x=1775028181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QktAvSAbPbJn2FQ5qCNJTp7ZAkBCXrm/IRSUflqLguM=;
        b=EztB9f871MsWQ2tAYnWO/+wUvxNnOt1ZCUhCH1B45RcDDcrR0W+9AvmyfGJ0bndwj9
         5EiLulFPedR1gF6a7GuXFpbzHnd0VExpycFJd4dMOIGlseQvWdi2NSGlJ5+CV9FqXM4N
         Rinq+/RbYDuxaNtr43MfNLTzZEKqnrL+peebY3dr6mXWaX8/Y0sTc62UMar5mx/q0dYk
         AQrO36btph3KWuxBBwPq11GIbVKE0PwAoIrxNHhTfJoNW+0odywYfZt47ht4cN6WBI3H
         Jrp5duhKcLEZQbX65GKkUtEh+MQDwSbZoEiSQB0aBnIjmnRynP36Hy6Y4R9N2gKGD1vS
         fb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2abd8ul4PA0uG9uT+9yhp+ZSfnKj4tuU7xrKSOhVZedIC0b8foBI8i0BtfMzLk3UsWj/hFM7SpMstLWtsHhmROhkpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YynwEmsw2Zjcp9mt51OzjGltb5dxE/LZVBh2XfgVVS7KTYlfWw1
	fho9ge2lcfTbVhmVG03XWkorvYu4VSM/t3dfeJ2nXCCa9tymFID2gGm5tWrCr/L402o=
X-Gm-Gg: ATEYQzxoY8SWXA3VlZ37CQ7kuvlvAKQ6qA0smXbXo+bl5886mUOHWeGC8AygkUqEBQ7
	SG2YZArMu/C48B0hn+SjUCBX4PGDvaDyCVmjuvkuWTL5nTk7pQQoiPHeXupYN3y7tt24K+ZWJFK
	vh/EVGfobVYRe4TJaxaFzd2wc4zRtbr9XrAJcUcYk7HB23wj7ApVduHX1dNJAWE93Am4GWce41L
	H5vWErGjcgpjEa+x477EULNEyV3vhKHVzPzV68Fq35OGOQfq8S3NQpRyAdRGLyKV71fralAoYGp
	NjTCjkqcKLvLu516Kgr+Zpv8JgyNIN17tLiqvrduue1vEtnjcOT2o7YPlA/f/xGV9gGwqXE4rUi
	Nf0RcmBb9iDQ0pRn/EY7kCAvDwpEhg6yXDh7f335jx9USYKVPMDSsdLG3FLuvJSZt176O+JcvEL
	nH1le69y4PL8wPPaXLJNLneYbEig60
X-Received: by 2002:a05:600c:1e8f:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-48715fe70f2mr31812345e9.10.1774423380596;
        Wed, 25 Mar 2026 00:23:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm112332235e9.14.2026.03.25.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:22:59 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:22:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Prithvi <activprithvi@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acONUF2nLAk6uhQs@stanley.mountain>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>

There are a couple of different things happening here.  The mentorship
program has its own rules.  The rule that people should test their code
seems like a good rule.

In staging, most of the patches that we apply not tested.  I assumed
this patch wasn't tested.  Patches like this are not a big deal because
we can easily review them.  Sometimes, patches change runtime so unless
it's a security issue, we want those to be tested.

> 
> -	if (0x00 == PathAOK) {
> -	}
> 

We normally wouldn't merge patches which do multiple things at once
but it doesn't really make sense to reverse this condition around since
it's dead code so to me it falls under the "related change" category.

regards,
dan carpenter

