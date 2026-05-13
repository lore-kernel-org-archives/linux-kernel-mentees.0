Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8E37F746
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658440; cv=pass; b=rMaXaF1iIBS9aqxQRlGVwKHnckV4nNyoxdGjIPZrwexbjqzYczSYxfhBwIrTjB6C4pTgwmkC6buu50oAp4LO4g5+5hpfDtwg752QpwPynmw042rbSVowsc6yyHrgU9tAte7K7u6zwHl7cpW9rC319Q8n5CPMU/G2xYAT3gj6ydo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658440; c=relaxed/simple;
	bh=CiwARpb5y/JOPNljtNF8s1Sb7KOaFDTyfR+4JB7d3II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhZxHgedtmVqCpwj75IYwoy1AkTMBzyfwe/LENpRzeAoy63NNemxeGeR4+hk/SDHqorbC+YnRu1193MacAkbBl0+Ee9Uhu0BjPqe3JHlASpdpfnOPny/LwLWPH9A39UpxdeYER3Ef2fpIXxaG1ccHwa9Cn0F3AaHComyzLVno8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgnaCtQR; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgnaCtQR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4738246f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 00:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778658437; cv=none;
        d=google.com; s=arc-20240605;
        b=LsQPZEtvkp1CIcqHPiLhX0TrrkPAqqA9lFB0EoX/rZFz2f6Yh6sWz8ySz8bGlRJ0bp
         kqvpvPOrOpPV7K1MYWWG0tMvjDq0+hwpZdp6Y+oFCR8ZBTHVx0gG6EBpo1euIvMa1BcT
         5nrhGfRd4hDnVdX5NTxdRRO5kra2fjYgHLheqjjLp8OZew35xmsZG6+Kz3AwiANkjgO4
         zrKFh2IpCNtdYuC868Ow8X47NTZoP4lspS2VQhZvMYHqSiSS8iehcvPynzXjMY9FY3+O
         Af94+oBi2EgZxKISEov46lik8f9E6cpeUtg0RwP8tDR7SMqofOMKIGno5rIWqFNAKKFw
         qfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JLebtwIlmx5XxfdgtLUv6xYtkF7xCCbgL/yK5lUJGIg=;
        fh=CenKqUfRO3jDDA7gml4m5llJ7d7wk6yVbXLPixZYjPk=;
        b=f8rdrnBPkwFWeNWxVnk+VOtdcrA8WHSn1Ub7zU7T29ton8U4tS9hLmrLHBYXfLtOr4
         YefGen5snFCUzehOb/zBUAvDznAv3S6773iefxDUWNItJaoYK7/TFsIMMLYxebrjRc0G
         wh3A0CwW/3yNNNc4NJh0xBm/XC+UO9ygyVbKAI9CE82542pUfli3K18ogSFFq+sFrZWs
         CxwvlFeM22KuZgbAeB3Rdezjnh/JT3byY9ojwGv44o6q2DxFJ+qUnyDp3NPuC7mR9SqM
         CrTIO+2OC0TguZ0DeOJbO+0h0/R1cVhWt7sdHiESzc8RiFP7lrB148RHtMn4dXcAe2Jj
         RITg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778658437; x=1779263237; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLebtwIlmx5XxfdgtLUv6xYtkF7xCCbgL/yK5lUJGIg=;
        b=OgnaCtQRlE/klmh/t3rwYXCYw6DEZoh5FcVgIT6C2wOXNUydPMIZXlfbZ3yWV+VguY
         UiaYjPxDZAvxiymRGHuccCDSTJcwX42MMwbazQiUAR1Y755bDIAAA/Nt0HtN52vUyn5w
         lP0oO+N4kbS0j6ia7xLwsc2Wt0pAmPKZDVLXr5ajYnVMH8jFQ8wyYxRXWj/TY8TK2srr
         +suophW7PSTDNFm7UH8tZwViuvzz5oemzzts0RaOTJKns5s/jh02SDOwRvKlfsXJMwbx
         bJrzFMV87fOexZ2QR9ujiUBmfc+Z0nsk50kuMRzz03OkMfFsWlATCxJ9zbyQLCEmkxrP
         TNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658437; x=1779263237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLebtwIlmx5XxfdgtLUv6xYtkF7xCCbgL/yK5lUJGIg=;
        b=fgjyWUoUFL4UrCDfwPWdcC59VLS9kPZyt373q9SLq7UDsapSIFUsnhDtOTCabWVVs5
         GR9fxxstCCW9ngqnMlw1lilW5l59q/7EJ+CqSw46P9mENhd2niQ7V1y7S6zs+Le0Fewa
         slolKnyPgIqkT//8FziL3A3ab8sNaqWvSg2FdQI3iwtHji9/TQDKe2035ctiYjOFcjeC
         yR6BB4w0QxVA/I3Zu0gTkfHkDbOtls8vhkqeH5QLg6kt55fDBM1g1s9ftCDyuZdiWblx
         O6UzgaFMnVkR8YpDdOpvdp7xaE3DlVB4OQS4kj9NBmGYkVmT4uwI0FOSedcPUGoW3bDh
         V8Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+MmBUTDaxCOREHvt1PdM/fOeTR28lhTUgDT3ydRjxZ4GGW+6A7OeZGEowsFJ++ToBWcSPyZRKKPcMLq7VfJRy+KTmm8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXRy7ly72nEvbGAFxp0VjlogCAkKJ0Li2KWq56HYShZ1/6kRU7
	5zGcbW5mePqIEIMg2jHplT16I/Pgkf8pRnkmvpmCwb17h1UI7xXFBfhb7wAtr5hvCct8ZXVCcCW
	RQwKc0bc/1X/su6jRHq+C6CC/ViBv6x4=
