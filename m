Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F318FC75
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730149809; cv=none; b=nw8LryX8+ZzPGqWXIlTXve/f56JlPc7u4ppcd0KkKpcLIF2/p7CbyWoy6nPLWkLP5OoS5LuW3tdvyoM6kDL16gF8ASo2MiBKyZJ0vrgFpLlf5Il+cRmcFb4BMP+iy8Y8eTo9cjpfAEBDRGKLzab1zE9bk5Xh9k+f6TMg0SxT9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730149809; c=relaxed/simple;
	bh=U5fBolRnKer5O7b+t+buSpViHWFwAOhRMo1EaMEr+5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXCKey1GgUfIkpYQFl2i6nilzSNhwcM9kFPjvf9LQR7DyZ+LcDI0V72I38avaFCUDCIYT/lpSg2IxypSbs956vd3eNbbUGYb22QAQv/I9kRJRotllEuW6bUSwU3rE7PztvJ5Kk/+jj8/7hQSXO7gMF+Nc1NLZc9RiWkWepyL5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QnZ+akau; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QnZ+akau"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C499480E38
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKhLYyKSxjzK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Oct 2024 21:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DC0780E33
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC0780E33
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QnZ+akau
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7DC0780E33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 21:10:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539fe02c386so5337176e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730149802; x=1730754602; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=;
        b=QnZ+akaubeNIGoBD+mhJ6eSsR7170648onhPSq/UHK6X3EncnNCmKEu5iXHy7aXXce
         vDWK6IVTpqtTiq9fkpgbIuSAQVADrLQFNxJpgT55ERFyahUiO0Uyxoa4/z1bgOCuqA8O
         dKQf75FocavgpsXsgYpYxcdqleE5i5Y7EAVvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730149802; x=1730754602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=;
        b=ZU2Od9UGbxSU6ky/zaTX+Aw9MzRMu0pAx0i0D1upGWcT8jJiewo5Uep/+ARhcX6C0B
         uStAScYtsurJW3jZa1WNHsEn1IrUMyBIc/tafc0vIbWsfBCJ94R6tw7l5SBYI7zB1QYk
         3qSsW8af1efPf7hifmYEjxpHjbGRPm0DeIrKvnFeTGOKkwR6TX+bwa2N54flYgxHpepM
         0oe/LLyBPg7q6fwI1Kkfz8iaj4D5ETv3ojqfmSgiM1MNk+ygazUd4aFQLBzirL36Sd6F
         frUCwz9zloZ4QqWaykDaLv0oQMtq3aNGQYxqFICrFn5L5E5h3p0WCM/hftwny1KoXmda
         iufg==
X-Forwarded-Encrypted: i=1; AJvYcCVasgRWi9sWTmjGKphYoTIZFGl8zsN7kuGIG+n8XPiBy+iM+GTNj6+xv1zwW1C7mzkt2Pd3wcw9NXR72hT9D3HUAuzsAA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4bRRX8mmxUOnDJwW+cSJMmUygCKlUfGgEy3s+XW00sbD/giGk
	ypvw/LOwXTNHze3f7tKUsdWjL+JEoD3FYzotzn6Onq/SfKjofxYdOhEQu0HbXFQ+hP0AHaoymEf
	adA==
X-Google-Smtp-Source: AGHT+IEqFDPvS6Jr+n5fDJ1/xSaHOaRo0eyVA0ZxFBY4J989SYtCO1olFhgg8itJB4gLJiPD3NENzg==
X-Received: by 2002:a05:6512:3f03:b0:53b:205c:e979 with SMTP id 2adb3069b0e04-53b4741cd14mr347712e87.12.1730149801413;
        Mon, 28 Oct 2024 14:10:01 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1d5a62sm1190444e87.233.2024.10.28.14.10.00
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 14:10:00 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso47463531fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 14:10:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmBQblzq9dL+MQeHVGGeABhrIv0Ppjxfq9K58W7CGCEnP7xdVDJ1ia2bNm6GB9Xqa/c3jaj4bk8YVX9RIZVmCswXJUzA==@lists.linuxfoundation.org
X-Received: by 2002:a2e:be20:0:b0:2fb:50e9:34cc with SMTP id
 38308e7fff4ca-2fcda112689mr2795051fa.17.1730149799851; Mon, 28 Oct 2024
 14:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028191700.GA918263@lichtman.org> <20241028191916.GA918454@lichtman.org>
In-Reply-To: <20241028191916.GA918454@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 14:09:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0TYPpLow=GGAcNGz5_joKG7-d=-DorDcxh9ppgNdQaA@mail.gmail.com>
Message-ID: <CAD=FV=X0TYPpLow=GGAcNGz5_joKG7-d=-DorDcxh9ppgNdQaA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] kdb: Replace the use of simple_strto with safer
 kstrto in kdb_main
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 28, 2024 at 12:19=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wr=
ote:
>
> From: Yuran Pereira <yuran.pereira@hotmail.com>
>
> The simple_str* family of functions perform no error checking in
> scenarios where the input value overflows the intended output variable.
> This results in these functions successfully returning even when the
> output does not match the input string.
>
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
>
> This patch replaces all uses of the simple_strto* series of functions
> with their safer kstrto* alternatives.
>
> Side effects of this patch:
> - Every string to long or long long conversion using kstrto* is now
>   checked for failure.
> - kstrto* errors are handled with appropriate `KDB_BADINT` wherever
>   applicable.
> - A good side effect is that we end up saving a few lines of code
>   since unlike in simple_strto* functions, kstrto functions do not
>   need an additional "end pointer" variable, and the return values
>   of the latter can be directly checked in an "if" statement without
>   the need to define additional `ret` or `err` variables.
>   This, of course, results in cleaner, yet still easy to understand
>   code.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple=
-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> [nir: addressed review comments by fixing styling, invalid conversion and=
 a missing error return]
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---
>  kernel/debug/kdb/kdb_main.c | 69 +++++++++++--------------------------
>  1 file changed, 21 insertions(+), 48 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
