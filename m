Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB10288C3D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 23:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755212954; cv=none; b=TdlsU1dzeSqugHvFeJN2ILdyFRe0Q5vdwngaC2zMAeWqDg3Q1wHToqGVF2IAqYJB3gS/XZ+iM1J77upe8kIea2eREHNDRDEkKdi6/7aSe7tuZL9IK8LvYlp7IEd7Sdil66J26ALlhyBKRpSKx4jFM8SSyQxECoTSA5WswXRQAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755212954; c=relaxed/simple;
	bh=kolEcxZppRJPvtj9Y7bjq9AsyYhR7A0nQaGAV7R8LoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/PRf7PAS4DD1wVVmktVcbS8znTow9ldP+h4h6Ddu7viKsw3rwvShFQG1XxkFXqOUqgcyDUqikCTnHcXCKv6j3i93M1jpagJTN9UGEiQovpZ3x7ZUrxZQvOBXkDh59SJ2YVU8FX9+IN8nKPrHA/HvdFTWUZKhOa+SJWO5PK90VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DbU26Ym7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DbU26Ym7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso1839926b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755212950; x=1755817750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS3pe34+blEX5syRHqDIoKBEMxv5qKslIftcYANOZlI=;
        b=DbU26Ym7Dj5S8aC/nUYtTVHjWZcdovaDnfWXad1Z/iso/hf6fSqSsGau3LYOvGugfF
         N6cTeyFRX4vUfu4x0TfaIPtwplIcsgztJ6e3Pwaj71W9bR2krFD8DJers1VpRLAxokf8
         sbuLtkfqjVHWNPokm5SyRB85wFYAuUWRlLp14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755212950; x=1755817750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS3pe34+blEX5syRHqDIoKBEMxv5qKslIftcYANOZlI=;
        b=S09el2OW6BhZVjch64gj8cMYaMVJXAmEvcI3/BJorzxN4nQh4KT/7R1AqMYKgl+vMH
         qzIvNksJdVyBbRKOIRcHCuurrd8YITxX1S0BoEADCg82pXRg4oUpjSYhODlE4rAtDAkK
         xl1L+At4JuVgKvN6sDAsyygko0bhPwW4Fh9OCs3FIXF9R/aUtig+kENbPh7zHepaCzbx
         IgzEChEhJ7s7xxu6m4mwQvkKu5nWQHY+HDnB6Gizckhcv0+PMeD2D9D4E07mzjWDa8fr
         acWtUYMs2ZrU/fkD3gTPFD4OZGa/ZbzUZV9KYRZeq2IFRWTLz/zPLV8D8FKWtwvVX04F
         rQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWAMdmHT2aPY5kQ9bM2ttSDuZKcjh8E/oekP/y6SWOpb0v1OjQa6dPaSDls/ANEO3dx5Tej7q9xt6Q6XVQmsbPO4RBGBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCxd3uL+LHwlgDILinIGoa7LGhwDNg/y7b1M0XHbBHD7Y0FQJD
	aKFN2kLXIA/Zk+cfXoCU2STCcIKwsfHo3OO2xkTFbAwO/CdcKMkQnVAoBBKAaQCHuiaIzWsSzCQ
	60ts=
X-Gm-Gg: ASbGncvI/FojSC4yhk9cNNjtnlW/aIkv3dgBFfrS4u4Vw9/gYDFQLlUJujN28UD7wHd
	rF1n493j230W1NsX9HJEF9aBiii2rB7BV2jNfMFFEC79m8+sHEPdsbcLDOALF3uGCBKjospZkIg
	VDg4Ppsd52U+xD+S1+TrcnpY1lfBr1kz6qu8XgdvH4XVcAnoX7GVHae6bZlLDSKDdG8VTD4oovj
	D9c/iFTVMyQVzlm/iBN3y9LX1LQdSXAnt2zkrJuOWxEpGvWCiy81rdM6VZvmNDDZOuMu2HUw4q6
	A+VYOQlvy0R/biCPowYsBWKxRLHTr6mlwQAzZOS+Sjb9pBAYWY9gkSNQKDbuEtxwXW/mV6B2pqp
	DFonzMeBGf0sePWlSV0nA7whqnK57uI9xTWZuQIM57hgQgiaRAmtEq12jzr08refNMQ==
X-Google-Smtp-Source: AGHT+IGqKgWM2fDLefcpYQWqLJJn2sYUkAC94HnxhSSn2YPfNh1cCdFle6ZJGAg2mInmRBAjLo0QJg==
X-Received: by 2002:aa7:88c5:0:b0:76b:db12:3e7 with SMTP id d2e1a72fcca58-76e2f72d0c4mr7119810b3a.0.1755212949555;
        Thu, 14 Aug 2025 16:09:09 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6fe4bsm35423253b3a.9.2025.08.14.16.09.08
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 16:09:08 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b471738daabso1239930a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfJqHnyk7SDYQiFAc1VswzqVs3LtAok8ErHUPHVQvJ3N43Uiqk7TqCWvpe5b/f0UzQyda2EB0B0Ee5vUXRMW4gQ0pXnA==@lists.linux.dev
X-Received: by 2002:a17:902:d2c1:b0:240:a430:91d with SMTP id
 d9443c01a7336-244584ed485mr70762725ad.10.1755212947590; Thu, 14 Aug 2025
 16:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250731032343.1258366-1-me@brighamcampbell.com> <20250731032343.1258366-3-me@brighamcampbell.com>
In-Reply-To: <20250731032343.1258366-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 16:08:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7wxe81Oi+SZdT0ym1FTz94+=_2r25x3Ju3aS4YsW7JQ@mail.gmail.com>
X-Gm-Features: Ac12FXxHx_giTOx_CEoA9_jVJzsA_CjD1xiP9IJHbCl-KW_M3haonEOgwpAIZVU
Message-ID: <CAD=FV=V7wxe81Oi+SZdT0ym1FTz94+=_2r25x3Ju3aS4YsW7JQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm: Add MIPI read_multi func and two write macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 30, 2025 at 8:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-constant data to display controllers.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

I resolved a context conflict with the other recent patch we landed
from you and then landed. Pushed to drm-misc-next:

[2/3] drm: Add MIPI read_multi func and two write macros
      commit: ffc23a204a5f2e763a8cc8a8cfefe0027a6f0ec3
