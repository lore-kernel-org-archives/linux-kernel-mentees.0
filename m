Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9B190676
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529639; cv=none; b=Py0QLwaWJXLrxc32buAP6vCJMD0J6ekHzanX9Ee/ebdXX2mb4Y7SfW/fzhmrgSt1uSYRIHCMf5xO78Hgjdf+ySxFxijQp+c3QQn2qlnNxpl6Jcpc2IlgpRC0okgQA0xm4VeU563HvFfltpZ/MJlS4jF6kNx4Lr8I/DQx8utq9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529639; c=relaxed/simple;
	bh=mX8/sV1fn5Q7F0h2Lt5vjP3RB9JOKY5pvZwp8mxYjcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BybupGk9OBULMK53DC2lGoDHwYurdrvNem7/sM5pAS+cDkLks6roZRWOuBU67+hi6sHdcjWpXCzSY3zmjMzd9SlCOi8MVMMzKCjgh2YhCBMsx4/4DCODYvWxGV84LhmSGRoXjvFSOvNHwgXWWEdJLJRgR/FVxf45vUwaT5rvC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecf8buDX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecf8buDX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so42856595ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529635; x=1753134435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
        b=ecf8buDXnHTC6XZol7Ge4c+qgyvlWydY+u3J8uVWnJk8lkrQ6LQsoGgI6Cl4Nc2bI+
         CCsR3e/326RU98iL4dV5rTnN3WGf3cUQcnL5ABQEwT0iK9QlvjFgTLYyvCTxvp3w+/T3
         gYSXBlQG4gzctFaupECYeQVyA5ehkHhRz/VXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529635; x=1753134435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
        b=TQp88RT9jfwBHPOEBam5vfrQ0inuoY5ymjR7OnI4Jjoh1jcy4el2aR1CV7sSln4+YI
         6wHtLZ426PRkdX30Sl0A5YYsy/K302DzcDQO6LXYUfsdB7ar3JP0wXxD4gAPGIa+CHhS
         XAd40A8FNym3PHbn2iZTFSqZ8uHkLltQhezR85VCWRQ7zLZoVE/ErodNrDduKKpYlB81
         diGcqpXaLgAsJUILLHOkhpeRfc1KRoF5vxE099cBF8lUcKwiq7fayb1WAzWj2/E17x3B
         na1Y3jE+BFAdQmjZSnMssTV266zLkzKlt6j1LlP/SOTDZTwbM8IpzQ+so6AxkQvnHx2u
         fz2w==
X-Forwarded-Encrypted: i=1; AJvYcCXW6rpmi2TrC0TkdjZjdAhFFaZSwSUU76LeMlyBwdr9sSfvTVSKlsBBgWMAmoTI6Nwqe83bekE7VYSaYEyDkkQw3wCiVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv9DjhsNmR32Vc0GspKSEXOvnimu9GNp5oMlEB4MB9pUVKY4rp
	sMxd4iF7dBYw7QPbW9pQIHXyf4aecPc5SzaGzBu6jUNddmDUig7m2N+4DUXeU+wiStBRiRC4LhT
	NkeU=
X-Gm-Gg: ASbGnctyg3vbxImHpAXeFhH+Ejh2cU4cBC8LXcBjTwgeTDQRggpPD5+NrWgdTc4qHBS
	kJV8/pHr5UUFQkCyF85XlM7kk49KhTNfx2Y5wiTaiBCreCqzhzHcNNpLCIf36h3h0OmzHlgE2GD
	BRLNQ0Mz3XAagsOCmrMAwles75JV+1d9dQnSQSB8iX6EcklNvHlqjp0WYt/5IngFFTaYO8ihKzX
	FFYAYJCZv4AO3hI1XoGFg5EJvO3PgRignt0H1o9fn/guX2RHnVTAT1UAG1LEu1YTikxxH3RZGPl
	giWbMr26ar/e7QWpDOCA8PUUKF+Ac0YtAC6HX9X86ULxjImxe7U6021K4CdyMnzAwI0VigLvHc0
	b/91di47WPLExrcY+Iisp12YpNvITWcfbfZAPRvLmptS+v/HoNR7DlCDODYpnxAN0Ag==
X-Google-Smtp-Source: AGHT+IETZhwyTH1uy+fXuFe+XvSlnyBRMJBk33JaU8ju1wNGOMVXdZ7651EfF2i5t4zKlw60ZoVDxg==
X-Received: by 2002:a17:902:ccca:b0:235:be0:db6b with SMTP id d9443c01a7336-23dee297dccmr211874645ad.45.1752529634551;
        Mon, 14 Jul 2025 14:47:14 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637dasm97007835ad.243.2025.07.14.14.47.09
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:47:10 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af51596da56so3977492a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgA6LiZCFWAw/HA7Z/mURL9GlKXj545NyzoTm546ExIgI2Dznz56DMHlgzmPO5j/SrTuD7b1L0jrNlTV9BGKEAEVBxUw==@lists.linux.dev
X-Received: by 2002:a17:90b:2f0b:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-31c4f4b7cadmr23322054a91.11.1752529629493; Mon, 14 Jul 2025
 14:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-3-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
X-Gm-Features: Ac12FXxH2F0TYcijyhrCQmsQ50QRyPnFNI-fpx9VJR_jePJEeAOSnJSau6lHn7k
Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty functions
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
