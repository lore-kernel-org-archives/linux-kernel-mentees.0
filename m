Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F9442C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753675167; cv=none; b=MK1SFa7ESdBquTbHXFnMDm0Pv/H7qWzQ/Dt37DJ+TVDd/7ytpuFt+DsJXAkNRLITMH+9GjWCydpPoMSgK5q7Jlk8ZCGsHhrDQ4leRidhIAFeViiUl4awtA3Tm7rpQ+8+INGrBrCwBjIbUU30vWYyuTL0bJw9jm5MOp0XR6YtD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753675167; c=relaxed/simple;
	bh=25WCZfdlSmz3Rs3lTNoAlENbPfw0G6bC1g+GHwEHQ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m599XTybvKJ32Ir8r2po2P5ljRmf2i8ifZESh0Zyig8waABhBMB2Lf1FrGw3l6IkkINn8eDy7yJPhBWcNAO8gjZmlNvqujIViRWBF9oCIJXkQ445e7ABwy96fgTJi2M/SzGxXRNzLwRjmvBuBPYqQgjESrJUzUxMLL0Oxe7YsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq5WQj3N; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq5WQj3N"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-615d75ee53dso1007915eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753675165; x=1754279965; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQuttMM3zYnydbjU8s49BqMo+slGpuyfhBNGS8FBZUg=;
        b=cq5WQj3NuisHE3Q0UWgvy47b9pFU54c6IcjTMkQFqquIcnxceweVYdasYMAL/1N/BH
         Pl7FZIruFxE7bju5CNTFXjvgKuq/Whp4XOtEWPU6A7vHwhp4+31TJfXXaqK6/1ImD6sZ
         IYgZRj4COtpUyezvybFcFJk5ZuPEPYSF8ow9lntvmIcCDs8eSA0iPqaSZYwVoLojCXRr
         gOp+RMU3Uor4AHN2R0/B7aQ3qNHYWrIQ8HcpxsqREd2wV6aX0zTOIf1f2yKacfHSMSTi
         GwmM9Yzmit7sMOFGe/B0JOdrvKXuwWkD5t6MO23ePzhEAmz3zNcLqg51mWI5m4W9A2uA
         DhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753675165; x=1754279965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQuttMM3zYnydbjU8s49BqMo+slGpuyfhBNGS8FBZUg=;
        b=WdnGtT5XOdhIg+AzElOKYc3A68aUngUYZvAnUPC3dnXGhqztYEvjUFOUodfD6o1ozO
         etOzoptOxFcwK9yVvrqjR/wNuq8vxBouJiobV9C/7YPzaGH9yLs1nWuR4CVdw2tQZyCr
         BvZjEmantGhQbhsXCSnfF2+0NkmQAE0pxAFXshjy+9/15rAhT6/Bvrqpw8dMIMp9k/ZU
         M6bA+Bvq71GvE0ep+xQ4kpdOtbmwTAkGN/CvxsiTHIPIv6NgoccJqiXo4SQjjHuSvfXW
         +c7kBvKw28RIHVCO0+MqVLEsHoLJkiVJEg7HORuKzPHSGa8GXU0wKqxIwzO+zaIuZBTQ
         b0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUK/HaWQ4qAjesy35Exalyfb5hpTj+WyiDEzZr3x/YSa1Z12h1pc+MIca0BxA/6r1bHY/Jy2VKBTGS1KjBqRMhgdp5Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZAGRguTrQ8hZ3TspHunSyToHGSc4S0RszGealfOekDiertxJ2
	JK/aOeZAU4nOkAcu8SCt0x48aSs20uM+dxALGaX1KpoAEkxQdcZLKcB8SddlDeItsLM7iah9XZY
	QtDe6LP+EFFDZkS8nyngL6XZLdsirgAU=
X-Gm-Gg: ASbGncsuemm0vLpP9IU8ZOSQvp5cx6f4expXR+E+GZ6G9XxanTgNWKf1x8HABskqQbu
	q0EiNwRjxlFbpqhpI4YfrKzrlU//Oq0rJOM7xHsvwREU/U7nCMd2g/k4OWslJUE7tVa4j8xGRHr
	Sbg2e7gDheiaim4LVj3//giHIEDCebHu+4RL6wHMNu7v6zXXp3vNMx7y/9z2lf110M5k36zxvLF
	Rs+LBDm
X-Google-Smtp-Source: AGHT+IGoxMOO0qrg/WJd4pJPQUD4scsCUweD2Zzk5YErFU34dJjBsHSRkWvbDlDbCyH8+t6n7xnh1BzEUWgAmZHHXlQ=
X-Received: by 2002:a4a:e903:0:b0:615:e61d:2dca with SMTP id
 006d021491bc7-6190c944cfcmr6726973eaf.2.1753675164910; Sun, 27 Jul 2025
 20:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com> <aIZ7sDZdHAOg2cf_@fjasle.eu>
In-Reply-To: <aIZ7sDZdHAOg2cf_@fjasle.eu>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 09:29:12 +0530
X-Gm-Features: Ac12FXw_dAhiuMtki3n4Q2NhUESTSy3iod6ZPQDaRNyud3xIrmOpJkhZ4n2Rzk0
Message-ID: <CAO9wTFjdvjOcL7EBJiUmK90hRMF3RWp1+w4r2ciDKcNsn0x4Jg@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 00:49, Nicolas Schier <nicolas.schier@linux.dev> wrote:
>
> On Sun, Jul 27, 2025 at 10:14:33PM +0530 Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strncpy(), and null terminates the input string.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Nicolas Schier <nicolas.schier@linux.dev>
>
> thanks for your contribution!
>
> If you want to continue contributing, you might want to check-out tools
> like b4 which simplifies sending and tracking patch-sets.
>

Thank you very much! Please let me know if there's anything else I
should do. Also, I'd appreciate it if you could take a look at my
other patch that replaces strcpy with snprintf. Thanks again!
