Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB427AC37
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201258; cv=none; b=T45CUYwnzgF4AP8VPeOQaqdHcFX8UjB1vMDdEVAbUpaEsB5/jkZMZz/V1tx68ozqrfIVWlf866zEA9W7WpGACWQTil7GVOJuRLQY26WWQ3jPcbh+SIdWqwSPIPWW5B+fPznwtIX0OWEy2XnHjVS5MFhsyqNHKQunjotkNj56Z0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201258; c=relaxed/simple;
	bh=9NhsPub8Dwc9EnXZIJv3NRiBAhBjEG9mmwT11504ntE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+ukjTL8nCT4jLbCjHr+oZrSbsNZgtHIb1/Lz20cukZtH+1lI+6bRXwsvtwQfrUjWpyz3eWbWXeqGOMhwtdryWkwQz+gvc5htcnlf2n5Dn/lhxrMN/1Q2Z0OKzBL0SSo59yzREmD/TFBpuSPaLaZ/ho8n09Oqe4dZ8wjaAWDtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a5E4tDo/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a5E4tDo/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2352400344aso52383875ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201254; x=1753806054; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
        b=a5E4tDo/hHc7/h44jgTFhrZKHzK5QeBx9hmLEInNnhhn81pdYOBBBKCiGXYmf7/iUn
         9Va2YWS/Y9qPL5nkNH3SRhusjtUT4xe8jPaTrqDaeb07hih5fe/CX81uBtGePgY40MxR
         V1ykwSwi+7hTIsf+TMqlKmlCPYuZRbcnmlERc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201254; x=1753806054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwHRFu4FSql/d/NwVvAy0lekcQX4lLK0gqetRRULkuc=;
        b=SVOo929zKYhTBcs9J1XvxpgwrOYBpEGYHeUDBnowjXD9+sYq0P7HX8LsVr/50MevEA
         s54GS8sSvNfJ1pGoOLdY+1kX2ywEnEdfDzEwiQebK4kKRsRsSoN1XhoMvQF2HYPFN7gP
         5lmi4eUMlEyzaHTrEOSiUbTCiZURc/cGigXqKnFockWgOWAFDvUeKZdlifz7LCZpdsh2
         zCoI6JnX1g8FMuqwzsad+BlpreI3zSgPmCcruTNmGD2W6nHVWws/bxaYytMlLtRs0f+s
         IlrQzzClLH5u64Y1oygWoXqOv7ZeMe8Ud7vUsavEDw2m9fGSnhVp1ZbtHq77+CqGaULq
         FDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoNIWtZ2c24QWtpmsRL3PJM6r8jB7ne2cqr6b01EeWNnbXI5VyzNnIeQpSMwte8gH7vlwt6VguEYJPZkKyszQ6+E9P9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgCcKA8oE/Hp2icuWlIg7pTC8D1gw8zY5wdtMclIjbTIN/Zxek
	jmU98H8eBaqoOd7SOZ0Sqw+Ot1/MM/DqDQ8A2KTsQEGSWl1yQhYrueTitLTHQIiSzb/TZlUOTwb
	E+GI=
X-Gm-Gg: ASbGnctTREQXYZFINUWFWwzWJ2p9O/bdnNbae5A/aadwZ4L0sNx1n9oDtGp0cGGprsn
	kJaz4owWoV0EEafP7onjyzURjb1m32aQltho8Zr3CbuWAOAkwm2zXXPh7GfXqL2CumC8tRxJzEv
	w2VM0/FA4wJV6t1S47iPoT86lmXPEcGGbGvQr19Mzbj25Dj2T1S7QzDu3FsIDH1Umnd156MiJw6
	kv5nEjZh4sJAasLVigKNENxfj0lN2W9ixv4a4kRltuU1zZaYym/EkmNzhXSG/Il52olDoXXV17P
	NUnI1or1PB9vI/aRqRv6nKQh01tZMbu6s9h4sRJQRjlhpUeFb4AlgBNhq6MPtPwBXPBmC0ENKFZ
	nrUKkbyt/z6sAnN9M1IXQzk730z5BSUFnObKyPt4zSrHQjrfmdgIFgiIdH5rPyNs93w==
X-Google-Smtp-Source: AGHT+IHvsemcFTOaITCDeVoZwmETkz8Zo4vlQB30MpTrkM8sF2v1kIM63GM6Gul4BBXC4ehCn7f8Qw==
X-Received: by 2002:a17:902:ebc7:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23e24f4a753mr351511515ad.21.1753201253592;
        Tue, 22 Jul 2025 09:20:53 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f2b7sm79463645ad.79.2025.07.22.09.20.52
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so4481090a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXsQ7vFucKuOFpnd0dD/fq3J03t6F/TIUW69zmqY7bvsRZxnkYytd4p5BohWkgRTcGMXnqdNxTdc7fu+1JL4LdExl3rA==@lists.linux.dev
X-Received: by 2002:a17:90b:3f8d:b0:316:d69d:49fb with SMTP id
 98e67ed59e1d1-31c9e70915amr41164532a91.14.1753201251543; Tue, 22 Jul 2025
 09:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com> <20250722015313.561966-2-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:20:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
X-Gm-Features: Ac12FXwtfJseOxsGp7nVtSJKfbTvysXVQqEuN_xMYIUstfIqb9Hrqert7fbtJBI
Message-ID: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
>
> Remove mipi_dsi_dual_dcs_write_seq_multi definition from
> panel-novatek-nt36523.c to avoid the duplicate definition. Make novatek
> driver pass mipi_dsi_context struct as a pointer.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c                |  48 ++
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    |  95 +++
>  3 files changed, 541 insertions(+), 406 deletions(-)

Just because I was curious and wanted to confirm my claim that this
would result in a nice space savings for novatek, I ran bloat-o-meter
on the novatek module comparing before and after your patch:

add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
Function                                     old     new   delta
elish_csot_init_sequence.d                   758     379    -379
elish_boe_init_sequence.d                    846     423    -423
elish_csot_init_sequence                    9136    5380   -3756
elish_boe_init_sequence                    10192    5996   -4196
Total: Before=3D33880, After=3D25126, chg -25.84%

So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
indeed give a pretty sweet space savings! :-)

This patch looks good to me now. Thanks for putting up with all my
requests. I know this is a lot bigger than you thought it would be
when you posted your first patch, but I appreciate you sticking with
it!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

My plan would be to give this series another week on the list. If
there is no additional feedback then I'll plan to land it.


-Doug
