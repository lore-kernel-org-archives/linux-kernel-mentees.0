Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283579;
	b=Oe2LECtAQjQkrGBmo4Q/IIpGzn+yZeXnXvPLBVk5zTR6oYyi6w4SkE47r1yBy9QYSR/N
	 8fzyevh6lMGvbdZn/XQd35H9G1MNk07VvP8cevoU7vcnKL6X901SfeNF5YDuQd8+X8uD8
	 wY+ymbX3zm4od0+vpv4tfU8Df06K/KOwEmuyIgwa2LDuH7ZDugDefm79EXM6GnF1DSwa5
	 dZ77hBzqRRua9lGXZetdRD0Z1W4FPOQLz4pjVDhxriBdXkFkjsTm9yuknjYXyauIqbEsK
	 0a27+KMxj6rKq1HwsJp9WiiuEGpPwg61iHQV2XJnTiQLweDNTPvPNbCN9sR/7zjuwYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
	b=A2TOZO8mY5mvoS8WKNomyKXlP0Xy8UFhhDw96T6gzE77mEjhDXQMEJq20GnBOUNZm1yO
	 Eol+jOtZkHZulA+Ycd2CqEIVjR582t8gaKrSXozYBIVf23nK9+r179h/SNsX8+fPyX9qh
	 FuxQnLqfUYBCvc8zNbcMnqOPEFlHffN37XKOviuK4zAyzpBovwpg+YkCjX8Mc11v43WUS
	 rGNE+9SrCla1WcTbYgmCFPdg4zeDhagT8M0G/neJ9piJ8RsH26VfcUYVVydUqL+8A4LcU
	 tg7E4njk8d0hhw68ZZfEPZXSH3XGSOsSeQ0j3+e53a1ACM8xcu1QGjzGHTb8hGcs09A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPuTqWD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8553C606A329
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 Oct 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8553C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPuTqWD2
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so1073376a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 Oct 2026 07:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283577; cv=none;
        d=google.com; s=arc-20260327;
        b=dSWOndxNyN8kRfgeUIrmt3RRVU5MejsaBoNbokwh3ccaqWYUqI05zrR6gK6+oaGTk5
         HGrZuQkjF9ehL58kPJQQPOSs1gI0cDORFh945iNMG8XeRPXMgq4tvq1ftApRoyHu3d5K
         fhgaoVsH9wwF+fZWQuzNhg6mHmKXPdMCJ4r5vV7GscyJJKb5YtSMZajqrDDcc/EOP0dF
         zVXD9/R63QDVZWKQRbY2M0a8ta/JWyUK/E1e5AouEkUfJCEm5cSsFLggDm0fSBbNP2yj
         Ogo/NHO2FnVO8VmjS7N++AHliHY/mz5YnqlZpEZcqwThl5xdJSWLUo8UmT8myIoAQldF
         K0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        fh=JkkPSK0Wd9+AK1FvMotgraq9JuNMjGN7yCgwIXln22w=;
        b=ELMEd01j9c6cxySyekDeY9VES+s7jmvI71yt9sOIY0Qv2CWX4X+m6yU16LndVrBtDI
         0NQGzP5arOlUiRaD+1xnOMy16+xAXRfW5ao4LoRTdug69AkiDrhSMcmy+Q0vJuJtUFaF
         jFy428b3//2M2SgI4+Oogs6fDPnP5zf+28G5uezRwc0NfCxQT1SeA+BnuXhp1SGOQm+P
         BnedXI5iabu+nss3JyGCAtoJxiqkSpe1YLBJ/gTda8B8R+z79OI0gdn19Wt4iYBKnnqK
         cG7Hd7PeiwYAPFvAi0uF+ibh74R5WE6Gbv8BW1ooRli0v7DH4KKvLOz6zX+hPMavG/D4
         StMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283577; x=1793888377; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        b=cPuTqWD2t/Y3wPKBXVaaFImbHbDeS2Ax0I1Bb43o+mJx1oDPxkNTHL7eCA+Uohnv20
         dxLIOHzlVOX4BTWt6QmJpWWZ8XvFcF9AbWMQTfKtaSDLfpHx3Kq7/fZ5zfLFjSDfoeF3
         pYz8Ma7m9gmHnTy3W2huQyFyXNHChkOQcUI4hAQTxE6a0t+dVU89OxFAL4AthgTR2y/Q
         8JOd3YITpPohjS0JQ0hQ5OavuUNq9Aod/U4SiTSK8ScS0XgWfBqM0vOukBm0U9orMqxu
         rNa1nNBtbGS+VkOMjxG6fOqb4ieBUo0C4080DlRn2MhXJqGhY+YhdPpdaHRIPaplyZ24
         0APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283577; x=1793888377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        b=zcoUa9mUdz8lRMgMZeZ8UWlj1wRT9sB7BcbROvZEVBDmp1BXt7AvJ401VV8brpFpHK
         m98N0veRs3qOY6HU/HTcdtcEiUoEZ93x/6FYm6wN3iPlv325tF3zzfuvHz4a6HxvWPdV
         OGh9qaD9LJBaINYmuAP0Ly4ImRSTeRMplhHLcIfNPCT5oPhQtFIks6opQdAZ0qle5Itv
         7x/nG3xNlHw4Ved7J1qR0pJGGceFRS5Q9uDgDbhpKhkW6SBw9E+VViT7emgOCk3OmXm+
         zGYXAaAJiypZBe6f7nvrGEUxzWNfS86KrcgXVLgogaNKUQTUeJkX/bnzlFXXvTmjJjWM
         T8zg==
