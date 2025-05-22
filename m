Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D0033DB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912132; cv=none; b=Nz0oGlIn2+HleCCxmfCQvcfJjEZ6zEXLRtHxbcXutyMGgcbCzL9Z186GGkV0Vz4iDDUZbiMdwtHxOrTu/mLF/BFEBc3En4y1pL/oIQnKWsMp0/UZgVv7vD/xHPPTXGMG9utkZ2oOnUIDE/pGP1NBiOXQMF2fRcLjTloa+heg/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912132; c=relaxed/simple;
	bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fi7v+EN/7K6VYeOR43kHnrV5rGLu5D4fLiv/J3+8iPzDjaCebCaIJC55WrSuanWPzhCMuzvhsCizId4YnHUj7M4ZLwvdW/Pkl+/O3v2UtFZ2HU+yp+fGcUw+qc+CVjkzqxbdIzOwcC0i71vlJAcU07rQbjY+jKwi0g3sMp9KVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/2Ei9aJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/2Ei9aJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so6609915a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747912130; x=1748516930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
        b=X/2Ei9aJJtqkAnP4XiQzVQ8cmL522xCED8kXacqa6AAdg3Oeg3zx4w31pQ+l/Ybmos
         QZ+dG+funzbzFiSKtIY5tKdB/VrQ9IzAKbBQIkdriQpEkvrzk9DZB0AAZBWaNZlxEjs8
         ltXAHV9Q/pCo2+V89rMy57IQDJh4JssY6HsIPWpkF3Sh/69vT4AI+k8D0yJeGxfjMh+m
         yDsMZBDMklRaUWzF9xbiRa1GxfEYcb/IuuZRk2pcVgrReXYKRo672jP7gT4XZS8g3p2T
         NmRKKCNnf5xPNAEGUAsetV3eM4McO5p8gNrGk/4DEWjiVXSPeEzJ7dkAKqDIQxkt7btG
         5vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747912130; x=1748516930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
        b=DV5UYE0gpwSrMcTHRxnIr3CIs3ty7+ia2wNPqZQVH2clclAR6Th6UAInGh8bhbwnvW
         W9+MpZWOsQwPC4U2u9UR6NzQga8NNLmG3RpIu4LL6eF9xVxmwhuSV89zk6ZOQlwLshhP
         urFnyWr3sn9JJFNtev2PjjqAs9cjzBvsCifkYgcA96IzqsEegEeRv/jrkdGu+5p9PeyV
         gyf3GCdvP5m92YSr8Gnc+hVnMq/EIXOSGAdtuWzQohNXHQSfzAaGpOU1cxcKi0gtlro8
         zhq98BsB86F0WBBSEFlf+PFWdW8TWX33gj2Tqm/RZD5+wf/gMheBKQwkOscJ8NWkLWJF
         toyw==
X-Forwarded-Encrypted: i=1; AJvYcCW81XeAj3+tF4e9W+F99gh/6UNdAVAfda4u75MqueN+xIBKQUHDaqlsOYPXYStiHvBI4bq1ghD2mqRxMsnRgTzmjiFMuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2S6jZ8p/tRWglGqeTgXdkH/HkMUm4HKhHs5zNghyHc5ElcXCi
	lOkJn1FfcbgUPo0lyi9Xw2ItWWbwD4hqjaJXlfaczK8coJ2nxfnfrdY+odPWjO47dSSw3xX33ol
	kCoXVxFFxzCaQ5OMwuoMrko6kN6wlldvB1UU=
X-Gm-Gg: ASbGncuXRV6l2cKN/VOJkZtHLPDaBkKIh3+hpfCxMUVX6ldtbUuqJENZW+ip3bDWaD4
	2tgYghWTskJnMhA6GBPo6+G6DxbWo/zyiHNRyYyHIqfVhNDhl1s+fm2AZRdJeaRmXKfN8/cFE2+
	dtTc7ikGCYR/jGCQiwAZ28ECBB8LC27mMw
X-Google-Smtp-Source: AGHT+IFPeY2LRD2+abl0nYii9cYBw9bGVXUsb9X3lJAl/vpr0oP00uQJBGJx72QLpLXu8XCe0nYpeTJpokPn1VMHkXU=
X-Received: by 2002:a17:90a:e18b:b0:2fe:a515:4a98 with SMTP id
 98e67ed59e1d1-30e8323ecdfmr29636628a91.31.1747912130575; Thu, 22 May 2025
 04:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com> <2025052234-brewing-recall-a7ed@gregkh>
In-Reply-To: <2025052234-brewing-recall-a7ed@gregkh>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 22 May 2025 13:10:37 +0200
X-Gm-Features: AX0GCFsvGHSsGIxobg0c8FTEHWDyusmXNeoPwzeRw5AJKnBxbb5CTC7cg7hAh8E
Message-ID: <CANBuOYpm86aJtk9ubkjVSOeM=tctF7upbsyPYOP-Bf8bNnv-0w@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING
 macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:30=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, May 22, 2025 at 01:47:54AM -0600, Brigham Campbell wrote:
> > On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> > > "VOLAGE" should become "VOLTAGE"
> > >
> > > Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> >
> > Nice work! I was able to successfully compile this driver with your
> > changes and I don't see any further references to the misspelled macro.
> >
> > Patches which fix issues which were introduced in some previous commit
> > typically indicate the offending commit via the "Fixes" tag. Admittedly=
,
> > I don't know if the tag is reserved for technical bugs rather than typo=
s
> > such as the one you addressed, but such a tag would look like the
> > following for this patch:
> >
> > Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH=
_VOLAGE_WARNING macro")
>
> Too many characters for that sha1 value :)
>
> thanks,
>
> greg k-hj

Thanks for the feedback!
I assumed this tiny typo fix might not need a "Fixes:" tag since it
doesn=E2=80=99t really "fix" any functional issue=E2=80=94just let me know =
if you
disagree. I=E2=80=99m just beginning my kernel contribution journey, so I
appreciate any guidance.
Cheers,
