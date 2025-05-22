Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952F22425E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900079; cv=none; b=twjFztoYYv42hhK6RtYFCqpA0kWNIdriMusEPoIVabSmcF1uLaKz6R2j/040rnSLgXBPqMyZCQbmXW0dqTa7IDNkdF+DrKAl2YapEo01cYlUy7DSSaddJR0mVo5jePHDLQFrGZ608t4wvJqVPQprFe/9afK7TmNe8jHCI9IbThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900079; c=relaxed/simple;
	bh=oawndc3u6OFeNXbkn8onoaiERrlvNEUPYPsJqnlMj3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TdU2cak9RG9WdUlyb2TOuInHKTjUnmzW7CO1/ijr93tS29nAJbmdX8euciiitUWQ4XEVJljBoCJKDLVFob5TDRfcFqRHkRQ6JchVZn6RcGqEwEgjmnh5syFPFnnRJJoj59LfKlzLoZHakFF8pLqfok4te90HYFFcdbj43VJwvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=NEcR1IGA reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="NEcR1IGA"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3dc8265b9b5so12957045ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747900076; x=1748504876; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=NEcR1IGAyzc9R0sy+W3nI1IhnuS09D5MMdkmkPtS1WENZJicMYaHyzfBoOXhZVxRlW
         x5A4URiqN3GlxpOYu4qffwDyCKBa8QZhD9R5ScwlGE6pwvtL3448qYlDr0X0QDnM67ok
         1Va01mzQR0CvYdPUMWKZuvMk7vVjAmuAsnEFHrMj6+Md6G58VjTzoJp5BUnYfaz86PMT
         3bepGeoLnexTYnmDD+M0MJso/EWSzQEndWsHBRFx9W/2wGB9V89EKZqBp8eRK89JS/47
         6hHLwdMbDKWBqBYZZPmrNP896L7F703mPJcWr5gXuj5VQufrFxUwNSjymvOBoRvdPUnc
         bcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900076; x=1748504876;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=jjUmnyAvRHsIIZrlAIHGRIhdwr+TWMkbuBsJIV/dzf1QkTSkPk+dlPRo1vxRzhgDO+
         ysm3Mx30fmNi3ldXVe7RlO6pFohjBcKjl2U/+coTCN+C4mOmfjAu6pxZcZcTd2ABv64k
         0WhuIDulvR/Jl2HCAp+xdjVSJ2yb2F3sv6V8v1MjNgoVP5lPlcxFz1MDnN/CJ0eor+4S
         z8VIRW2kBQH0WD8JwxQja1Xp8G5vhAGVwPVgAk9DB22ECP76arpvES1ZZRsKnpkhbkOy
         zBp2iBXqc5jxnvRiCiR9M4CnjvYEkrNyHnCmReNys4XfAulwmRlCWMZsPg8mVtDJQrpc
         kOtw==
X-Forwarded-Encrypted: i=1; AJvYcCW2CYqhDSORgZzx3lGs2K1h9i3bEyKZGIaWhbmdMjcyAI9JuEhtYj3+fgqYgPF/Yqd3PRsXKDOLC+T5pPuvVdo5xjaczA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzELqU5ET/IgXOc3JfKp1nDFhYyrhu8v5p5yYf9x1ObeCXN2cx3
	PR+V874SQs+uVAmW9JBiB60RXIgzILLRgzmLIM+6QZaC9i9+sa+SWrG9fPF2UGJ68Yk=
X-Gm-Gg: ASbGncteSF8+eMsu3fjSRCJVItWGTN6bpe+uQQMn1a9LNGRplwEDJKb+oUQ4a2mAvb7
	SXQYOxlqbEdHZ0vTgvNhSOFyd3V+y25lblh0wOiUfMLHt/5Vb7CCSasqZMZbYmd51wKjwVyOfod
	+j5UXL3uNOEDKHRQHA+4vOkvFHS97/4U1V152Dqq4cYdNlvAdE0Q5ha/s+XIx0cjePaqjj7TLuy
	C1DdtkDhZ5gepuu2kwOawB/iV61sGdJyO3JUQUXnvVNrHPpVPdRwqWJweZ9kMkjGtpRMvkVHDEj
	PwZJXy3Bq3GLHXUPsULNHTsFAig5I/gwv9lvdyST3+g1C2D4WasoU1cXGLk=
X-Google-Smtp-Source: AGHT+IEG8W77MeONJnBqaY3Kk6tuHXRXvYrpqiOJH8hduazBrd/kiXsmtoZpvJrUizpMHw69vmC2bQ==
X-Received: by 2002:a05:6e02:3784:b0:3d9:6cb5:3be4 with SMTP id e9e14a558f8ab-3db84322dfamr259928015ab.15.1747900076239;
        Thu, 22 May 2025 00:47:56 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5besm3021494173.13.2025.05.22.00.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 01:47:54 -0600
Message-Id: <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>

On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> "VOLAGE" should become "VOLTAGE"
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Nice work! I was able to successfully compile this driver with your
changes and I don't see any further references to the misspelled macro.

Patches which fix issues which were introduced in some previous commit
typically indicate the offending commit via the "Fixes" tag. Admittedly,
I don't know if the tag is reserved for technical bugs rather than typos
such as the one you addressed, but such a tag would look like the
following for this patch:

Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOL=
AGE_WARNING macro")

> ---
>  drivers/usb/typec/tipd/tps6598x.h | 2 +-
>  drivers/usb/typec/tipd/trace.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/t=
ps6598x.h
> index 9b23e9017..cecb8d11d 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -27,7 +27,7 @@
>  #define TPS_STATUS_OVERCURRENT		BIT(16)
>  #define TPS_STATUS_GOTO_MIN_ACTIVE	BIT(26)
>  #define TPS_STATUS_BIST			BIT(27)
> -#define TPS_STATUS_HIGH_VOLAGE_WARNING	BIT(28)
> +#define TPS_STATUS_HIGH_VOLTAGE_WARNING	BIT(28)
>  #define TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING BIT(29)
> =20
>  #define TPS_STATUS_CONN_STATE_MASK		GENMASK(3, 1)
> diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trac=
e.h
> index 0669cca12..bea383f2d 100644
> --- a/drivers/usb/typec/tipd/trace.h
> +++ b/drivers/usb/typec/tipd/trace.h
> @@ -153,7 +153,7 @@
>  		      { TPS_STATUS_OVERCURRENT,		"OVERCURRENT" }, \
>  		      { TPS_STATUS_GOTO_MIN_ACTIVE,	"GOTO_MIN_ACTIVE" }, \
>  		      { TPS_STATUS_BIST,		"BIST" }, \
> -		      { TPS_STATUS_HIGH_VOLAGE_WARNING,	"HIGH_VOLAGE_WARNING" }, \
> +		      { TPS_STATUS_HIGH_VOLTAGE_WARNING,	"HIGH_VOLTAGE_WARNING" }, \
>  		      { TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING, "HIGH_LOW_VOLTAGE_WARNING=
" })

Consider making "HIGH_LOW_VOLTAGE_WARNING" inline with
"HIGH_VOLTAGE_WARNING", or vice versa.

> =20
>  #define show_tps25750_status_flags(flags) \

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>

