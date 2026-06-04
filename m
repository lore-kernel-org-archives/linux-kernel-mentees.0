Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81233E1216
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Jun 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562313; cv=pass; b=PquffoL0JyXSvDytRT3e1ErV0tQvNLq6ou0r63iQbclZ3SYGUcO1WxbnzD9sikBhtivzv13ld8SBRgFowkMoV03+7qOlD/nC1eB0BvkhbNhml26AjIN/YaO1nQ+93UW9YwLOs9BSZ378GftctkRL6kZxvtY2H/dM2MuCexxoKTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562313; c=relaxed/simple;
	bh=01Ai0uRzFCFukuweGUeIIDoZ8lmD4ReO7py7RJhf23o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyks/IxAeD6eMwZFg7kYCLriUrjqlxrKDqi3muJzJ+FILcW0pTi/X6baLM1CGL4hy9Tgi3wj60239U0e3JqGHXR7gntXBPxFxnSfXpT396xmubTsx2O4LWGbzeRRFBUKvxxeUQpi3h1jqMuTg356jX+zRTMlpGzVJAHUQdZuSqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BM7Wsgi3; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BM7Wsgi3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so5028875e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Jun 2026 01:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780562309; cv=none;
        d=google.com; s=arc-20240605;
        b=RkoDXoA0QjVVzIi1MLUIGSlNzsNN3g2coj4nHU3Mr0s5i1KImezROdUbY6WWuPOqA1
         0UwG0tWNuw4hQE+TP+Yzma8VeqQl0K50yN7Qk2ITogfcqbXCKUBWzyX/kkQCVutldSAE
         YlQWMGvkz4Juw0/SOnwqPWnnCk1xsoSP9/i1ajcSMFqbjADJRxICFqSdn/8oqoeKcboY
         4iMlZZ5qL5UggE+WBe23Ph52zKNictDKd9UlGNCtS7yvq4izR47wNdSLRsmBPSsUdEAb
         7v1Jplu8G7ry/wzuxNLF4EerVfZrJccyB/8KVF3NpoKEgBpMRcYZW1dcFGn+yB7resyQ
         By3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K4XQZ7aKSAV1iV5gjZCHiSXKETwy88bWWDvnwSeIALg=;
        fh=9YiE8ddaRQCWfIjC5sJUn1L5wqehJzyONUuPVK2jwr0=;
        b=HJbV8Tj4BEq5axXaIQRMrN3lS3Ad/IweHnEVDVWwEaqRkqWUaWuAnbVaJ9ILooCbsY
         EXxcW672U4bImLgfe7+cq4Hco3D4zezyB0OF476peJa75WCsM3tLokdOC9s8N5duD0UG
         BFfeMxKlc2rUZmNvH385uUNNrWh4KRqX8dKQPtUW5A1nRAqGvHwt3dkj7L3/0aXrq8IA
         BjOc7L2B/S7jMrbrIndutbaYSteQeCg9cuxgPnPdOyG/CmI4mtU5YePKINaviqZ1m0D/
         P5kTL0+wu4eh2zKQVKIPhbZBLWaxLEu0rdOD1aa55sBos9I/7uqR5yuBrFOt04hXns2L
         ChJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780562309; x=1781167109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4XQZ7aKSAV1iV5gjZCHiSXKETwy88bWWDvnwSeIALg=;
        b=BM7Wsgi3AIF04HRyapcUqbXk71ZZk0dXgzJdlYkkfM1K2nUfaaVnkwWhReleiei0IA
         +zUJ2RZJuII1TQo351faQdHZA+wAri4GOKp7bUiRt6PMrPOwn/5mudQ1aPsAOcpXJVnz
         PuptLk1jXUhgEq+wJbHYJ4JzhpM+VCAzsmuv7tw1z7E0BHBYrI0M411k8n0ugr5vxlgl
         DmmMrrVYP7kkSMMzP+40VU4MYr2K5FLnISP+McESIeZfOnmQriPQqHo9J0MntQkkAlu1
         im0Y+8pkf7md3wvmlqKOntgnRDzs65hNymHc8p0JNKW1HpAx7EfLtYvqjHdSiA1HqBO5
         avzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562309; x=1781167109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4XQZ7aKSAV1iV5gjZCHiSXKETwy88bWWDvnwSeIALg=;
        b=XmRUn0v7Ub4dbrK0BirLVR78oRcHB9bCEdkkax1Z8pLwLAmK1Szz0eto0lOBtN5YIJ
         O09PrPhP5SwB4wNHSihqg10KCc0sBsPCBgR0IVTO0POynfypwXYbsPkNqXqU/asYHvpC
         5o8znf7qfvC8oILIFjcKNfRzQxDNnZX6/XrRHSey4e6onxyii6IugTIXd2iuchHqssRA
         qVaEUJRiwSclR9XPnCX4jawWX1Yw2jhK8vwY8+CZHLDiKHzgHfwecHCj4gL/ddlaACGU
         n839O1cEpTY3/MfxS4fkkarhMF5kvDtcSD9toWG7FsuGPpRxjCEgaZytuuj7hJJtBOI/
         4Gbg==
