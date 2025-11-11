Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2293A5E60
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882602; cv=none; b=VZowa/Cdde+gM6t0t3FExbdPEpAkyFIsIq2/qNXOlpSfS4OQ8xXqb9YRU+yaamNLzNEmn6Xt4QNOqx5HjqpLp+5LTGuHbGw9GdZI7AvpX1hoNS7ACDsGZaIJR+Azljn9O2x7tHqJcEWaShC+5nVTvFxFLbHgMSmKMUyu/xoYtZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882602; c=relaxed/simple;
	bh=7w69gEIQRD9DpRmZ1hipFG+Vuhi9EbgUYt2kjgHRRw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=synoZX2f8a7ZetFBxGaRdw2vaC1jiTvuaHDgqPcsP8JWaBirUwiSeE78a38IHLJgDwfpyum8buHSP7WUulNY1+NQaD9sBWFiQyynbLh9lXRsYBx9ZoTnj9+3hdGbUwcD5fp1HK90jj1yBOjg9OFm/ZOZJ3KjIrKye9O+skiPl2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WxlNq2BD; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WxlNq2BD"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787da30c50fso31082497b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 09:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882599; x=1763487399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq330mV0aM3KkFwnynOWcCz+kzqPG1AsqJROu3kzYnM=;
        b=WxlNq2BD3ImQ+kFo1YNA9HatL4i77+lPaKwYLTJA7MjyD0IhqRlcJvI8d3HQE4nguT
         s3R1AS8hfOiHfzuyoY/ypPfvwVjWxi4u9jFdySMk/u2bGjqcfJSFDVWfO9ZU7k3MPbf/
         zRM/TAr5fjQliXWacCJct5D8UejZqh+h1NhKkaAPlqVO9hgigd4KRjAYLiWLpYIxLJ8i
         qvEt4z2POAvIBNm9JRT81uozHHs8mY/soc/fkM1LAGt4ayzrvFX+fS3YD3wAYaJvvgk7
         zKtBzjboj5TZGD619+0Y5Xr74xjDmpab7lHwbv297JiAY5ZdPzLBiIlhWXzeAci5cp7a
         VJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882599; x=1763487399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cq330mV0aM3KkFwnynOWcCz+kzqPG1AsqJROu3kzYnM=;
        b=rAx3tcnrNeATj5NN2HwKDS84NrsL4QTKP4EqKVoiETDdCfifrn+Osm4TqQXxDP5xP9
         HB1DrzyijyLWS4nYT/XCSB7h3U+tzn5rD19bv4+VvL1ITZG/LkooOMTLjRLlWGsTpPjz
         ODNqT3IRmMd85+nT0O8KK9bMEBZbHSgxuDNJ7OKUfaGixAfmIvov10xsjsso9B8meu2w
         YykArxrc3pL8rlZlHhIVrsUYnw4pzme7q3sflDe23Wowy50wh9sPcRBpGXWUIUhPCUl3
         6fEdNF5uzgCoeWHX/IPNEReR2hvJ2VjGR9F+I9TfcWpApwYUqPe4PgYHgzv3s/u8pLTj
         TOww==
X-Forwarded-Encrypted: i=1; AJvYcCU/DhJbz5vbaBoshosjCunKlqp0D2pRb6RxhxmZxQBv9SwexhS26ZPDG0p/0qUUI1gLlEa54NoK98l3DXtKYoVdnEz0Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOxUJkLEdvh4il3HV2Ca4T9g0vgKgbrMObIQuvayVzeyX+O9uO
	b+aDSmFrEgoXouv3MXKcrPLlTzfmDMiFwhzfckYbnFmpsvM//pLCUwKzqS1s7SyL4hW8QfNNRR3
	yIK8odDOMNI/6FIwfahu01PnGSiDV67LawFHM/zVk3g==
