Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348027293D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 23:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739315115; cv=none; b=pkoaKk4YsqiZ8jk9NkBaHVwa/fG7OZ1bzIvG5BrDatKMplBY+wEuZ1vhktaHElhSuQSBUXfDCVlIzuJj809yigtVvEBfeMiTO64S+unICNgfB82gTXtjzgt+8pnLYHuV9qYrKYpsgLEvYzZKj0ZsfG7FZ3TckCI4pkOwBcBCxiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739315115; c=relaxed/simple;
	bh=k+T1Cs27K17K8DiALVzIePS2OhqhZ0GNl7kWqwBuYbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5ILfQcPhdxJDczNeDvzFn1wqWU8CApcT5zwx/sBI0HCNjs7zrCDKt9CSppQLBiuLbGtBvB4lWKJZcQh27oQdnokNc1yhCvP6FBuaw4T978vxMthmR/vIqkaGZTYVOPANJLqpa3oJG3v+oPYzcxiHZPNb18kP5vB2lm8l/NGj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd4npBL1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd4npBL1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7d3bcf1ceso352428066b.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 15:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739315112; x=1739919912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=au4tYyjUaE3dthpQOAcr25Z/Ua2/0kq4cGxPjFpOCoo=;
        b=jd4npBL1L9Ox4NxMH3rPYC5TwYiYxfjnpawtXxbidR2B0YESh0Bk9YKiL7uBVZJvK+
         trpsb1bdlCutuRwOpmis5SbUMwO2Fr+7+vjd3u/DZKIDSYqbAmPs6uARXxYEmtxVso4+
         qguTRXbcl8DyGQUgtMP7lkGP3b9XBWibC54VL3mXGS5YsQKd5U8ZIoDR4Niud7yDSap7
         n2FkhZhBJvmy4bayWlhS3HXq7MhBp1xmXbOPg7b6YTaik3tGW+dt/uUsQzSYy/J1jfRK
         xVvTvQfmErwIrlkFhXIHZnMYj7xy8uX21qgIz8paD8j1txpXg0E7+KoVFI1Gn7FxNjpY
         I4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739315112; x=1739919912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au4tYyjUaE3dthpQOAcr25Z/Ua2/0kq4cGxPjFpOCoo=;
        b=dVVnsqKQDAyj5SI+pZ9m7R9WuG1iqRLx1fbE9kCvvibKJKsBTQ7C3s3+IbhY2orM8s
         ClHaGc26LjzKPUwVTYj6Z7H0dL8hoKlB1Z7xCPHO/mZOi0E3eujc1DvBhzpSqljlx2mu
         r/l+6+JSygFWuf5T1KD6qgVshTSO6G7pBr1LvwmQebwewxUkz7QO16sAGa2N/d77aVZW
         EQYluj7jSVgbwp11wfi+Le1elWfyOM4MSxCF/4nVTTpY8q/YtDgAGK9klYSYi5gdVTnT
         PQZqjKklwyf6aBM4KaTjJiuLPOuDQsZzoWnCjV8XwtAZquekj2vPdnhQ+EBNH0Jj1Ebn
         wnbg==
X-Forwarded-Encrypted: i=1; AJvYcCUba/Aem3IWKFG5hN62He3LQOe3uZ0JvCMaxWZutzDVzQ0SeOEXdZmjYWAe8qkQJMaPgKznb5WQyMz3SuQuPFf5vfbLUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYIeCrb/7fHWIW9Aqn7Hxv2pHO8IT/yJCsjSqYNsjpPYQM4hhu
	daEjvlITM26jCkWs4Iu/+vst3CyPZsqvZSxC3uuRSk7sbKfKiNGN
X-Gm-Gg: ASbGnctyczlgAcq7ss/r6wNncvADfs15RmRxWEczfyseUhZRvUhQT5xchGrYtmIgxXk
	boYQVoqD+TnvlkT2UhChcQk6MiWBvWPAlVT4hLzsnyYPOAJ8ke0EP7AjCbb5BY0unX7DbSGMW3w
	6a2M//cAxuS/hemr1zy5ID9fsrNl7S04U47T3vz8fvbVqsI9fL+cR8rnVXti84hF3jKM2QzvRau
	uJDQhc2jhx4RV8Xt4yI5TLuTBMdvjleyb2DX3bwORbMpC2XVRtWaJtrvXXSt+ni0oKWlTST0BXb
	XM8BqiVP7L3yyVudN+HcripDpHIDkAIuKldnoKhAWg5RLI5wW1UruyrddLo0GS4Pmxs=
X-Google-Smtp-Source: AGHT+IGI+JyaHzqreyWTgHAya6OyyTJbR8tyC+vcwIictYrMaQF1JoXigt4HXYn+Qxu+GTO5WrJXxw==
X-Received: by 2002:a17:907:971e:b0:ab6:ed8a:8a90 with SMTP id a640c23a62f3a-ab7f377cf46mr53391966b.24.1739315111434;
        Tue, 11 Feb 2025 15:05:11 -0800 (PST)
Received: from localhost (tor-exit-60.for-privacy.net. [185.220.101.60])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7a58abd76sm766729466b.26.2025.02.11.15.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:05:10 -0800 (PST)
Date: Wed, 12 Feb 2025 01:05:02 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: peterhuewe@gmx.de, jgg@ziepe.ca, shuah@kernel.org, 
	skhan@linuxfoundation.org, linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <x4dtkjgxwy7vyjg7rryvqqu3lwhiqm6jmhr4ph2fexa7m2m2mv@dbefieqhx6x6>
References: <nyskb7mbqk2dvlwhez4sua7ryz5gyi73yker6y3qhd4chyyeaw@x6nhqgtxcyvl>
 <D7PTH0ZUAH5L.VVEECLR4VEWH@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PTH0ZUAH5L.VVEECLR4VEWH@kernel.org>

On 25/02/11 08:10PM, Jarkko Sakkinen wrote:
> On Tue Feb 11, 2025 at 5:00 AM EET, Ahmed Salem wrote:
> > Use POSIX-conformant operator symbol '='.
> >
> > Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
> > ---
> >
> > Apologies for my previous mistakes.
> >
> > Changes in v3:
> >  - Reword mistaken commit message
> >
> > Changes in v2:
> >  - Remove snippets pinpointing the issue 
> >    from commit message
> 
> OK I read what I wrote and I guess it could have been misinterpreted.
> 
> What I meant was to take the relevant part of the transcript that shows
> the issue (and possibly also how it works when fixed).
> 
> Sorry about that.
> 
> [1] https://lore.kernel.org/linux-integrity/D7OY3ZVGJOV5.R3SL9SBFT2DF@kernel.org/
> 
> BR, Jarkko

Understood. Thank you so much for your review and continued guidance!

I will be sending the revised patch shortly with the proposed changes.

-- 
Best regards,
Ahmed Salem <x0rw3ll@gmail.com>
