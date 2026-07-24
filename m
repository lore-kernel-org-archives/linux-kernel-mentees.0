Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FC3914FA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897055; cv=pass; b=vA14kD0LnLHUEb6dBTe3338qt7Q3e27oooM+PIRYwjtnZFvZoSxq/GloTTtFv7IW5Y2prNDY9bd+UIsvZpYuHLgYFHjIFYDF9qxQ5GZl4g7oYY1o8vc9D2s6D7t+Jm13HQGWUZJpqFx8J6WS4nKT/he4gXwziESsVhefHgBOEj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897055; c=relaxed/simple;
	bh=E5JHc8HLuoo7DhyKVoM/oTbX8SZtTMnPKN+K2+UHJEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rULb6eck0dJuWs/jB+Dhn866tHwQvX3p7p94J7EhRpJ8kvBu3fRAti/qw+RxRZ4EuGH0G44vAgpBayd29Y3933iQtpo5yILYwTenDeKIxNZb/jRoFRgEfm3ZRRkfzgVCLCpg3/AhP91w1/wHAwsfiH/uRpxMwM14b4dKSxuCp2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8nAyNWz; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8nAyNWz"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e5c92c389so25333985a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 05:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784897053; cv=none;
        d=google.com; s=arc-20260327;
        b=Q8+RPfgrZAeDg9X3O/6EfOUldFOweGK//jqA5UEKSuEBUGRRs7NDkUZ6eSzqvNh7EX
         hgwNUfei2mpAuDB5SfT+J/ygA/16u9gmXCWA2HA5aTwP8YW7aP5Zkx3fXn5oM7uzASlQ
         XxyBQPaAIP9GgJvfnsjO8EaERThJaFYwN85Nn5zw4HZ6JzHMxcqBvlY3jKV3LrhO8zo9
         NaSMt+p43jIhgSfmR0uNk0NpphVHQtu9pZuEgzTQx8rgb+u9IyuLVfn4W9he7JaZwcLA
         JucnrPvPVNlLR8FlO9qsr+iOPSBMFC5WhGYptIewPEHgfrJ3NdZE80fNwZrFkzFe8fX2
         Nn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        fh=3tUcoFWy00KS+Y1w2ye0uWWEw8R1Ijs7UN35CJpb5TI=;
        b=OatTJ3gipYS/8ZGmVdyS9pah8mjZzaJDC68JcqUzo/cjNMDcDEwMLEiqnQ38oWEAg4
         ynU/WaYqu7zyEUbbUtW7ielY9TPr5h72BTR7SJxMga+4Kx9IpA6Q+/5Yo1hCPB4GF7yA
         8mRf7UlUYWLviviK1p2C7jsYJ1ORGy33F7DGjVmmsHxuuX6rkf44fbSZ1DIWmBNSpG8q
         MAZAUxgrhz6pwF0svozGEVq6p0uZw7/VoVN8PacZ7pl1Z/Y4SP9ViVYUwiip9SqHDlfE
         oPzwJ5NqJETTww5vRsoBUdD/Zlfml9Bmb+FAn+HLnWkNVMgPccJva0d+gzBg+MCS+ww4
         twxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784897053; x=1785501853; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=b8nAyNWzxc76aSMxiCFOZYLX/VKd3I73INCJOJk8KAbneWIi9M+yNVCzLrwSCU277G
         rmZs3kP1P6gAigxgUe5X/ww3PqG+Dwm+omAHHIbP1GDhEVhRM5z6BmVOdNaTaS9kml+o
         EzrYqToaoKu5NIDzR4ctskjvvx6hqyr3Jrp47csr5tWWyJWg9Dbdr7bbemoHX/2mQzSQ
         35Za1+7c8bZteLEkMSSTS5+LgPjMUhopIYBi3keAGKsxcOq4aiwoNF2jfbp/Xt8QrnYZ
         wyU76CF4cxVHIQ4UjFIpGiRVJh+6WyAoYWJYF+m6n2PCjE1w09I+/AsUl5flgKGpFJdd
         GiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897053; x=1785501853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=ob4uVzChTEw49nWixPDC8zsoYE51radwlkU9BMrn0Ep82+y+XLNdc3pRFwb/+WqE0A
         oS7o8HgwJ4kTi2f66XlrbmQy1fK5PMcRCmd8el7SeDQqx3HM3p2m5DWL5x/59ObH05KL
         cu8TRkYk4dZeCMJpm7gWi8L5mBYy9GQxvaJ7ERghtZYzk15bmE6r74jq5Tx2rtQxjKuG
         X23Lr9XAOfbDnv/fbMk55kha8X6MquzU0fMlk/TzRPyVejO7C+xUKQICLsx+Rsp8/CCc
         Bko8Nr0nfHs0Vkg2Yw01RCotLahCRe+T6iTQb+PVgIaYzXg0I2oF6m6dDLLVaQM9QYEw
         GJsg==