X-Gm-Gg: Acq92OF1a57hDEAAc1pGHlwx5zbfphyXI5AtAHOpmoQ3XaDNWjiaj/CdKAfZ0UOpC0Z
	E7aeHMsBMh0MwMkeNWqbW/lUorLIt0MZy8SEjgzWpovfEr3EfTmNeaJ/dMvPugsxz/nu/NOjTfI
	SJXVHomzxGXzkE2J150gXAmYP+MxYtQ8CrtAkM+1bbTdUIcC/SFw245ls1zcoa3jWMRHrtyF1N0
	ZHA/BgBE/k9Bs2M/IxbAfxLa0WJ199+33WlxfNijLeGaq60ly6Bdspk/iySgEPCMqoDsjApXV70
	Vycm0ZqGaf3wobNek08v/RDqmf+1hqD18d2qkotUjSQJG/Y1VwJQqK6yXgCtEzPtgR5G70UGfGv
	jgVr/W/PBhrER+k5+HNndupMkqdn3sytWc7bzNEk390yPSLaXrdTDIDTrjwDHPgixBYHp5XOkeq
	sCYiGOOw==
X-Received: by 2002:a05:6000:2f83:b0:448:d2f8:be2a with SMTP id
 ffacd0b85a97d-45c46ef76bdmr3528287f8f.19.1778658436945; Wed, 13 May 2026
 00:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512223215.25596-1-aldocontelk@gmail.com> <20260512223215.25596-3-aldocontelk@gmail.com>
In-Reply-To: <20260512223215.25596-3-aldocontelk@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 13 May 2026 09:47:06 +0200
X-Gm-Features: AVHnY4IUY9UvVM_elJBgnXW6mOK4SSq1FjhxHOEd5Cpqzx0IiOKJzJBMv7fgZbc
Message-ID: <CALoEA-zrmGs8PjE6N=ToQ6fUk3H63_rpJy1=mBCVVBb1xRAd+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] iio: light: tcs3472: convert remaining locking to guard(mutex)
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 00:39, Aldo Conte <aldocontelk@gmail.com> wrote:
> @@ -379,6 +365,7 @@ static irqreturn_t tcs3472_trigger_handler(int irq, void *p)
>         } scan = { };
>
>         int ret = tcs3472_req_data(data);
> +

Unnecessary space here, function calls and return value checks should
be grouped together.

Othewise, this looks like a solid cleanup.

-- 
Kind regards

CJD
