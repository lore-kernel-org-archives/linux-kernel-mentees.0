Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011C22539D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753825237; cv=none; b=G2JEXGSTU4kFGfSxAld2R6m6FEcYKLMBnVB7xglG0/puI0576y6voV9atep/ML59g8HJJtaH1woiblZD+jt7nHENAaa+xQ9LsGrKwHnxy4nIY3BDE4qNnz6eo/Ot1aprsjEugKxHTkTLa3nDZGR//XzafWsyFIuJgMJjxaff0Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753825237; c=relaxed/simple;
	bh=hV8pNDtHEaZuH7Mi4bBOWtAgIplXFi9R/rVfvMjJlz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONq7buxwjIUdm9a3qsNKM9+2BzIpFx9s4lwnx8uSrf8OJBfrj11NJf8AvxSJhVJ9m2IIBGycHvU6OckRRBDvkiyu+/MT3VWhi44f++npNK5n4Mvg+PPF2guRcANesytQOJuKuI1vPZ+a9h3Bv6px7Q4U8dDu0ps/i8vWDv4RWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KKdOmACR; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KKdOmACR"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-41eaf97416eso3429073b6e.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753825235; x=1754430035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVCLxnNX9ssCVFunVtRLzu94Pq3RrLWSiFarp50OMoI=;
        b=KKdOmACRnOr9xqnS1nmfW/J5M169n7odxqAAUnoNDG9eOX6qAbqslrhs9Eb77Zeofn
         I47o3us9tshrpmk7p/32eZxhGBUL47Xx3EzFT+D9RhbCwDFITBXxV/bMLJpRHYK8sDLw
         k0mIZmh3L2PSyH3DL5W2jA94Qlp9XcqSPNHSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753825235; x=1754430035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVCLxnNX9ssCVFunVtRLzu94Pq3RrLWSiFarp50OMoI=;
        b=ccvb19/oMIpqZ8/E7mLHF6wBL3byMELMlHv1+5V4bUbW56O0XS97uGfky1Xz5mAkm4
         TW/tviDUUD7zB3jkqpZE2TyBYQvtb/cJFiQtMo74c+XKuf4hmBGFY/sO5QReKnJdJxoH
         wHkwPLNOZBEg3FUMn+d4Yeaw/xtaKWqDJqVqlMuabzGV0Rn+oOqBjdFvhhGgGrOPiC7j
         DVm0f0TXMsFsyHYvl4i8J4tT9JjrvjxlyODbJz58Ja3Jm7bX1+qZY0SnFlkTagkf4g0N
         fHcfi/ERmozbJmaa2NLA1/tfvY7P5Z9Esiz20CzO1IQ5XWnO5cSXvVbnS3FjpUVIbU6L
         YS0g==
X-Forwarded-Encrypted: i=1; AJvYcCU/7/oIzmZcaKkfNf/uZfsRlo75J96ipIf0F959hMR1wTPTxtx+ln+c5OOCyk/1WyouTvaqMLXAxbSt50RguE8G1AOTIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMD4vX3vkKAgYv9mD2Yrd5tLBMQCCeouA88yKdRr6Y3ir8YVj1
	BaaBQp3hB5KUvOSTBAtYbfyhiJxUfmzDw4TZRhtUM/GvEA7QXuCm/HtIT0pU4XNAhN106jOf7yO
	22jw=
X-Gm-Gg: ASbGnctUBUl06X0a6gjzwAuvGCHAcaOVdRh5ANqYRuBFVXrwfsxsDl1RyTOZgc9nsVW
	H4mkVi/1nbhSj+CpaE8yQw7ej+Q+J3dNJig2OuZ1lA0+Oa3uGJe5rkrBT+gdFGSmSu4ZQXFuDdG
	bHwSjZqd+z/U5NPG/71QlzSVq9FbFvdG8KN/5IHyW+WbJKV0bio41otArY5YiyljBghw4ccsFbq
	TGL9XH+2f9StLvT1TE+dQwVEUgeXfGeWGrnyOTUSN8+iPp7DBNBqdVLUW6rJgT0G+vPGxGrVbhk
	kLhQovImeeQ6m/akTtXpolhyGF2quiTPUQ5/8Boz1pYKm/9kC32Tn69o9zJjYzBhWnN0MG0fqMY
	1wZwtg/w8BAnJhom+/fdDC8Ii7c+ifHGOIllAAgKqd0O03+ZuFVQA3Yt6jiZODGoVwJzyO9o6
X-Google-Smtp-Source: AGHT+IHWVvOWBpcXTHb26JRyfKeeYv/C9JQCBMFOeuiooKO4/Y/mCD9ufosV1e/Rq/FQBKYPMh1lHw==
X-Received: by 2002:a05:6808:138b:b0:42e:4134:da53 with SMTP id 5614622812f47-43199f87bc6mr664343b6e.12.1753825234757;
        Tue, 29 Jul 2025 14:40:34 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-42c7b55be77sm1602689b6e.14.2025.07.29.14.40.34
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:40:34 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2eff5d1c7efso4548029fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU15l3uezbagufT7JzBknzRPTuF8DqBFirAAMKzLkoyFHsPomsc/jLSZo0S6Jlj9g+GPq7HABm7eGQxd8fF5j/rgKFQkA==@lists.linux.dev
X-Received: by 2002:a17:90b:3948:b0:31f:3cfd:d334 with SMTP id
 98e67ed59e1d1-31f5de1f1f7mr1224460a91.4.1753824882727; Tue, 29 Jul 2025
 14:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com> <20250729054435.1209156-4-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbTQRD+hbykD5DXGWKXsJ5+rEH6vWa4dsSMmxU+NKz2Q@mail.gmail.com>
X-Gm-Features: Ac12FXzeQrf6_M_2inD2z7AMl0MQ8EJWdRVuuxzGi0c9nlBwan7lOfCSMzDT35M
Message-ID: <CAD=FV=XbTQRD+hbykD5DXGWKXsJ5+rEH6vWa4dsSMmxU+NKz2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: novatek-nt35560: Clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
>  1 file changed, 60 insertions(+), 138 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
