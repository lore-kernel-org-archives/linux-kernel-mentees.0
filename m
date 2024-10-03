Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE861A270
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 02:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727922803; cv=none; b=PIh/9rvifbWeP3KRTAbkL8cXm+5pCNf4B3IpQTAV2/Ja+5V/r3PmCgfqJWYxNyGSDuo1XoU/czHBM/Q4qUKV1bjfcEuRrg/JtIqnsGsu6Jku5SJIka5fTLJbO5prke3Ca7tC4h4DyGDPlRhCtojeRmIO7x6KJeqtTalJ1F+04Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727922803; c=relaxed/simple;
	bh=ievyg8trTrRHAB+z6Z6DCj1Tu10iG5GzPRJdGpAVUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS9O96Rd6rWxq+ZmEXqBVHGe6fTI+NrsHHVW73Ww4wxylq1LjGTvHNaFi6HsQksO4W6/PXuB3Nd2yjYF8fdt5F8al54UNbk5vmgi7TFG90jqPLv57tEveYZKiEw/XjPr4BMNc0zJ2j8TW51OtwhSa+pC1CGA3A47mn+Xb9nsYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwkqqmH/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwkqqmH/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8721B6118D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 02:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVhJVKhoCiOO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 02:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0794B6117F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0794B6117F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jwkqqmH/
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0794B6117F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 02:33:18 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6cb2824ddc2so4202886d6.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Oct 2024 19:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727922797; x=1728527597; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkpfPr0EYRdlxNhthgj3FTAxfyKqmJJR9nkwDDTRTpI=;
        b=jwkqqmH/z218xNm31PgfSOjz/F9+6v5JY4S6CitRh82uhJnz9pl5UQgXWMKDuQ5kZ/
         6OrmXdjuvwE59ydindcmEx1Q09iliL/vTxq5R+R4TlbgcwqdoIi5hf9MxPJxFVIObJsw
         bXkaATOPK4ZfNGotoJdKQA7wdisuP2MPhwThiaEuAuOTgLcD73ecawEh7L9dRcwvtn2C
         PaqlWGWFH/dYZSh+GhzC8usxBvneWr3DF9sShTh+3FLUPJfQwPiEMTG8fuM6a6OmYfrY
         ctaEJhXjYUI7Ac5sFYaZV4GI/qiDg3fGQbkhrcCzTpyHoyp055HVXMOwsHm/V0TtpoVA
         fQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727922797; x=1728527597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkpfPr0EYRdlxNhthgj3FTAxfyKqmJJR9nkwDDTRTpI=;
        b=P+zTMa3cOfD7VTH635Oz2Ur+OU8jD7Pc2DU6t/o26dZtlwClYu3qQnZfZOtyLKwT9P
         1F4DoDHF2BfDlFW8qW2aYKEz+sxuPCu0i3V4/Y3PJVMcFddwm5sA1YdqULstc7R3bhqA
         enBYRKXUh1pcL6m4BKFeYgq5uZlP5vxNlQsG0pmjzif1tGPeaKpwkitDDxiazwzA9nz5
         Xamh4c3XfZd8EbjWME9BNzLa5VmuWlt8JxNPHBPabMsuVX9QOwovX+V3zy9QJoh/N3AX
         usogtEqGmySwU/7fekmWGzLcyL6tvizMUEi3w7a4qaXujPZ9YDcPrL1qKX/MiqcTAnF9
         qmEA==
X-Forwarded-Encrypted: i=1; AJvYcCUEMFd1saPzaghCQeDG6PM9mBOeawVTsyDWL6xhfBk4Pu6/rNCDmfmZGCnoLHG/QmWJPhR8Zn3hvnfxLu7p6t66uI7ESQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywq6tOwT+QiX894Y7mbuE4BKKRkQAX6ZYww73Op6WGPQoaxvsZw
	LlfOZcRIGfZmW9haTv/F67qucoUd7SCmnehKVrB3Q49kuZFyw6pQ
X-Google-Smtp-Source: AGHT+IFI/jVC3KeK2s+JU4a0+Yt+Rz9wy+dcMj8aCK/vKQWCiYwY7iHn9bnCY+q25G+oSsBZcN4Q1w==
X-Received: by 2002:a05:6214:3f84:b0:6c3:58b7:d703 with SMTP id 6a1803df08f44-6cb81a24c2bmr86793316d6.22.1727922797436;
        Wed, 02 Oct 2024 19:33:17 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb937fba50sm1501446d6.116.2024.10.02.19.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:33:16 -0700 (PDT)
Date: Wed, 2 Oct 2024 22:33:13 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>

On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
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
> > Changes in v8:
> > - Addressed review comments from Uwe
> >     - Replace pwm_get_state with pwm_init_state
> >     - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle
> 
> You didn't explicitly mention that it's fine if the PWM doesn't emit the
> inactive state when you call pwm_disable(). You're code should continue
> to work if you drop all calls to pwm_disable().
> 
> Ideally you mention that in a code comment to make others reading your
> code understand that.

Sorry about that! The intent of the code is to stop the pwm from outputing
when the display is disabled since the signal is no longer needed. If
it's best to emit the inactive state rather than calling pwm_disable()
I'm fine with making that change.

Best regards,
Alex

