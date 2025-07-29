Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D71294A02
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753803797; cv=none; b=SgvBXBN5JQ/RVLHhzaUzF8M0GjhgATa31odx2uDALD7TBvVPybG349Nrzg4LUEttATVHxDtEm0s3gqO+Y2McLKqGNP9s7EYHALzqss6p5lyXs8mZCXY8crzsFWagKTx5X54FgOfiriz4LXH+XvLcLQwYiaeVk2oj0N0YBRrLOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753803797; c=relaxed/simple;
	bh=yyzHQv1Wv65hNemtjtxzhBXFqLoOaBEA9TmxWX2IOg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgelurB/zXVkU4HojjWPDo5VJUNq9QjlySSgqTKcapS/T3nXZbxxWiRmb0Oph7jgzNy5g1OmRqLnXJKexaCroGhELz7B5WfW9qUWTGQCWhXhKYCujSuH8so2+BIyWSft2fArDTKFpl5hJcRwPrLYYhCFp+LkQwbpqJ+INNOYSSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UR40MkGg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UR40MkGg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso4738399a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753803792; x=1754408592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
        b=UR40MkGgAbLhl8oO0w7fVNReo3OLnmEO31ekZlwMstYZ806+tLuNZ/FCCA1CWmqiKQ
         ra3YLTzKRA7h5qsz189JY3UiT3NkXH3/o0/uyBbR8t3DbwwHMceZwpNvx/OVnBssBqXF
         BI/a5Cfq6UqLLdb2xM62GcZWEzZ2p5Nwawwi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753803792; x=1754408592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
        b=IC7mpbjIwkML1glPtJD5pKAY+VwD/1Rwk5m/Bhw5Wpvvg/76Cz8L5srrmFlriL2glK
         WMUaWr/jAfdWHFlpT2ypyWiL9LRbsPkbSlnLjEIpOMP2IA5CnS95+Kf943OLypnqdtGH
         8NwHmzfRg5yifvNE2xLxdXpjyZzqbSsSdM9tmWMrYbFJXRXVEWCwPFcICtrIJkFwkPf3
         M74Va6nv+1ylFHN5LDxYs4IuHjxZvG+Tjcgvvo/0sg7Qwur5FgteLj9a9BHvhikbkrx9
         awL60OEZlIH9f3c7fe6DxRnK/SaQ3fu5suUqDkPuHItXYbrPE0ZRyY/qvQRwm8DD/SQE
         //ag==
X-Forwarded-Encrypted: i=1; AJvYcCUGzzjvYbpTNrc9A39qa/NR/0KLe8+YyPR5AJFXb0iDBtab90WEVzL49oomG/0gHx+TxZMrhLpH+wZrA7OEUwju+dJ+4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC+EXCaKNGQmMa6f/KJvsK0+ipURdgTJpVZZ1AIDb88/WXq8mn
	UweTq/KQp3z8O3JUuJYHTKNWCRPnjI8uuiYlHMLRQ2mRBVD7nfjBvk/4SwKivyethzLRI2HFSim
	BsNg=
X-Gm-Gg: ASbGncsIZfGXTAbSOhaAdM7DIQ7DRLMG/ED1e1wpXc+ukt+q1zGqBhCjNgrVz5VECM5
	bcT+EwlbFxF30cM9OfYJ31RunUWZQMdaTvxN88pyj7f9NWKeQBSKE7iETYDzNYslsZh8TSmKCDh
	4SBPLxI+lSiETz2Ggl9gb92rTt09dmfYryq3xskgqxNGm0LY8AP15is7Rs4HIx1tneLVavRwYzX
	Rk87P0K07eu6XdWJKNU0hS2NkMb4KkSaS2a3vv+u45Rmnzl8Wc/Kdkjda2R0lhy65YFE2eUntyc
	7nVKd/Oumd2ba/FpDN+mgh8m0ouzVxu0AiSIB2IBDUS2LQ2q0A1n2CCYkpo7wT11xdsffckL4rN
	4WCYulv3tQOCrlcbO5Nz4KCed5glNqAikb03MHHtnzaA38268ncnvq0M6IBHta6TADbwPGrq3
