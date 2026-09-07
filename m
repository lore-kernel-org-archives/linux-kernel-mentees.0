Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD2438493
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787881; cv=none; b=S57M7Q+i3q1GpxdA5DwQpWZeNh+UdkJqMJl6zCL6b5lqrvI/c6tLDjUgsbDO3h215Z/DuPoHAd+DWAO0fXraNP9+fr1I/vhhgf8k8J/qHkX27Sbg1mHhcgSkzCXRGOZwS4+xqQ3W2Yc2aL87KsCICJS9mSuJEJ0NFSSCvlzTtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787881; c=relaxed/simple;
	bh=+1G/9UQd/LAm1RyVlXgMRXgP/YziR3pn99psmWP6Q84=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=B45+1c9yj7vmRiHMcnnOs7OVYaPazQD74NOHO+27E6f9oPc0xgvpu+xMh2OtMsmsQPPI87VuU8sKdJdW+BgOYXmcsIGPEhKHQdZUcPL72smc3g+zBKxBP0n7/kbklPIDarxGIcYXn9EDmPeCjrK1GVQJhVMPUkUBK2I99FZFsyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKrY+2YZ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKrY+2YZ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8e6bbso84636d50.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787877; x=1789392677; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eWEcZDJ0d/jLVDHWzL+8bGu4JgK8yNHYL2NxU1NtGM8=;
        b=mKrY+2YZcA2XD71525lVnpEZ7MxVfGOZKbJzHaA9wVkxLQr1vdGZkJEbmIDjaBNJbr
         PGlR+rzt1aIHE9rwZtfUrL4+/tXku3IeFBwzJSEpgQBtACCoDJWcF1/TUo70ea+8FVcL
         CxqDrvE4BMze+hW6RZCVuh15jRyS/iOoTuDjwncSNVJal0p+em1RQ6iQJWFluHuekg3r
         6ysxCflmhlZQhOcjKpfk91vut55av579s+H3czEMw2dNThBAdTj/Dqy+gWh8JAkiLw7d
         HD7uWMpkJkzBuoKgrEQx6g4Ok9MBYlgVN2rTxkh5WcCwz2FyVe1m7HTAkYPxpaCujSM6
         nosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787877; x=1789392677;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWEcZDJ0d/jLVDHWzL+8bGu4JgK8yNHYL2NxU1NtGM8=;
        b=G6mzemmYd7fud0zp0PbB1hXX9955jLW/uFFsirW47h0IhMYnWdIAKBuzHPlnN2FgwT
         zbZUrv2fBMnJA0AcMA0wA/QcnAOwvSn/k0yn5xDwovNF2cb71CwIy49tYL1Q8JC81Ap8
         sw3X9f3F86FjJ+SFW5NgL9XsNPdTvhiTE05si/21rH51hV61JHX8+ujbId7dsmvnJKJY
         HeaCp8MY2QTNJj9bFyIHhd7+BhWOmF0MHbIvYhbnpOmhPbJPOy+t5JufGrHZ3eMnBXwI
         RBKyKmsQHgQm90W5KIDoauvhiwBJvCEGAKrGYqA+XnN15oqaQxZKhE3+DKP3aAe974v+
         ySEg==
X-Forwarded-Encrypted: i=1; AKwUvBwlF7CwR5ykLZTeTT4LF+1ABeRXK8OyAjBkwnad4Wjt7ozNP++nu3OWZ3EIO5bDXqnrkk8cjKp/7+EiQmOQ/8QJSXXOVQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kAQ+ezDLkHjBV5rZ9wlu/NS1uBDOoety/k9g9LzaUPs4V1j3Ih
	MvfJDFZXaFon0VAbdDUYhQfO7v9tQfC13Km+dx4CFC+/YC1x5thMztA=
X-Gm-Gg: AYBFou25TavvuEgaRNO2Qlzh4tA0ViKOuGIg18X5F5sfpx8dhZd/EBDmMyRp95RMu57
	kMzeCCudSez/BVC+ZxoDR7OZKau4JiI6MOnwh1QivXY58WJCfTqLNaoaIOg2a68XA3HOWORKZik
	E4nL6z7WRaHyEtYcX1Gah62VX2u9Qr7XOUF7pdjIpY1unj7lTKC5RmwsejUv5TgMK11is9yN3j9
	Ar1m2UA3ovTg/MSmMDLx7yUgWpu5v7ehtXQzsW+L3PbQ5pFzy2hm7yUtlC4PHqUkxdQYIsfONam
	5FvfIx4Ufjt2JUENl9jKujDfCsmY31YN4oULKASk4gp9qjl5vCeEd654BKaA9TAFdc5DuDUFtPH
	rVHoTyXTgzHhf6DsPxJEWdvPBNq4DTQzylkLOBHb8T5ECfMP8TVx24CZkOvk9s5a5bnSblXNwhq
	J9RnbOcUczKgAj/9pX066hdH68q+dYQr18yJcR9PMN7CGLFjsmIzQQnYSTYMFozWYoVn3lDXFux
	2yp0v7mcx+2JdVnskNsd+Y=
X-Received: by 2002:a05:690e:1288:b0:66f:a6e9:764c with SMTP id 956f58d0204a3-670f494fd90mr258149d50.22.1788787876678;
        Mon, 07 Sep 2026 06:31:16 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48b374bsm8237629d50.3.2026.09.07.06.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 10:31:10 -0300
Message-Id: <DL94DN6MH6UD.2XPV905D3FQ5Q@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>
Cc: "Brigham Campbell" <me@brighamcampbell.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/mipi-dsi: docs: Mark mipi_dsi_compression_mode() as
 deprecated
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260702194223.290763-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260702194223.290763-1-nico.antinori.7@gmail.com>

Hello,

On Thu Jul 2, 2026 at 4:42 PM -03, Nicol=C3=A1s Antinori wrote:
> The mipi_dsi_compression_mode() function is a thin wrapper around
> mipi_dsi_compression_mode_ext(), which is already marked as deprecated.
> Additionally, the non-deprecated mipi_dsi_compression_mode_multi()
> alternative exists.
>
> Document this deprecation to encourage developers to use the multi varian=
t.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 3ac1dd5ad640..9e20818f2de0 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -699,6 +699,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
>   * Enable or disable Display Stream Compression on the peripheral using =
the
>   * default Picture Parameter Set and VESA DSC 1.1 algorithm.
>   *
> + * This function is deprecated. Use mipi_dsi_compression_mode_multi() in=
stead.
> + *
>   * Return: 0 on success or a negative error code on failure.
>   */
>  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> --
> 2.47.3

Following up on this patch fixing the documentation comment. Just wanted
to check if there are any feedback or updates required on this.

Thanks,
Nicol=C3=A1s
