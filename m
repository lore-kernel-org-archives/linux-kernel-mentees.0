Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4D2DCC1F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224399; cv=pass; b=V1dB72tYmhMD7D59BwcBAwJvGXdbJ9aqF4ujq5Zsgs1cpQT5d+y7PnpZycjH0uoEkQH70l5YsPe3JQ+Ufit+lhGoaYLZrlok+1LM70WiN3Wlj3aVnAZdueRLiJkPmn67ztIzYRSyBXr+NvMYJfRiipUsl6RNAz48hfnIKdrJhig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224399; c=relaxed/simple;
	bh=Go0Wray01QJG4fXsOf2i6hb7EfbTw0dJcBKjWRowB/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuLu79DXZKpg5O8Tdrnzk1ihA62Ma88KKlQ8blj0h8B/Ed0FbthIwFUrPZFpxIVGAvltGnEEucl0/5EkVkdRard3X4DPwiKJoeEp1BMXqErw9jZfqKqGP+b0FoorttJOZexEuCKoG3oN+XNHZFize7ikX+A8GFlVk7H3xTVVnL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZrGzVGx; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZrGzVGx"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa5e0d57e5so1160913e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 03:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780224397; cv=none;
        d=google.com; s=arc-20240605;
        b=ROms0L3dly3A4lixJGcqD21k8bL6cbftxNRZG+lNc5V6mXR/2sgbqA3WERL14Nf4uC
         UAOKMTc24+B0XBK6QOIvaBhq2U8Nhy3Al6awqbfCblIjEv0TvoS0t2t2zYOBdx6MzW+f
         goz+qjMeo9Pim+aMsacm5rIpt//psfa1VLgdGmMAJiv3aNLTrdZXGRgh/7T6EE5UUspp
         cGYWgB4dZLM/EJtyiFy0Oau11DEJVLVsbiBMCDpUSQuYYgmhbvwcxgYzYqrltvlJxH8e
         LIp5dUjD0uQP99uc9Cz1m0wHNvnm0zi7Ud0pwusgddaiWki5NRNw1whIouANgJTJ0Otf
         htrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zzjjOuAVGRSB9pPF5P8gmF7NJS6WDL3M8H+3GgurXfA=;
        fh=MiXw9eO8E2VL/ma3Y16HE7e6bQN7Pk9yfCK4tmQFj9M=;
        b=bMUUDvaVIeqU8kYLvbzhZHgCSSrvNhMQ0xpmoNhuyr5ylP/kOMzpsqRqqXs3CpRKTS
         S/ri8tiK4qaWKMjJM9Kdv01xY0en0CxA9LcAWaxYzAwpjMFi4YO3LASpC1B72goOqmqt
         uiZhBJF5OJ2mE6Z1THbPZLK6Vk4lG2OPJyleSa5fYqIPkEd5ebOKEhc8l51efts8Apx+
         Ma3iplY8LAva41eD8DNj0/Zv/WbOdUpA8jmPMm2/oGabMAigIely75ZmNAqpHcmUN+Tc
         NjHy8QXdFdy7suvlVykbel93K0T+atJxQqhTCDo2P4juhnbgyXkbEdskzN3+SYnJ4M9J
         6ZMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224397; x=1780829197; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zzjjOuAVGRSB9pPF5P8gmF7NJS6WDL3M8H+3GgurXfA=;
        b=fZrGzVGxz1riWJQWrAVCRtQsOs1yUXJYeB/TtcVeDppQxwyQk2kROMUJh1KzH6ofg1
         5/gLQfYcCxFHS2UGkZo69jRz3AZWlPtlTnzcxGpIK+v4xFaB4VqMxK3nG2AEjnMS6aXl
         25a97gW+CRjiLlNNjgg4pPfhHEz3QF97edrhF7nrvMpNUZDIZKwOf9wcrYN7xZQfTBlO
         8OsP9v57Iirom6lWcoBkhai0AGXdmxxZC/WdTo7Qw6m6BCo3S47UZWWC/dIZ27YTnFCl
         DK2Iyt79wx3mJRzMZmpCdkfZY2MneutTaEKBZtnvEqeGLwk/ySko0zlKRZq3YHjxeKPM
         BSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224397; x=1780829197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzjjOuAVGRSB9pPF5P8gmF7NJS6WDL3M8H+3GgurXfA=;
        b=lwbjNd/1RWqMKrtsjAZz+9y5Pw5r0KoW8Qp08nTH4fIN56I8eZ4k/n1WD9HpbeRh0S
         PIbYU5QDhuYoFyvC6cH2KqWMpdx6Z3/DFW+6YjF4tGc83oCwNsJzbddyw9yeib+DAz4K
         L85v+yp9ZZFRu15OhnkziFoDPFvTqdha8Owu6cuUgoI9MX/WQmy42/Qo8H3uw4u5kFOQ
         K2tJo3lphJpoevByvj++XRuDDIJmOAJKCRnCH2s0BO6q6xyiB/o3mjguQN6Cu/tH4Hl4
         k4H5zoz7i+u3QhoDamIeoGZBTeO83xffwCtYOLXVEqUl8TG6VK2SbU4r1pttUpp4P127
         Ltaw==
