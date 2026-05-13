Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B070B38BF92
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660175; cv=pass; b=PgT5j38PwAYU8IG4mYcxjoJbTTQSUkixIBGJoSnjrzaiZ8oyyWbbGIJjVYYJc1+3FYy5QxrzlKD5FOG+7J3ydzPOZNCBlM+GaIDJLqGaC/jh/SfoC6SitwdC2Fl13PiPd3hfEtPrdYXdUyuKdVplIG6fZEv7PVT7HcsJhTvZU5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660175; c=relaxed/simple;
	bh=ud4cL8xhsO3841KsQ5TzRgbWVYyYS0uWZRLaIyi0I4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emtJLHsHMULpY04FM73+bMblopXCr+aXRLGyoGtQ40FxNtf95ur+DICLhBOURVClc4AKUz12okzf8MUFqBuHpXaF8v9OQHUlbw3AK42qZXEzH0RZncMDzNNVVNFW4JgxBbNlIcu11o2QB1JZxae+L8hz19ScVO2M6wOmjwut+rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk7tPPdS; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk7tPPdS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ba840146so57858285e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 01:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778660172; cv=none;
        d=google.com; s=arc-20240605;
        b=UyZZtPaOVR1PeWmYLgqrlBQ3pMj/XxibKGSoFmS+QmUt8Q4pA7So1veNwkuXcDy4VF
         RRSrHvlVT1b6ho/MhxqMFGMHqQBpbYSlTomS8bbctG1fXdLR6V/dNwDYjKHbiilW9Y6V
         MPiPLoeqsPE75A1ITR6KcXu+BRZxhTd2pldAhoBSiUqY7sTolzRUnCSXyEzYJPCaJsyv
         IRQuBy0jHUC5cLinHaS7vzo1dcjIud4fvGf94KtJ7HzuEYgsqtA8tripWUtM2yQKJpFm
         nkY7Xoux5gVSlKd593NHB3zN0uAiadk5CDRzF8nso3yyuhKhZqTf/H+lR8zcTsh+Q4Co
         P20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qzVrB/RqgOjdIY22HEoAP7VYRNeb1JuCU8EtIvftbNM=;
        fh=Y6r8t2JWPnOVul86THc8E/ONDXOTQW0PhIcR544d6/M=;
        b=HutQJpdjOsY4C9cyynRmJ0Kpgax3HTFrNUj0ebocr0pTCS9tetR+kU29qFvPr11fHL
         l+IZnXcreRLf5pnft2mg2mc919bbXl8KxpFT95TNI9OlKWdAayNFPrkr3WJ+YDy9zcaG
         XbIWM0RSmfWEpg96dMCIwzeXj3i6nU5Qv+DKsDh6eJiovkKSn0JlEoEIeM5kOPWMdfb+
         pbjRy0O6gtnwUQAUIrWBs/i/Pp0jjzeAgBy2NoPEPG1DAHnTzzpyerydZFQtyV28sB28
         heL4WGbvZ0EtbDWXNe/txQMN3r+vG3qS6QmI2YvoSOQxQTRBlnP+MQADpJgREuLQ53Ks
         DQKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778660172; x=1779264972; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qzVrB/RqgOjdIY22HEoAP7VYRNeb1JuCU8EtIvftbNM=;
        b=Xk7tPPdSOPt0Qu2malD0S0dqnMV7ML4P3q3pgYldo8lqSh4GTuOsmlGklrMH72Llje
         Jm3ccdKPqsXe3i8XPkpPb/YbEbBQE8qGCCsBfHhENCCM1mtvJ6OHIFpnT/n/2fpRptDB
         ldpM/cHOjlEyD9ord6qVu24c7CHW4Np1wrXLOimh8eloGRy8dDaQriRLqa/32IaWz+bL
         YnUyT9H8JjTyBmQjFQ8VfTYsXsF05Tj7U0+Pw87/odEbvIJqGv2J3VJVdEVVfXNYwGA6
         kaG5cJC2qYc6IZFCZi9mvCrv/9KTN6FkPeAHn5esctOth0UwjsA0wRdrbo0zpH8vXo1d
         3tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660172; x=1779264972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzVrB/RqgOjdIY22HEoAP7VYRNeb1JuCU8EtIvftbNM=;
        b=TyRP+T3zbDDhIEXkXmS0RntLKwg7xAVwaepVo5SzT4DNLJP73trpCdUJeCy3wOnsPi
         uMgzlM7byfgnNOBkHAWUygrv0gu9a3RbANGETyFqHtYQgloInxSR+jGUGPW+Tfar1GFV
         4AXAlK5d5V/TuZc2SOU9O2AG9Ji0tdOsSXaA6hgqeQ1f2KdqyOp6TT3ZTKzpVA6D17Rb
         hH/MrpGyLyXWfRqHXURdtIUr5jsk1EZEBz4Uu80U0UvhfVGhYAKQblamgYrwLavclh8r
         KFi+iMx0mXdR66u3peFzHRB/ds2F8q5EhOdhtfV+WDLBKhG5XBqTJCI9r40HSdQDwdYG
         hI5A==