X-Google-Smtp-Source: AGHT+IHIN/U2tkB0qEXVvvS8j5ERG5/cM/HLlmAaTteIGGbSTUjA3B0aoZ3PWHWl00XQ69OkGIXhpg==
X-Received: by 2002:a17:90b:4c48:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31f5dc953d4mr54961a91.0.1753803792211;
        Tue, 29 Jul 2025 08:43:12 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ee4b231c8sm5499315a91.31.2025.07.29.08.43.10
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so2155853a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWilONMf1Zygi4aTOpC090QoV9/GiWqXWFa1CVDYSjBYKiHdyDw9+Y+1Jc/VovBO6ON8gpjNF4hL1GiUoZVYydEFPsuKg==@lists.linux.dev
X-Received: by 2002:a17:90b:4e8d:b0:31f:2558:46cb with SMTP id
 98e67ed59e1d1-31f25584712mr6855560a91.16.1753803789967; Tue, 29 Jul 2025
 08:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 08:42:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
X-Gm-Features: Ac12FXy2DrlKwozrm4Lh8eKlO3PrClRoMybwweQhMtq-dXfeG8sVqMiOcJ65aGQ
Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Fix bug in panel driver, update MIPI support macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> This series removes the unintuitive mipi_dsi_generic_write_seq() macro
> and related mipi_dsi_generic_write_chatty() method from the drm
> subsystem. This is in accordance with a TODO item from Douglas Anderson
> in the drm subsystem documentation. Tejas Vipin (among others) has
> largely spearheaded this effort up until now, converting MIPI panel
> drivers one at a time.
>
> The second patch of the series removes the last remaining references to
> mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
> the driver to use the undeprecated _multi variants of MIPI functions. It
> fixes a bug in the driver's unprepare function and cleans up duplicated
> code using the new mipi_dsi_dual* macros introduced in the first patch.
>
> changes to v6:
>  - Fix various style and kerneldoc issues in patch 1/4
>  - Fix typo mpi_dsi_dual... -> mipi_dsi_dual...
>  - Fix incorrectly named "data" and "len" variables
>  - Make _seq argument of mipi_dsi_dual_dcs_write_seq_multi macro
>    variadic
>  - Remove duplicate definition of mipi_dsi_dual_dcs_write_seq_multi
>    macro from novatek display driver
>
> changes to v5:
>  - Rework mipi_dsi_dual to explicitly not support passing macros into
>    _func and add "dual" variants of the generic and dcs write macros.
>  - Make jdi-lpm102a188a use the new
>    mipi_dsi_dual_generic_write_seq_multi macro.
>  - Make local struct variable in jdi-lpm102a188a conform to reverse
>    christmas tree order.
>
> changes to v4:
>  - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
>    as I familiarize myself with the kernel development process)
>  - Initialize mipi_dsi_multi_context struct
>
> changes to v3:
>  - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
>    duplication.
>  - Fix bug in lpm102a188a panel driver's unprepare function which causes
>    it to return a nonsensical value.
>  - Make lpm102a188a panel driver's unprepare function send "display off"
>    and "enter sleep mode" commands to both serial interfaces regardless
>    of whether an error occurred when sending the last command.
>
> changes to v2:
>  - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
>    driver instead of just mipi_dsi_generic_write_seq().
>  - Update TODO item in drm documentation instead of removing it
>    entirely.
>
> Brigham Campbell (4):
>   drm: Create mipi_dsi_dual* macros
>   drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
>   drm: Remove unused MIPI write seq and chatty functions
>   drm: docs: Update task from drm TODO list
>
>  Documentation/gpu/todo.rst                    |  22 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                |  82 +-
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    | 118 ++-
>  5 files changed, 614 insertions(+), 608 deletions(-)

Pushed all 4 to drm-misc-next. Technically one of them has a minor
bugfix as mentioned in the commit message, but it's VERY minor (I
didn't even think it needed a Fixes tag) so I didn't worry about
trying to get it into drm-misc-fixes...

[1/4] drm: Create mipi_dsi_dual* macros
      commit: d94a2a00d2b8878678607c2969fee3b4e59126cb
[2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
      commit: a6adf47d30cccaf3c1936ac9de94948c140e17dd
[3/4] drm: Remove unused MIPI write seq and chatty functions
      commit: 79b6bb18f849818140dd351f6e76a097efe99e9f
[4/4] drm: docs: Update task from drm TODO list
      commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13

-Doug
