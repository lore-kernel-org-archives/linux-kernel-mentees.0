Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A068611199
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oobPpxjW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 184DE81098
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 184DE81098
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oobPpxjW
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXyySkJrGReu
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 09:20:00 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 042DD80FA1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042DD80FA1
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7fb84f6ceso7533527b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699521599; x=1700126399; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMqzOhl9WJdB/fNzCLgAfODP7qyR0cWrCHRSWDr+Pj0=;
        b=oobPpxjWaF/bx7ww461umxmF8APppte60n4MSemIT4VUSpOyo/mhYXQr1NBKIk+uF5
         O8rdkEG9m8bDosqi8cidI9GVuvwp/5hOQKd5LioBVBGHgmjsjmJR82OAzg5DOquvJNR5
         9eNTPBIrM1JOUeSclqur8QZlKZ+kmcyzx68A1mJs2rDFku3Wm2DEly7k4+1ZKfN1CJ/W
         O8OuTWmFWqazoisP3buqYPAiYDnQZktdN0dBmrwYbJOZwcKQUR+wV55DHjSOPDEm0YW1
         LMyjPban3jPnNzDNFHWLAR3uy9vn9WN4ePStYr2E3ASvkFr7OnxKomNNUGy9Gjz7rXA9
         Z4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521599; x=1700126399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMqzOhl9WJdB/fNzCLgAfODP7qyR0cWrCHRSWDr+Pj0=;
        b=E9hkgaowu76mxVvPFW4cj8n85n9e9vxL2sOZyuzYqQ4g3nAkAKzbZFvW6XZFYjhpFY
         QBn3a1HKlM7/is6xjHzOD3wfiN4SZh/ZUZuqyI0Nm7KNfyYk0CmRFMynT2pQnScYaYPb
         9QswC8xfPA48uSGtK5NimmPJxUffPcS6YoXAnvxJ/VvFhcnNInvVldVUkHeEs8C5UgsN
         cpIiE8zXDp5Tonavf7gaEfCtja72OIY6IhVYXCYLECdxSB2FKezMnjK34S4VdUzR4SV5
         VxIjGEIj0sij6IP/QopWHjv3ktzNyacBwxZQU++y2QO3j9VNnREem1smWdazy3j2dZ7v
         dTfg==
X-Gm-Message-State: AOJu0YwhSeOlLr7w6Js5r5rydaVQ0cxRwpeBpPWWQnGQWPHSyn92eTa6
	SITdnAcLqRiPWMNXf7LqQCAcrRMoyEgMs0YKAvPwyA==
X-Google-Smtp-Source: AGHT+IHGslikWjLVflnuZnU/FjwclWe1/pFMwApskuuBpFlo3DBr3i51zm8GUoCtqVS2TkIt+0zIc+bYLe0M7YFt/uM=
X-Received: by 2002:a0d:e894:0:b0:59b:c805:de60 with SMTP id
 r142-20020a0de894000000b0059bc805de60mr4100178ywe.45.1699521598749; Thu, 09
 Nov 2023 01:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231109090456.814230-1-anshulusr@gmail.com> <20231109090456.814230-2-anshulusr@gmail.com>
In-Reply-To: <20231109090456.814230-2-anshulusr@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Nov 2023 10:19:47 +0100
Message-ID: <CACRpkdYtawfonnkGXzTD65fx4CMbbTaXe359tm7=57saHSNfqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: driver for Lite-On ltr390
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anshul,

thanks for your patch!

Overall this looks good to me.

On Thu, Nov 9, 2023 at 10:07=E2=80=AFAM Anshul Dalal <anshulusr@gmail.com> =
wrote:

> Implements driver for the Ambient/UV Light sensor LTR390.
> The driver exposes two ways of getting sensor readings:
>   1. Raw UV Counts directly from the sensor
>   2. The computed UV Index value with a percision of 2 decimal places
>
> NOTE: Ambient light sensing has not been implemented yet.
>
> Datasheet:
>   https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-3=
90UV_Final_%20DS_V1%201.pdf
>
> Driver tested on RPi Zero 2W
>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
(...)

> +#define LTR390_FRCTIONAL_PERCISION 100

This define is just too hard for me to read, can you rename it?

Does it mean LTR390_FRACTIONAL_PRECISION? It's fine to spell it out like
that instead.

Yours,
Linus Walleij
