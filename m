Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB301B3B07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264537; cv=none; b=Bupg1No/FY9wh0QmOiurqmuWmfcUdlRYi+EqbLRqDWa9w3A0QYLniNaS50CNsvPKPsYQB++f97tHLN12bPQFAWwAE4va22LysxosOq+CFd/8UfBSXLXxWIECRUnzR9bn0fJLl9jYvyV2MM6gkrj6MW8cOwYjJdTi9wQsfY98H2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264537; c=relaxed/simple;
	bh=ofGjdtVJIZiLjPOgz/4RTi3L+cafvhVR0TZSBt+kSRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8jgESURt9BXN0QWAv00xZHQwDo8a9XDPIqJwgBuPwgGeAb1Y175tjf65l1rv2r3jM0arehJTZXaM4cltwOHUMTeNhGFvc9e/oZksODR3xPGK0gRus/lBPHAm0DqXGecJ11XPEO1vsRrG2HfbVRBr7UTtI/KaW60AjRnopEYjNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnBAoM15; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnBAoM15"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B786D81000
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XCZw7ubpHWb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Aug 2024 18:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E15A80FB7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E15A80FB7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OnBAoM15
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E15A80FB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:22:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-371b098e699so3662431f8f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724264532; x=1724869332; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+EvylzRgMqclEVa6Y9nb3nnjZ20K0PzDm50IGhF7Wk=;
        b=OnBAoM15aeO3G+tAU1a5187c1vhPyYu2OHAiEDhxCxt60xJgmoXfQNWF/fMHz6Woaf
         Qw0ltw8K1OlliUmUMPhJdUjPfJpEo4eLAEJwORRmcyBhYJ//RS5lqkWcu9C7qetqYxA6
         qkRtT+7i7j3SOlmJyCO5G2h/jt5nTeYYKClwYA6AzS9e59hi9wS4jvYbMeXTJGtlFMCk
         VuZA5poxpuvYKpREgTmrkigMCT/xk0mqYzXYa38svzxTY/V54DhWRxgclVR0r2k7g+O2
         +3l2M0eMv8BHUmSmR9rIDBqKgrwGiZsKhF+ukyxaquwS7P2/IhkC8MU6cNgO/gAlebxO
         8G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264532; x=1724869332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+EvylzRgMqclEVa6Y9nb3nnjZ20K0PzDm50IGhF7Wk=;
        b=OkxHDRYgWLcCia81zV8t86suLCNMlQpp/EgHfD/NYGfFwi3sBwzmq1kAKQQboM/e4z
         BCUuY0bQ6gb0XdF8s5wS68U617kDE4umUPuikIYfzsO4RS2PGZQuy7ZLPuo5UU1qYXMo
         h4ySD1SC/PxIjIQGO2zW0aMmCSOPv6lreEDjzs4U5Woki/gkFX5bdI56bAbQeRBcTG+7
         gaTVdEStSwweACUpqNkyhysP2idRWioEOz8/cchWX0FxPcWYBIGso5HyLlv1/X6DkTM9
         GJ0kFQEOql25RzQeUhvHlbqPkeDazhjmRt8o4rSitg63ZsAKRjrXRz4MxEzAN2DHLFdw
         0ZmA==
X-Forwarded-Encrypted: i=1; AJvYcCXqGQ1OHiiE0BzOz7ZYfcT2jBft4/8jKVpvFbB5M5CHswHAoau2k4vm4kiwi9EaL3gIHzwFyKvHHBptZ6WC+5lj1QyELw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxhe6o7GXZhcOWj5ilaPHXlFIbvocL9j+Jci1rrArFRF5AWOh7d
	dqHH6ZJPbkgzz2+rO7ONTzhO+Ub3Zj3KFvHkOMMYUzwUxt5prgunRCnHQa3OkNM=
X-Google-Smtp-Source: AGHT+IELVgS+H+Ie8TqF+vxzlIUfCOLU9x9LxN780T8l/WKjQpgTUUuHrTucFYyTW7d/n2qVFXgmLg==
X-Received: by 2002:a5d:598b:0:b0:371:869b:4e5e with SMTP id ffacd0b85a97d-372fd57f409mr2961406f8f.1.1724264531988;
        Wed, 21 Aug 2024 11:22:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c65f2sm932819566b.29.2024.08.21.11.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:22:11 -0700 (PDT)
Date: Wed, 21 Aug 2024 21:22:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <5ddb4b56-f78f-4219-8524-cdb2afb3e373@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
 <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>

On Wed, Aug 21, 2024 at 11:18:17PM +0530, Abhishek Tamboli wrote:
> 
> Given this, would it be better to use strcat?
> This would eliminate the need for the pname pointer and align with 
> the current code's method of concatenating the rtllib_modes.

We can't ack the patch until we see it.  Try it out and see if it looks good to
you.

regards,
dan carpenter
