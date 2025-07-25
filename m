Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E221096F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753478208; cv=none; b=tWaik2v9GWJ1a89lX9G905Rj7oBqoKEKf0t/IB8T7CZmtOcQ1ek76iqvGIrciycIMiccYyHif+/m2Kt5sdYgwBedc1TUXLLjZwfZ3fETAsgl6UtyyeXMzYFO5v1myFmHsgMRLhDzr2TfWzHq8vNXXhIg+imBBQ976c9FYVwCvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753478208; c=relaxed/simple;
	bh=1fJ2MfilOVqJQrqzhISXTxGQxYhflr7VZ6mmtFSxeeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9mk5vOqg3NEdvdxU8gLCIm9CbKQZCrB/xMlXoFIADd6f/UuzXvE0TFkr6XvCYKGAWvlNgFAkNbVivinEGqQ7D98IGMJtEltqLLukJT8rMHjg44fk6KIDAhtaVo3HJT9l0+nJpmwwz2osxBF+lkt0S60JMF6Ww9oMrTmMgS3n0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ak8fZo9i; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ak8fZo9i"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74ce477af25so1849912b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753478201; x=1754083001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7cqUBtmisnuPeRZVUL+pQK8RmL59JAS5kkk6fLd2w4=;
        b=ak8fZo9ilLSeSjK9VlnuOef9bQSkdkoSLZa8osFNP9HMI9SK/YLXZBPzTBx6jWmn5N
         UIcfKgT0s721Xt3mqkN7NAk8+02M0+CFY98ed9K6rKzo20CWeRqKSn14BHmUwcsvi6js
         3QAFmuUDiUkACW6+FPRHxVleL/fzXEwc8risY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753478201; x=1754083001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7cqUBtmisnuPeRZVUL+pQK8RmL59JAS5kkk6fLd2w4=;
        b=bvkebW4Jt7OULobpYk7ZDZ+CEpgnLGThItPhQN0wC3zz4G0IZQIcuh0oZ3+FAIzPZs
         5UgGgiQjME/tbl4cjeqLAIKp97mmVcqIjyURY8cW0L4H57gB4RzMBxxJsBab3K8d0XU3
         fUtuKEIwAObOpa7FPRT3ziTIgWC38NAOFqCGIRy/EKa4JT8dYkeGPUnaxOQHhWY2ruKz
         S6RxS55lgo6q+Nk/dH7mReufCfccxMUUHk8M46Uh98YjtDNNeBk1FUf4j1acwfvyFDWe
         IdPToigrQixP6q8+mYBGXmmtAPdf+ozG3b444L/Ss8Rbf3CjpVIOuVsjKTMk0mRJ6ryV
         40iw==
X-Forwarded-Encrypted: i=1; AJvYcCXbCuV8WzrPWqEGIvncIA4VCTagIHhb9q6IXlsEH9nJ9oV7VG2Hj5q/jiB8r+PVFrGnf7L+dFPT8/t63CBN0MyKmC4aEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAfSMqtRPVNcXhcsHPW78Nq2t4kJZHaFfN/WDtUgj6R+g4IjYD
	+pndg11q+m8m9H5E+TDsS+9MUaGfEae4bSfebu5ZromAj/8jmt2YDRORAtJOAmykuwvN+vqRJUP
	gaKQ=
X-Gm-Gg: ASbGncvkvSOlfLu+aiZEpKWpzpu/MY62+P5CElzBf92rnlaMMgemWuOhMl9NKvoK8xl
	9Eryns+RxDOc1eMhcl+sB+lBsI49fLFIgqVFpOfUZeXGh4hT40Rh3uoo5VSMyAOtk9vHul9HOPn
	TAucfdfPPyp/rAZlLL7RdCWtFJ/Mxt12iEnqg5LwVchTbEwZgHMP76tSzJrl4+YnIZW4LW2VyuI
	iDekwwvjGGop97quCznCqOnlWUQnp/XYmzOUTsVf5AINVlYwAVo3O8d9p/8sgjoZ1rZ+cdZdzy7
	NYA0b60BJCT8oGB96QwhaegN3AiQMsLYsHs3UTsLPG3Vx+HaopkHfULzTL83Yj5At7D22S+agrP
	1YGgXW0en/zWSh4DxhRhbq0GetidZ3lUva4WlL1K8iTepHbeJ+5usnEKmNa4PNXGrwg==
X-Google-Smtp-Source: AGHT+IH0ft3ZLPAHoYoSzfEh3DtsBH6JdxeeDt9+s8lAzhLquF91fN2bzdsK1BI9eclcBcXNR3vvyQ==
X-Received: by 2002:a05:6a00:853:b0:757:51d:9af9 with SMTP id d2e1a72fcca58-7633342abcdmr5049843b3a.0.1753478200931;
        Fri, 25 Jul 2025 14:16:40 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-764090e178bsm433327b3a.62.2025.07.25.14.16.39
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 14:16:39 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1fd59851baso1939490a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW36e5JdkOmvc0Q4vlUGoZ+hizH/GH2NjPMgdCfSreD1jmT34qNmh3iWxpMEkoBRTLVyglqXRS5yHr5QrZKejll1gMAGQ==@lists.linux.dev
X-Received: by 2002:a17:90b:53cc:b0:315:c77b:37d6 with SMTP id
 98e67ed59e1d1-31e779fcfb2mr4543990a91.23.1753478198547; Fri, 25 Jul 2025
 14:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com> <20250724202338.648499-2-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:16:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
X-Gm-Features: Ac12FXwuy3K1ITZUFyK7_VvNz0LpuHmryqPozv35YYsEjO_5SuA5IxC-IXYo5jQ
Message-ID: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> +void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
> +                            void *data, size_t len)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       struct mipi_dsi_msg msg =3D {
> +               .channel =3D dsi->channel,
> +               .type =3D MIPI_DSI_DCS_READ,
> +               .tx_buf =3D &cmd,
> +               .tx_len =3D 1,
> +               .rx_buf =3D data,
> +               .rx_len =3D len
> +       };
> +       ssize_t ret;
> +
> +       if (ctx->accum_err)
> +               return;
> +
> +       ret =3D mipi_dsi_device_transfer(dsi, &msg);
> +       if (ret < 0) {
> +               ctx->accum_err =3D ret;
> +               dev_err(dev, "transferring dcs message %xh failed: %d\n",=
 cmd,

Format code "%xh" is probably not exactly what you want. If the error
code is 0x10 it will print 10h, which is not very standard. You
probably copied it from the write routine which uses "%*ph". There the
"h" means something. See Documentation/core-api/printk-formats.rst.
Probably you want "%#x".

I'd probably also say "dcs read with cmd" rather than "transferring
dcs message".