X-Forwarded-Encrypted: i=1; AFNElJ+7HT46zk00xg8jV15d6W8E37L0Yp7nF3MWrQ6aPLid3QUb+D4lB8InnW0FD0RK6c1YBkl/3Bi+FrwS+9u0Eqv5ZTAjsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTKLn9LPrWfLXJfAfkzieQ+75ZT/w9aHf/hGmnasPbMEqucQ3A
	WB8M3Pa7jwrtgWf8vnCRIYzCzaPBnf8xibc2xuYBrevRa2Q08+9Bt0vcR8azpbX/+Y+MbnV476l
	qn6R6n1xrzOMlVn1Ha5S0XAgCWzURWlk=
X-Gm-Gg: Acq92OHzjokeiUOQJ27wnmMRay5EnRC9g0DBZvaT8gFggGzOLXXKwwGDBuxLC+Pjp0O
	VsoqFDlM50bxXEXKev1DxdcyIW7+aza3xFOxcbchMKpesf98wDjos24hCSRtoZjYKpLo9y/oBzT
	+F6zUkUROFnUPdEHHjqQuDs7jtFp05KF6RMbxqsneDTdXUnTwCwtJ5hU91hAiHetsl6kF8TQXCy
	p87Hd6U7xHUdUtNDpX7qnbocq+dIAomyJFb2txw4lk2sNfHDNnJDM1TA6VkkDag6fG2trN+F9l4
	Ei2pnxE6heB2xcB3Ebit/Ti/yd62I5aedRnEj1txY0JvlG+McHEMpFtENJ0N2N2N+nVqrNJmkqU
	8wB8muI9eP0Dp975GeNS86MKemFYx5RvDkwpwUA6NQszz+ZedZ4skIcuU9VEi5K4ac0P8eGH0X6
	iHEYkZ4C+sckqv7Zcd
X-Received: by 2002:a05:600c:1387:b0:490:484b:bf41 with SMTP id
 5b1f17b1804b1-490b5e6458emr120496005e9.6.1780562308956; Thu, 04 Jun 2026
 01:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522123420.45495-1-aldocontelk@gmail.com> <20260522123420.45495-5-aldocontelk@gmail.com>
 <aiE36_SrwCvwLYTu@ashevche-desk.local>
In-Reply-To: <aiE36_SrwCvwLYTu@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 4 Jun 2026 10:38:18 +0200
X-Gm-Features: AVHnY4IWOMAf8p78J23HBZsGK3KtQrIgG2uflT_WSp_1XQJkNOkadfvKuN807T4
Message-ID: <CALoEA-zCeWEAOAQGi8pQ_R7Sqify6Z=BegMuV1nx5fKH7OUvtw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] iio: tcs3472: use ! instead of explicit NULL check
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Aldo Conte <aldocontelk@gmail.com>, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, shuah@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 10:31, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, May 22, 2026 at 02:34:15PM +0200, Aldo Conte wrote:
> > Replace 'if (indio_dev == NULL)' with 'if (!indio_dev)' in
> > tcs3472_probe() to follow the preferred kernel style.
>
> > Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
>
> Joshua, even if it's not written in the documentation (or unclear) the idea is
> that whoever formally suggested the change has to acknowledge it (Acked-by is
> enough, but full review is superior, of course).

I see, thanks for the heads up. Not sure if Jonathan will add my tag
at this point,
nevertheless

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