X-Gm-Gg: ASbGnctEjzA3TwdS3wChJyNzT3MSMWizttyZ58IUzCKLTE62lVoFEppBFpojfvf7I83
	TLZ0TNIUV0nxsypZW8R9JGAxGGyxP2gmxu3B2TBXYcG5lbDVu+R2RvsEhyRcFqW3GFoRUBgkqv3
	f1lGWjIF6d1JpBXDoudRkPAwPbqO/MSy4fWUh2wbXS2WPmJRiu9QntN1XP2RX4iOnecAqIGPFta
	9G/kbXoqOKcZkqC0LyatS/nsdvSyYvdzN9sJ1ClN0nF5+Q8inuOnN4no+Hiyw==
X-Google-Smtp-Source: AGHT+IGFeWkmGYHnfsYLyug0SUXVIrlIHteZgTm7nrPaPsLkRxroQIQ00QVPMrq7+dreV7IBhR+16iaHx55xCI61maQ=
X-Received: by 2002:a05:690c:312:b0:784:99f7:8d04 with SMTP id
 00721157ae682-787d541bf0dmr200759467b3.40.1762882598635; Tue, 11 Nov 2025
 09:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251023145432.164696-1-rakuram.e96@gmail.com>
In-Reply-To: <20251023145432.164696-1-rakuram.e96@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:36:02 +0100
X-Gm-Features: AWmQ_bm-HtvwPjB1I0R7_VasVYGA_DNOzwFIcqKcTupiDBJdq-x3xg3-mjSwxF8
Message-ID: <CAPDyKFoSX7QZGv78dL10C38wY0Sg5QC1qxvhyGXJ+VUYHihP3A@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: u.kleine-koenig@baylibre.com, chenhuacai@kernel.org, 
	dan.carpenter@linaro.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	zhoubinbin@loongson.cn, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, lkp@intel.com, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Oct 2025 at 16:54, Rakuram Eswaran <rakuram.e96@gmail.com> wrote=
