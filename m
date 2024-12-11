Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E17211A11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949762; cv=none; b=As8CQ+FBOLtSO2KIQC7zFAnfpep5+AOrWBpBv8FE7lnTbBX1kS7G2DvMeUA5jPYZPX/3AylDXeK3gTvJKiRefR8cP7/unaaEOouCY+n0YTTeUYySc4HGlNuVyJsg6kGjNb6LopQLW23kWomfs2BjqgnR7NxANcwpKZe4FcOdzlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949762; c=relaxed/simple;
	bh=zt+gFce7p9BmlGHKA/G5UtDVOqnwFe3Mu9Nc5y11DvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgiXjX43FGNgt17lMH6UKC/I4ac+Q4rHmOLx3Zqm9w0KzBM7Lcr2reQ/DQI1O3i2Rk0bNDMbgOeq87VDTIkVKNMXa5w3mNQQ5DpI1uhY81NSoN2Ws+ClaWUPqQpMA13NA7iP4lFTsfu0mkfu2Dbf1PEAY92wJW1m9jOxqGiMyFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ISTD9yks; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ISTD9yks"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0744140678
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvF-8he2Tyfh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2024 20:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF0AF403EE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0AF403EE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ISTD9yks
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CF0AF403EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:42:38 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d8e8445219so41137046d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 12:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1733949757; x=1734554557; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QqbNdfAl0+PnKaqyg/McU4dzsm66c1ARzs60VG3n/Q=;
        b=ISTD9yksY5W1pLDzN2vUCIQYhtnAM+wqRyheztxgwq6zve/RrP/aTPvdXUTRXnIlHO
         +kpTMzmSTOD46OYhzZESevsB9l3vvhS65PzBwTQCgCHdp/r77lti0CKvU/mQ6OcWj7Q+
         cI2+vH0gb0xPF2Zf4MLYwD8yMFYmzIA/4Cv6eiJuwsyub30K1qTvkNeLReCIP0F7aBrz
         CE+FwGv5kZnDbzsitDIyFaVKgSMiXMaokyK+kfDhRKxYcbFXBQxvP6ws2K2VMHtZC291
         qLv8DYHrW/ag8lmA9HEFhsz4RhTmVxuNW78f7hcNZ/lVwaFKNXm0M14snunNZN6torbI
         fnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733949757; x=1734554557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QqbNdfAl0+PnKaqyg/McU4dzsm66c1ARzs60VG3n/Q=;
        b=eLtQqATDNjxeHYoQBOY5TeEu6eUMuiQ1kKcxuMPf7ffECfiUP4jH9XH2ZLazyk4+1g
         u/onCKMZcOc66JMVOvlZ1v/8Z6K7qkcjRBhU+7FyoX8KKtH37mBIhM4+3wh/IDVqzHlf
         Tl94MlHid1j/ySpBx/4YX0oOxVCerK/wA62ulEIwk6LdFRzje65pTqK+0E6Po9NEHYo/
         M9AxmNOM5FjgUZL6ydKJakbG+3JrMUpbwexDZJRWcUIvG7uOrfDj1rF5pTVgsG0RwVeD
         Twy7ik1K79Dk8QeqJZSe2ausc4gswwuOJaUWuKlPTavpgxr5SF5teh+qqybMH3sgmc8K
         x/mA==
X-Forwarded-Encrypted: i=1; AJvYcCVFOkqOuN/aCs7V15PP6Gw4Gdeptgs09MNqO8GbKvdskYQKZynUTcaAeUXxNe0YZoR5dO7EYL7RCMbRAoixduV84FzLwA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyqu+zvUG3tiz5CK/1A0LiU/lj/3Hdh6lIOT/BLnjYhfYywMSdM
	aJjo4Hnye6AvcDJ4t00A/iEPNhisWLD45tiXiv/7vZjWKjy2dHpqn4hCDDCCwA==
X-Gm-Gg: ASbGncuIZpssI20s8upLFGD9sQD0z1xM6TxCSzkYFDMreo7xqhQs0qiLg0UCPzq7QPG
	noZUf+UBug9/2uUkDdeSAcS2qEKxRj1FEVqO5ndjVjSJnA6UrTGueEUbpAr76YscnXEeULGjAJk
	6w4H9ncnPIE9n96OiUKUZo07c7usaEnWOci4WnZQbUzj2Lr9GVfHQVDO597LnKCzeh4duVZYx9Q
	ZLvtX8Gzh5n+SHsjcdEnLX6eVQ1JXi9OxwnqbKSSE0deZIoaK6xNF8=
X-Google-Smtp-Source: AGHT+IF9wfnACETnd7h+8oR2ewgyIJnzStpbi5TxIuMnorvz2Mi4NfAoRC3aWnanTSJRpGzamD/DJA==
X-Received: by 2002:a05:6214:258e:b0:6d8:83bd:5cfb with SMTP id 6a1803df08f44-6dae38e22f9mr10593686d6.10.1733949757648;
        Wed, 11 Dec 2024 12:42:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5dad])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d907713550sm43096176d6.6.2024.12.11.12.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 12:42:37 -0800 (PST)
Date: Wed, 11 Dec 2024 15:42:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, rbm@suse.com,
	skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] lib/math: Add int_sqrt test suite
Message-ID: <ad95d09e-ddbe-4d43-bf22-00c2008823d8@rowland.harvard.edu>
References: <20241211203425.26136-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211203425.26136-1-luis.hernandez093@gmail.com>

On Wed, Dec 11, 2024 at 03:34:24PM -0500, Luis Felipe Hernandez wrote:
> Adds test suite for integer based square root function.
> 
> The test suite is designed to verify the correctness of the int_sqrt()
> math library function.
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---

I don't know why you CC'ed linux-usb for this patch.  But as long as you 
did...

> diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
> new file mode 100644
> index 000000000000..a94c68816a1a
> --- /dev/null
> +++ b/lib/math/tests/int_sqrt_kunit.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <kunit/test.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> +struct test_case_params {
> +	unsigned long x;
> +	unsigned long expected_result;
> +	const char *name;
> +};
> +
> +static const struct test_case_params params[] = {
> +	{ 0, 0, "edge case: square root of 0" },
> +	{ 1, 1, "perfect square: square root of 1" },
> +	{ 2, 1, "non-perfect square: square root of 2" },
> +	{ 3, 1, "non-perfect square: sqaure root of 3" },

s/sqau/squa/

> +	{ 4, 2, "perfect square: square root of 4" },
> +	{ 5, 2, "non-perfect square: square  root of 5" },

s/square  root/square root/

> +	{ 6, 2, "non-perfect square: square root of 6" },
> +	{ 7, 2, "non-perfect square: square root of 7" },
> +	{ 8, 2, "non-perfect square: square root of 8" },
> +	{ 9, 3, "perfect square: square root of 9" },
> +	{ 16, 4, "perfect square: square root of 16" },
> +	{ 81, 9, "perfect square: square root of 81" },
> +	{ 256, 16, "perfect square: square root of 256" },
> +	{ 2147483648, 46340, "large input: square root of 2147483648" },
> +	{ 4294967295, 65535, "edge case: ULONG_MAX for 32-bit" },
> +};

For the higher numbers (16, 81, etc.), you should test N-1 (and maybe 
also N+1) as well as N.

Alan Stern