X-Forwarded-Encrypted: i=1; AKwUvBx4qk2zme3Jd+0RkgcosqcBaEODuRWEE4gWNNfWfR273Hev0qE4TOFSQVQL8vjMmijZDuFCVv8Q3Qr8kWyOs+3pbt/Rqg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJrbD7rwT0kkblAU8NRDGKGxLXlCNRE1ygXFd/GagoI0+0Wa0V/
	MdN+cbMThbQyujL9vyv1P3Cxh/i/vyiUw0UL/xdvuHODeFejvUz4LoxisrPKvMhKo8KHfrkJLkY
	wwlcUkH8Cxy3YEdPHTCb99nOXx7zXtis=
X-Gm-Gg: AYBFou1jj+wGf4lUvyO8xDSOsp6YTqdqLGj3d2UNITlJS+ntszHqDQlpKqK+wafQaPF
	WA/9toeSwlElJCu2jCMICqCvd1OjNWKWRA/kDa2GriaN8HUFQM0BwGNA83AQqXLcIOtndZnR1yE
	0Z6AKXUY/oudn6LrjxUj6yspwHir0PFbrfPMUBnugLrLiGkajgEvWZ9LtIeX651GdXQS9fHycQ8
	VAPo+xtDhUTC1KnVvx5iYlwr7wn03IYGp3W8MHRxJ+ZIGrM9xZbD4ty0o8E6AWhYmWymU7hGugS
	ba3tYG9T+HbHn4SEhhAxoMiLUy9P3uHvG25GMcH4ZXanDBQLziQJsYWcErn6TrsUuKIlE7Y6zd/
	e1mMi32LrSsefgBeuDJZzKsawXVMaSJx/YGZq
X-Received: by 2002:a05:6402:1ed0:b0:6b3:d0a0:39c9 with SMTP id
 4fb4d7f45d1cf-6b4b0b1cf11mr2209106a12.6.1793283576657; Thu, 29 Oct 2026
 07:19:36 -0700 (PDT)
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260929100625.50380-1-ayush37735@gmail.com>
In-Reply-To: <20260929100625.50380-1-ayush37735@gmail.com>
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Thu, 29 Oct 2026 19:48:59 +0530
X-Gm-Features: AclHuK8YRd7esRwJwQxXZsuBWfYGyAmxvBoyXjMehkxel03w8u9xNskEzG-b4IY
Message-ID: <CAPgWTUTQti8Z7Kkw+DfTdsYd-SGsq+NpX2vD7TVmfLDdgcAMQw@mail.gmail.com>
Subject: Re: [PATCH net-next] sfc: siena: fix kernel-doc description for efx_ptp_timeset
To: Edward Cree <ecree.xilinx@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-net-drivers@amd.com, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linux.dev, 
	joe@dama.to
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm following up on this patch to check its status.

I found Joe's review in the public archive:
https://lists.openwall.net/linux-kernel/2026/09/29/2834

However, I haven't been able to confirm whether the Siena change was
applied to the maintainer tree. Could you please clarify whether the
patch is still under consideration or whether any changes are needed?

Thanks,
Ayush

On Tue, Sep 29, 2026 at 3:37=E2=80=AFPM Ayush Yaduvanshi <ayush37735@gmail.=
com> wrote:
>
> Remove excess @valid struct member description from
>
> efx_ptp_timeset.
>
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/siena/ptp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/=
sfc/siena/ptp.c
> index 0b723a127364..d643e41ae773 100644
> --- a/drivers/net/ethernet/sfc/siena/ptp.c
> +++ b/drivers/net/ethernet/sfc/siena/ptp.c
> @@ -196,7 +196,6 @@ struct efx_ptp_event_rx {
>   * @wait: Number of NIC clock ticks between hardware timestamp being rea=
d and
>   *          host end time being seen
>   * @window: Difference of host_end and host_start
> - * @valid: Whether this timeset is valid
>   */
>  struct efx_ptp_timeset {
>         u32 host_start;
> --
> 2.53.0
>