X-Forwarded-Encrypted: i=1; AFNElJ9UkJL5pxU8JYUyX+WQpZdADp3tnpuis/kxmmWbyJyALjqsJgpOEPePBkXXQI7UvmAAIYIDMVFmO8EI7fUGC6+LRKAEwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiqaUdpbyfvAdMmc9RoStCCHFW+Es6XeRX8PN+EBeRrh2kYIQs
	1r011imXJ7nxe0EgwjQj8H+L+m6oUgsAfjY6KDEegc4Agzx6JuabFAemNlYOv8hQ/6eesS7WD8G
	Ai3HZtPIdkT1bbIT+u4/bVHuiBIx+aGE=
X-Gm-Gg: Acq92OECJ37dQPW7niB6JzOhy2s9n+lcj+rKJ7tg3usdXCiz9VogQGzImTv8g5+RXG4
	Jmr9rfOkfqMp/TS+o36zUwjIKRklqviJjrh4q7HU5peC+p3Fc/0+fz1dO6X0wqHcp4eX9xzrqJf
	AJxbTmYoE4m0DQRbZYlcfC0XysC55DMqg9m8n+27TaPUI/92c6el1m0K43gFrTcFHxQqehrhinJ
	cy/S6ptA7zehFa3L9NTvfiXzwk0Qc85JdJGM9GqIcXJF4k3BCJg4E3H/B7Rk4SL0fB7DK7nmWyM
	VLRw2ZAgvzqcc/OI2GYIk2IMiJHNZpbDe4QTJMqTyuEOe+3JyQ==
X-Received: by 2002:a05:6512:689:b0:5aa:265f:acd0 with SMTP id
 2adb3069b0e04-5aa6092a8a5mr2041343e87.39.1780224396614; Sun, 31 May 2026
 03:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-2-suunj1331@gmail.com>
 <CAHp75Vfd_eRRgnCpXsa0CVQ56f85YwQQRTj70MfmB4prVygYGg@mail.gmail.com>
In-Reply-To: <CAHp75Vfd_eRRgnCpXsa0CVQ56f85YwQQRTj70MfmB4prVygYGg@mail.gmail.com>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 19:46:25 +0900
X-Gm-Features: AVHnY4Lo0kRsNjuq_XRFqHod0O7PYpocpH7xfVx9ApYOJbPmYAyD43ZyivFanqI
Message-ID: <CAGwK=3qst8kdMmUeHvbB7omkEv7N+_+eqP04Bqcy4YyVpHpwLA@mail.gmail.com>
Subject: Re: [PATCH 1/4] iio: pressure: mpl3115: convert probe to fully devm managed
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andy, thanks for the review.

On Sat, May 30, 2026 at 9:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > +static int mpl3115_suspend(struct device *dev)
> > +{
> > +       struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
>
> What's wrong with dev_get_drvdata() ?

Nothing, you're right. Will use dev_get_drvdata() in v2.

> Ditto.

Same, will fix.

> You forgot about mutex_init().

mutex_init(&data->lock) is already present in probe(), but I agree
that converting it to devm_mutex_init() fits better with the devm
conversion. I'll update this in v2.

> Add
>   struct device *dev = &client->dev;
> to the top of the function to make this shorter and easier to read.

Will do.

> Split moving of this function to a separate prerequisite patch.

Will split the function move into its own prerequisite patch in v2.

> > -static int mpl3115_suspend(struct device *dev)
> > -static int mpl3115_resume(struct device *dev)
>
> Why did you touch these two?

No good reason -- I only reworked them to flatten the nested
i2c_get_clientdata(to_i2c_client()) call. Since that's unrelated to
this patch, I'll leave them untouched here and do the minimal move
only, as Jonathan also suggested.

Thanks for the review.