X-Forwarded-Encrypted: i=1; AHgh+RrEipfB+EX/nP1yFsOPs1mPn13MxfzAazH3TyAd/uGZS5U5+fw1TZhrncbgTDO05+ytQUuVrU1qlbiTvf82rm9Ot/oZEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwieVuy/pxCvnLhnuarHu0i88mHHzRGWnwDBFFUblwSq6EtWYq8
	/m40NH9YpmeEBjRnPFoYmxmvQgitOdR35VbBeHC0Fl4HGyNyADQNS2ZEwe4Ge+S/hNhf3jqTpyv
	HWhn2DOQ+kL0eQSz/WHk/evPpKZabM1w=
X-Gm-Gg: AR+sD10Z4f/sk9z8v9okS766KpSBoZPbfA3S6idsXh+vxn6tVDP4UWXGfXb63vSL2lF
	wH4o6C8w/6xHRRdMPVh71JKeaL2eb036cZ8WxcMt+BCEi5uTABc3c4qnnBe0lw4w3MmotiYnCio
	b+NdsYwdvg6wYHU2YsI//PUL5/5+oHQxbUc2bxqQKkSi5DvBk5q5nsBPVYb3ai+QnOwOWRbipt1
	iN/9bo1kcRDVdLqiCO1gwsGACaxQXahU05vpnV35GxFoFv8Ra8DHxqpab71VP8maepZ8uMX4sdW
	Tz2XjFWHVkfko/hHg9ZR1l8ZMREfFgBD/f7E462ztSOcFHCoyCHd
X-Received: by 2002:a05:620a:6cca:b0:92e:cac7:96fc with SMTP id
 af79cd13be357-9310388efd2mr749905085a.24.1784897052712; Fri, 24 Jul 2026
 05:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
In-Reply-To: <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 24 Jul 2026 19:44:00 +0700
X-Gm-Features: AUfX_mxLzK4lEzDdIm63lfvgUd6SAd7_Ys3EmQdE2d3UhBcu1j4jPRBGqdfCOww
Message-ID: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> But right below this, you are still letting
>
>         if (ctx->codec_ops->run(ctx))
>                 goto err_cancel_job;
>
> without disabling the clocks.
>
> >
> > @@ -191,8 +192,12 @@ static void device_run(void *priv)
> >
> >       return;
> >
> > +err_disable_clock:
> > +     clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
>
> You have added vpu = ctx->dev, why not use vpu->clocks as second
> parameter?
>
> > +err_pm_put_autosuspend:
> > +     pm_runtime_put_autosuspend(vpu->dev);
> >  err_cancel_job:
> > -     hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> > +     hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
>
> Why are you changing ctx->dev to vpu here, but not in the other
> function calls in device_run(), e.g. pm_runtime_resume_and_get() and
> clk_bulk_enable() above?
>
> regards
> Philipp

Hi Philipp,

This is embarrassing. I did notice this, made a local change and
forgot to re-run git add.
I will fix this asap and send a v2.

Best,
Tharit
