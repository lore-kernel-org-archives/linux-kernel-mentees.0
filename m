Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D442A14B
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Jul 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341284; cv=none; b=uGuuaioTA5VPYKLTNEqxzXcaiFbW25kNVHH4Tata1dBhBw/rOIh7KmMFXXhsK6DnmPaZ84Jun3VLAL6b6t4wFCixaNQjnkbgY8I3DlImqgav3dQ0Staw0/Jnhr91qe0H685QSd+q8ui2mWkaDKVQLoEuwCJFjT5y4I/7bLDvNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341284; c=relaxed/simple;
	bh=DCZU1avBLdQ3mFCHVCs/pikkDIEkcElag6W6e5QxR+g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=HJWdflG5d49EAQmfS+EjaZ0Naspd6AnB2p8zp2+9Ol9ysOqgnQsRX0xEAklpHbXRof98DeJK3djV6sRCW4j4qGgm/OAfFP5AaDZOiu/Pvi7XkU9CVyujm3Qjwn+ZlYKeZ1O2Cp/aWJUAokkPZiQXvBz6GPQhj2RVPXA8DtF02B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0szpaay; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0szpaay"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso2554205a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Jul 2026 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341281; x=1783946081; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9DuFiLJFQhXF47fb9omkU+r2KlD4K7BS2Tl2g+RiHE=;
        b=h0szpaaycyB1aSxQCsWAMYMXMWsMhEhMyBFzCsmkQVWLpqPfx8k3PRIKyBHavSJnCH
         gRMOVOJVlb9hFjRszStjARalZuyy5LU2yzGs0g3CAdENaNU0CpwTe+p8IEKdyprMq3EY
         Rm2MUpWNrUuDpm+KlFVnBqstQ7laStO0AclTztavH9+p+kRwfR8W5qfpBPaLYfnDmZd0
         580f6SBIp+N+RTXx2dnEqKSr669pbEHbjMRi1h1vevtHKDSjbDFZ1ZcsPHnTSmAmeKNV
         7R1dRvn59TOMlkpci/6Au2++80gmFS95Jx+e/L4K2yGXOjW1VTTgfQnnmMjewRS4eLwJ
         YdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341281; x=1783946081;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9DuFiLJFQhXF47fb9omkU+r2KlD4K7BS2Tl2g+RiHE=;
        b=aXdk9xNndxYdpTf1pI6xKLdnMnx8OjoMAyp4REDRkqaQr/eM6R/Z3a+lS8weCvnshh
         R42EPeJa6rN4N7FrLgzMJFfGyOL9qo2zUJUkcEpD2qoatSz52cKLAdqSlIuptYo3Z5iW
         PwDlK8oCXmhjosAnK/eWGC4wux8EkwLtPJE3YZhBEqVzoPacX0alT7FxbS/TFsEH4WOm
         zC3BG3m6E048W3X+4oByFZXY/Ldft28yUxWUVZ/Wobu1UalTe7Eyb8M2nW8Wvx5+lqm2
         lD3rhAaH04Eh8G2WLcpoEh6UuKTlWvV96DUuF8k59moCRLHFpWuV+3KFYe8WkHN2KTdk
         ob/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp85BlfR2kpgIS8m7N1e8ZwHNTlOlAX6xD1YEsCWiHAGJ/M+MzQYNaQ4yOFVWB563hD0+SLgsqFevp5CdvSxwlL3Lw21A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL88QtN93y9XMOZUBGUSDTeIaQjOiu/3/P6zTnl1RRtrKdE52D
	nYAjyd2AvJTIc+DBglp3RJW0qxaiRVMhZZlHAdIhDMpJ8bzvtMQQCXs=
