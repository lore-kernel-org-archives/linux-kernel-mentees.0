Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700B1D07AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 20:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728936915; cv=none; b=Rzftkpl+w6sMrGM/f3LmFo3Si7byaFSurzXwyKJrykJy04LXXnj6ZVstokit0Nm/IPBO3ZXYFw/HeEuDdf2H9eIHCQzzjlOFxxryHFa2o7+YtnwnKWHa0Kj4i7P2xN7Q1/wSG29o6MWI1PJ9ZO/gmNGL5tmQIyZact1KbOxaRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728936915; c=relaxed/simple;
	bh=OJs6zdOtIeAhgerCz4fGfsBYiuRtasrfJZ4O8b/wJJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3x/YVK+wJtsguJts+bgYvyA1ecvFzL1vrLOejLTopE2X0xLvAQGLhTy/VT1f54LAVv0DR4pyukFVacicYddhffk7XFgdj/DFpDSsesSgu0v5NKBXWInnRq55d4DUUwm4YnnWoCZS4QLbCKAhTPpJ6JmyDKO+fg0tiOKPCgKEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpYwVCTw; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpYwVCTw"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB4B60774
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 20:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g1KS3JRUBou for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 20:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A23D7605D4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23D7605D4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fpYwVCTw
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A23D7605D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 20:15:12 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7b111e086e0so374957085a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728936911; x=1729541711; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dpw2WNuTyCqysTkudvUql0camhRiNDGOcryatLTQ+dk=;
        b=fpYwVCTwt/KNJqoD25/UEJp8kfp9vdVOrtWzHvrhr4fQ4/i34NI3DpOYZhzrl67K3N
         wV3MEwNdsDec6TMJFC52g/RQDLjHK7ybo8P9fu6o+cS9I/kUfzuzv0FVpZiP98KgFMpa
         +/nL6JsdHscR4hWCvtYG3BvH/R/Nbho0tM+vipWDlG8LStSYTKoD+3fd3DkVBA/HLQrW
         SjOnIZsc3gcm/KU10kxFi48bMb0T1+GcSpSODsrAuSmYKbE4nIi7vJuzRWUVxf+aZRjL
         JGd6KSd4bXCoV69yZRtQwsIdgx0seCDuHLGwLPdgx03NEGc+kjd8tMCPZGqKraN2KH4a
         aAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728936911; x=1729541711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpw2WNuTyCqysTkudvUql0camhRiNDGOcryatLTQ+dk=;
        b=Kuuiy1zfYY0NVX3GuuHphyLtKDYplSJdp0If7n3gtbpiPGlXDDr4pboKCAEmudClp1
         zlk75FHfJxgyrNiKhuWC292P4K/fQnXRFGB9jp17CFHkZ5OWjhKXFP7OKLeQWrH+WVgO
         Cb6vuEnXvXe6hYqx6nXF0LqRUBSN41jC6BAIUZI6YuO7ZYymObJHFq/p0b8zi8rsHW1A
         yUJJqoWKFNkP6bRLJo1l+bAGXuVQDyFPurtVSE2D8xQ0dtDr7Ps59fxtlDulGsxyK6dR
         kC5lsxOzTb0PsOsSDdt0wZjmwyjdsHh56vvOmW15vZ83IGtPWMV9n5Kizr5WRvkp10Zb
         UA8g==
X-Forwarded-Encrypted: i=1; AJvYcCXHx5c7TBfjk3NAKJm+JAEA40tOtoi2olu/+5L93xgFtY3fUUcr/RvcEhqewu6InYZeigiO6ePP9jKinuKpfbXmeuIbtA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxviBQwDrWbGO5aqPdYloNKdDsEDcv0Abh5VPYDKYTu/dbK2zVL
	51ltrltoryHV/HnjJlP6qDQo/HMY/K5796y5za2QyVsNuhwB80P8
X-Google-Smtp-Source: AGHT+IFcMk5820x03/AY7v0duvIy0JMNHUd1BnYfTeb0HIwZnlUhGZf9L7CFpFzNKinLIdNqMfdDrQ==
X-Received: by 2002:a05:620a:28cc:b0:7a9:a883:e22b with SMTP id af79cd13be357-7b11a34b9dcmr2292551885a.7.1728936911258;
        Mon, 14 Oct 2024 13:15:11 -0700 (PDT)
Received: from VM-Arch ([2600:1001:b148:c0ba:c7c4:edb8:1e9:3521])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11497a931sm451280085a.110.2024.10.14.13.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:15:10 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:15:02 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: u.kleine-koenig@baylibre.com, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Message-ID: <sxxpdm66dukbef27nnvnxa5igglepkcer6qtgv2hdfaim2jmqy@5xd3zwu2ta5f>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
 <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>

On Mon, Oct 14, 2024 at 10:35:03AM GMT, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 11:03:09PM -0400, Alex Lanzano wrote:
> > This patch series add support for the monochrome Sharp Memory LCD
> > panels. This series is based off of the work done by Mehdi Djait.
> > 
> > References:
> > https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> > https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> > 
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> > Changes in v10:
> > - Address comments from from Uwe
> >     - Replaced -EINVAL with PTR_ERR
> >     - Error check pwm_apply_might_sleep function
> >     - Remove redundant error message
> 
> Let's wait for an Ack from Uwe's side. If there are no further issues,
> the series seems to be ready.

Looks like I'll need to make one more version to accommodate the new
client setup by Thomas Zimmermann.

https://lore.kernel.org/all/20240924071734.98201-1-tzimmermann@suse.de/

Best regards,
Alex
