Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57E22C34F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 03:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888669; cv=none; b=IQwG8NSV27Y5PSuL7kFqZHFO2kBT43mz97bOLOH/6Xu4iqENog4A/jeigLMO36TCd9VpKmaNyiyzdCvqo0QIDa10BCWdklQkQ44SAx9klrE5vsPDsSv5oibWdilqLZ9OLH2+3l8qq4IQp72RjbtUmAkHyU9mXCTKOOq6Crq+Kzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888669; c=relaxed/simple;
	bh=h+iQpxuUF2z9uLrEvofKfRG+v5z2Zb87jckGIs2e9/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCq3uV1qx8StBmu6rVljqYrLuwTvRHPzMS4i240HIdzZ2cmsTTgHLz00FiKQFHR6O0avIdg7UHzA1DAwoxoMqjeswd72+qIkCJeGKM6h0r/eQKXuJA0zdS6JBauFU32jQouYCXuk3P8CwqGzXDS78drs0TEO902yk1+ThIA6IMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eit45IbM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eit45IbM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF8760A70
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 03:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wan9EuWw6el4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2024 03:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F41E6606AF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41E6606AF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eit45IbM
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F41E6606AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 03:44:26 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef7f8d4f30so52154237b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733888666; x=1734493466; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNapOyEQ91ZoVlFNBY2PuFB63oHmXcixJJFgp+wWmMs=;
        b=eit45IbM0LIa2qssBzJSm+AUqnvjq7wvhCR1o5OfLphxbHlselS9TEDMalXpGIyjyS
         1nr8hQiw3SY4uwl4OhwMIs/g2d2AoBAWp+VOzcY7EpbeqQbIHm1J8yUfBiap3XxvmKLn
         +TPCkDt6bKm8dX130OZZsb4zueLCBGk1URth6avFwvgGw+CFTJ6OzyZ9zW3jM+4hkOMO
         mGZ50nSih0D+2XhF8n8yOQDSGEZJ8wgZ0EM4gODyyzPyDVZvXBSyG0s+6kcjd7FWh/C+
         owuGolv+zEXjBBRBx3VoRwMwyqoyPYZEszKowCnzLHjHWxW8EmqSJQo2fF5nLckYJNnv
         bfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733888666; x=1734493466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNapOyEQ91ZoVlFNBY2PuFB63oHmXcixJJFgp+wWmMs=;
        b=luICzIWXGPeo7Vv8F+xQfkMcBKQQEHuvJX7V6TRpgxxReb7y/8fYg09HhHTna2ct0I
         eor8dINRz8caKQWeGA9RONdQ8gp3g51vc6Y36KXKMJTesrkS/XsAgqcxuroxGmaC5QW9
         HB7Y3IdD/La5Wv+LaxXCMoh0BbBYhmZI9VKNsDFDaK/YSXGRfZbnxp0sj8IMafczSaPx
         4cE6qvANWhQEbq5tHF7tXqM4yEUzFr6NwbQcA8Fnp/SflxrPrZTrEqP+pUrUskFjvswa
         AusPxP466X83nlyaYqFxZz1kyP9MmY9AsNGNzfl4JkAjsWVDhm9+q1ArGpZ/12xuY8Dw
         MfNg==
X-Forwarded-Encrypted: i=1; AJvYcCU6eI1Una4I3Aljk5Blw4fzLLMVCZHQ/tfeSBUd3WHiRDLhDsz+MsVQV557JTrgWng7UvRGYOv27Y/KFnQD14ZRn4TzpA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxWcIgl/foH++AK5j/8J8W23zl7rgAWJfK2zlmBrS6sNlI2UYpv
	yTRvOmVqeeODY6m/5eu6kAMnYubvRm0Mj1/lf/wSK16rDn6hykuH
X-Gm-Gg: ASbGncu6ojk9qh0/82hA8jfc02UBxXcRBWvSEp3Sdme76EZSrFNeEU0o8eEJEvnVMa2
	Al2r3wLnU/DTyKRtigv3JkzZTCd+YdWMe7STySq7NDzxjP2ZycHcrV9HvmDRd2xfvh/ivODcB0L
	wFvDDuutlJPCKSeMNv/c1/RH3rJwSrRcvH899IkTrht9uCrCcSDV9X5YrmC1tXWlL+c4vNBMPpH
	nZIlQioyCHBr4e0kuEB2HsAv0kJcVOeJzF0DmR1t+I4jEp0z7HxtLoJtvJvvR31KzzXLXcW6CzH
	2zuhhkdYLlVYFf2lzQ==
X-Google-Smtp-Source: AGHT+IG95h9z/msfDeQOwzBtB9buNs0kGCtNIwCEwXSqjPZZJyjcqhT5K+EMuMxat1vH8HdrDpA5yw==
X-Received: by 2002:a05:690c:350a:b0:6ef:6d37:1844 with SMTP id 00721157ae682-6f147fad943mr18703677b3.7.1733888665679;
        Tue, 10 Dec 2024 19:44:25 -0800 (PST)
Received: from x13 (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f14cea48basm496557b3.121.2024.12.10.19.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 19:44:24 -0800 (PST)
Date: Tue, 10 Dec 2024 22:44:22 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: davidgow@google.com, Andrew Morton <akpm@linux-foundation.org>,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
	skhan@linuxfoundation.org, rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4] lib/math: Add int_sqrt test suite
Message-ID: <Z1kKlhUceHxZrMeS@x13>
References: <20241210172822.97683-1-luis.hernandez093@gmail.com>
 <9op57qr3-p152-6ns7-52n6-35599801rq22@syhkavp.arg>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9op57qr3-p152-6ns7-52n6-35599801rq22@syhkavp.arg>

On Tue, Dec 10, 2024 at 02:59:12PM -0500, Nicolas Pitre wrote:
> This will fail on a 32-bit system where sizeof(long) == 32 and 
> ULONG_MAX == 4294967295. (meaning the result would be 65535).

Thank you for taking the time to review my patch and for pointing out the issue with the ULONG_MAX test case. I failed to think about how a 32-bit system would treat ULONG_MAX == 4294967295.

To address this, I was thinking of updating the test case to use a large enough value that remains within the bounds of unsigned long for both 32-bit and 64-bit architectures instead. Specifically, 2147483648 (2^31), which has an integer square root of 46340. I believe this would ensure the test remains valid and portable across all supported architectures.

The updated test case would be as follows:
{ 2147483648, 46340, "large input"}

I'd appreciate any feedback on this proposed change and thanks again for your time Nicolas.

- Felipe