X-Gm-Gg: AfdE7cmXMg9LRFGDmPN6bJiake86yDBtvl/JT3s8lOfOCHMNjuVCmMGavui8X8taAgl
	3fScA/HDiDH1poiqFbAW73AEqPzUWzMATBZB/+NfgrI4Wvuwm/juZqugrPjtb/tQCh6THw3RL5X
	y2HigWsSSKUOddMfLxlchQF11WLvJWWXbGYu6nboB/6Dv2GdofWk3Gcuo3C03oeDaxntN7flhc/
	KF6yZxf43XqeuOxnBWxSnMnI6UbsxossUD83CfEGjlobSCHl/w0RkOX754+OXk5/Q10Qu3Drwzt
	+Uukl/WPSDLEyyZ13R2zNoaIJ3RC4GzuJsjhzx0f1I1WPw5Zz+fbvd14NgcxiuWgCN3eL4kiHTe
	4LZLKGxwElaA9fVLmDaooH+n6XAzBLmBnd4G4gq19G2JSNvAB94PmMhGQyPnUSESZSB3om/pYbT
	PBnUkDPC8HxoSE2UK5KKIv/27NqzA8+Z30bH+d1XFRkOmnDLFjCAM23mzefGE=
X-Received: by 2002:a17:907:a709:b0:c12:caad:6efa with SMTP id a640c23a62f3a-c15a676bf23mr21887566b.4.1783341281063;
        Mon, 06 Jul 2026 05:34:41 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d7a375sm3926102a12.15.2026.07.06.05.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 09:34:34 -0300
Message-Id: <DJRHPZG7YKTX.1HUB8IXSAR0R0@gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi()
 functions
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Brigham Campbell"
 <me@brighamcampbell.com>, "David Airlie" <airlied@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.20.0
References: <20260701125624.199786-1-nico.antinori.7@gmail.com>
 <CAD=FV=VKKb1Xy2Y7D1Lv8DXhaG1_zHZqTk2Q74oT-YKGd5CCiQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VKKb1Xy2Y7D1Lv8DXhaG1_zHZqTk2Q74oT-YKGd5CCiQ@mail.gmail.com>

On Sat Jul 4, 2026 at 12:59 PM -03, Doug Anderson wrote:
> Hi,
>
> On Wed, Jul 1, 2026 at 5:56=E2=80=AFAM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> Replace mipi_dsi_* functions with their non-deprecated mipi_dsi_*_multi
>> counterparts. This change reduces error-checking boilerplate and improve=
s
>> readability.
>>
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>> Note: I Compile-tested this patch since I don't own the panel to test it=
.
>>
>>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu=
/drm/panel/panel-novatek-nt37801.c
>> index d6a37d7e0cc6..daa356bbc182 100644
>> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>> @@ -128,7 +128,8 @@ static int novatek_nt37801_off(struct novatek_nt3780=
1 *ctx)
>>  static int novatek_nt37801_prepare(struct drm_panel *panel)
>>  {
>>         struct novatek_nt37801 *ctx =3D to_novatek_nt37801(panel);
>> -       struct device *dev =3D &ctx->dsi->dev;
>> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
>> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>>         struct drm_dsc_picture_parameter_set pps;
>>         int ret;
>>
>> @@ -145,15 +146,10 @@ static int novatek_nt37801_prepare(struct drm_pane=
l *panel)
>>
>>         drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
>>
>> -       ret =3D mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
>> -       if (ret < 0) {
>> -               dev_err(panel->dev, "failed to transmit PPS: %d\n", ret)=
;
>> -               goto err;
>> -       }
>> -
>> -       ret =3D mipi_dsi_compression_mode(ctx->dsi, true);
>> -       if (ret < 0) {
>> -               dev_err(dev, "failed to enable compression mode: %d\n", =
ret);
>> +       mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>> +       mipi_dsi_compression_mode_multi(&dsi_ctx, true);
>> +       if (dsi_ctx.accum_err) {
>> +               ret =3D dsi_ctx.accum_err;
>>                 goto err;
>>         }
>
> Sure, this looks pretty good.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> For bonus points, I think you could change novatek_nt37801_on() to
> return "void" and take a "struct mipi_dsi_multi_context". Since
> drm_dsc_pps_payload_pack() is harmless, the function can now just be:
>
>   novatek_nt37801_on(&dsi_ctx);
>   drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
>   mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>   mipi_dsi_compression_mode_multi(&dsi_ctx, true);
>   if (dsi_ctx.accum_err) {
>     ...
>   }


Will send a v2 with those changes. Thank you for the suggestion!