:
>
> This patch refactors pxamci_probe() to use devm-managed resource
> allocation (e.g. devm_dma_request_chan) and dev_err_probe() for
> improved readability and automatic cleanup on probe failure.
>
> It also removes redundant NULL assignments and manual resource release
> logic from pxamci_probe(), and eliminates the corresponding release
> calls from pxamci_remove().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
> Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>
> Changes since v2:
> - Dropped redundant dma_release_channel() calls from pxamci_remove() as
>   devm_dma_request_chan() automatically handles resource cleanup.
> - Added link to v2 for reference:
>   https://lore.kernel.org/linux-mmc/20251014184657.111144-1-rakuram.e96@g=
mail.com/
>
> Changes since v1:
> Following Uwe Kleine-K=C3=B6nig=E2=80=99s suggestion:
> - Replaced dma_request_chan() with devm_dma_request_chan() to make DMA
>   channel allocation devm-managed and avoid manual release paths.
> - Adopted dev_err_probe() for improved error reporting and consistent
>   probe failure handling.
> - Removed redundant NULL assignments and obsolete goto-based cleanup logi=
c.
> - Updated commit message to better describe the intent of the change.
> - Added link to v1 for reference:
>   https://lore.kernel.org/linux-mmc/20251007161948.12442-1-rakuram.e96@gm=
ail.com/
>
> Testing note:
> I do not have access to appropriate hardware for runtime testing.
> Any help verifying on actual hardware would be appreciated.
>
> Build and Analysis:
> This patch was compiled against the configuration file reported by
> 0day CI in the above link (config: s390-randconfig-r071-20251004) using
> `s390x-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0`.
>
> Static analysis was performed with Smatch to ensure the reported warning
> no longer reproduces after applying this fix.
>
> Command used for verification:
>   ARCH=3Ds390 CROSS_COMPILE=3Ds390x-linux-gnu- \
>   ~/project/smatch/smatch_scripts/kchecker ./drivers/mmc/host/pxamci.c
>
>  drivers/mmc/host/pxamci.c | 56 +++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index 26d03352af63..b5ea058ed467 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -652,10 +652,9 @@ static int pxamci_probe(struct platform_device *pdev=
)
>         host->clkrt =3D CLKRT_OFF;
>
>         host->clk =3D devm_clk_get(dev, NULL);
> -       if (IS_ERR(host->clk)) {
> -               host->clk =3D NULL;
> -               return PTR_ERR(host->clk);
> -       }
> +       if (IS_ERR(host->clk))
> +               return dev_err_probe(dev, PTR_ERR(host->clk),
> +                                       "Failed to acquire clock\n");
>
>         host->clkrate =3D clk_get_rate(host->clk);
>
> @@ -703,46 +702,37 @@ static int pxamci_probe(struct platform_device *pde=
v)
>
>         platform_set_drvdata(pdev, mmc);
>
> -       host->dma_chan_rx =3D dma_request_chan(dev, "rx");
> -       if (IS_ERR(host->dma_chan_rx)) {
> -               host->dma_chan_rx =3D NULL;
> +       host->dma_chan_rx =3D devm_dma_request_chan(dev, "rx");
> +       if (IS_ERR(host->dma_chan_rx))
>                 return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
>                                      "unable to request rx dma channel\n"=
);
> -       }
>
> -       host->dma_chan_tx =3D dma_request_chan(dev, "tx");
> -       if (IS_ERR(host->dma_chan_tx)) {
> -               dev_err(dev, "unable to request tx dma channel\n");
> -               ret =3D PTR_ERR(host->dma_chan_tx);
> -               host->dma_chan_tx =3D NULL;
> -               goto out;
> -       }
> +
> +       host->dma_chan_tx =3D devm_dma_request_chan(dev, "tx");
> +       if (IS_ERR(host->dma_chan_tx))
> +               return dev_err_probe(dev, PTR_ERR(host->dma_chan_tx),
> +                                       "unable to request tx dma channel=
\n");
>
>         if (host->pdata) {
>                 host->detect_delay_ms =3D host->pdata->detect_delay_ms;
>
>                 host->power =3D devm_gpiod_get_optional(dev, "power", GPI=
OD_OUT_LOW);
> -               if (IS_ERR(host->power)) {
> -                       ret =3D PTR_ERR(host->power);
> -                       dev_err(dev, "Failed requesting gpio_power\n");
> -                       goto out;
> -               }
> +               if (IS_ERR(host->power))
> +                       return dev_err_probe(dev, PTR_ERR(host->power),
> +                                               "Failed requesting gpio_p=
ower\n");
>
>                 /* FIXME: should we pass detection delay to debounce? */
>                 ret =3D mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
> -               if (ret && ret !=3D -ENOENT) {
> -                       dev_err(dev, "Failed requesting gpio_cd\n");
> -                       goto out;
> -               }
> +               if (ret && ret !=3D -ENOENT)
> +                       return dev_err_probe(dev, ret, "Failed requesting=
 gpio_cd\n");
>
>                 if (!host->pdata->gpio_card_ro_invert)
>                         mmc->caps2 |=3D MMC_CAP2_RO_ACTIVE_HIGH;
>
>                 ret =3D mmc_gpiod_request_ro(mmc, "wp", 0, 0);
> -               if (ret && ret !=3D -ENOENT) {
> -                       dev_err(dev, "Failed requesting gpio_ro\n");
> -                       goto out;
> -               }
> +               if (ret && ret !=3D -ENOENT)
> +                       return dev_err_probe(dev, ret, "Failed requesting=
 gpio_ro\n");
> +
>                 if (!ret)
>                         host->use_ro_gpio =3D true;
>
> @@ -759,16 +749,8 @@ static int pxamci_probe(struct platform_device *pdev=
)
>         if (ret) {
>                 if (host->pdata && host->pdata->exit)
>                         host->pdata->exit(dev, mmc);
> -               goto out;
>         }
>
> -       return 0;
> -
> -out:
> -       if (host->dma_chan_rx)
> -               dma_release_channel(host->dma_chan_rx);
> -       if (host->dma_chan_tx)
> -               dma_release_channel(host->dma_chan_tx);
>         return ret;
>  }
>
> @@ -791,8 +773,6 @@ static void pxamci_remove(struct platform_device *pde=
v)
>
>                 dmaengine_terminate_all(host->dma_chan_rx);
>                 dmaengine_terminate_all(host->dma_chan_tx);
> -               dma_release_channel(host->dma_chan_rx);
> -               dma_release_channel(host->dma_chan_tx);
>         }
>  }
>
> --
> 2.48.1
>