X-Forwarded-Encrypted: i=1; AFNElJ9ELnWBVCfaNjc5mv15/zjH9iE7W9FIJKYgOlpPdgoZPyxEoH6UDF78zU65LA3amhuFUFZRBumX9tvuKpz4jWy8tTcwVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyGH6Qbbtp+BwH96WZ+VxTzSEaQoZKw6IuWzFJB8o6VUC6DN2h
	dgel1lQ8qwzyazRdE56uQCQMd1ZJ37xsGZ2R9cF1AYzJkAvCOhCMGuVxno5kcYrOoGEWJLfZkZs
	Dsfb2zJkPA6C0/CTqDa2n5oXadChP/oI=
X-Gm-Gg: Acq92OHo8CES7fjcODrLV+z8kv3BfEnViPiKTqfRGdmXTRQHX6xAxUKIjAvHBws2QWB
	MC27exsJKFfHbhbA8Alypw5y7dGxBASinUG/Wgh3Ww8oD4tViVkVMTbmZepSVkjQR1ywjqZLiEr
	khUIbBVnXVsaK0pQcDJdAjpHJNb86GirW2vcujUqTPts2YZBkFIIjwM8cLX3rjtdofMlfzD0q3L
	FMjyWG7UJ7Hjol2WvyZdygKqYlWIitMYc1RZvJ0Z/8rKEczcE+E0NPTeM5QwI9chPqRupXzfHQm
	HiMqNOyrzUMGOGzzhBl41A1NQWvH2qO0E13pdjc7iWjjJV79gy+VysQ9Ah47RRO6AnZ+yTuFKsM
	/3smaIPqXDmxWSC8kjDVJZWVsSo9iwzjNrPpg15kg4/rcdTpa4AE6yuv7gUZjKPp58YHFHrYxct
	fTbGzGmA==
X-Received: by 2002:a05:600c:42d3:b0:48f:d1b8:9a86 with SMTP id
 5b1f17b1804b1-48fd1b89e4dmr7097915e9.8.1778660172003; Wed, 13 May 2026
 01:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512223215.25596-1-aldocontelk@gmail.com> <20260512223215.25596-6-aldocontelk@gmail.com>
In-Reply-To: <20260512223215.25596-6-aldocontelk@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 13 May 2026 10:16:01 +0200
X-Gm-Features: AVHnY4ITA3cPcBmpWKvj9-60CMKYwWN7AxI1LLaGuAndemms0NBn3axwcIBQP-k
Message-ID: <CALoEA-zirqmv6Ru0KLDjkaE4iUYaLWCnhC6B0r_w66-oZ==pvg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] iio: light: tcs3472: move standalone return to
 default case
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 00:40, Aldo Conte <aldocontelk@gmail.com> wrote:
>
> Move the trailing 'return -EINVAL' statements at the end of
> tcs3472_read_raw() and tcs3472_write_raw() into explicit default:
> cases inside the respective switch statements.
>
> This removes the need for a separate return statement after the switch.
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
