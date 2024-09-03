Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27118BC1D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384627; cv=none; b=trWotw7zAdGtp5y+ppgLWhBgD3tTEAd8VsqSJ8Sqxo7sUgp34xwhXlZPplpTERmuTVHVX63jdlltX+kiFFEobSQxJQ9EjtyRfVa4WNYOa+xm5U0IMaUTVjH4AvF1qiB+A55V5wcC7/37AmGFx9JX2A4iTvlz39PEWo5R4hVWXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384627; c=relaxed/simple;
	bh=U7OgVxi/pHtRieXBne3ptoBmNWxXdsMgD85e7uHkkwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqX8TfjwtbSspufYzC3EFmWr2Nc8yY7OuSez/6C895RKLk7OeG0ILACUhHrkFtfE+NeTwnHfNDMBxHITRYbojS0OiKu/cAudJ0zUxYeXgjY/2yXeu9R7Ki0SXZfbacEjVCkX3pnhew+/xlYrOeaZtK4fxeGIGoNsrUPclNeENdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYpRi5w2; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYpRi5w2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0B240217
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oI7YQac5-Srs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Sep 2024 17:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 612D3401B8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612D3401B8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aYpRi5w2
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 612D3401B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 17:30:25 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso3907118a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 03 Sep 2024 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725384624; x=1725989424; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xq08cW6/BlT4ZW8Fc9W5vNoCU0ZXbSqCDwV0Nd5Dp90=;
        b=aYpRi5w2Yy2sJbm68Br667tVsKOAKLhxTr1/2IypBhvLzlYaLHW72tyrfwErMniVBx
         pHk/LTmEYkhoeHmWHXmPUk294GUfn5JoqpwjBWft2csD3XODsa3LV+UzIdSM+VOtHqLd
         tnqbPW9u3Ygm2Zqp0Spc1M+IH2PmC74BAcbN8UfT2xKnhGq0S6mrpdwuhThye34PQJnb
         LCkbqXEDsuLN2w8tXp1IVv7eWsdDTL470sguSVD7VBPCua3vIHwMdJra7AvvFCMDSLuV
         cOTgdiUo8ai7YAZshDm00HcozX0GW9MQKZPnQNWzQh3BaawjiFB4ZvxfFz6jPzJqmD4z
         9Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725384624; x=1725989424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq08cW6/BlT4ZW8Fc9W5vNoCU0ZXbSqCDwV0Nd5Dp90=;
        b=pnBU1txy0ZpmFj8VB+yb4KvBPv527RH4Ac+IZJl/AAuDdN2VT4AIsSDiTWVjLng5/T
         nwAE7Wo6kNGnLN95zmtMssse37nXOyq7dYZD5js3lzpPJU6rdAv51Oajjbz0Q4lzmWNb
         kG6XWSxapqg9SMQhTEriOV89wouhOQyMoEcvCFuS7qX6FaNgojSlqyYBFx7evaatuCnE
         zVmNo0GaBwWx3EQNG+GiHqKeaouoGkDY4HvEO5q1hJXLJEhqE+QDI02Xsgv83aNyfSg4
         nR1rPMeX+ASrea/Gwb5yBN0eUmvqcblMGERVn7PDEPSoVmMKyeL1lsVyy6+ASzRcFiUb
         IhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe72JuwbQxl0GDLCIZqyLu2CF55tOf2Wg4snpCRJC4WtZJ6xSLBfrJEEC4mTVuW562vxauWdNAnp1PqOKrFbmBZCZ2QA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzhH1reEhwcCBWoZX3q09AKh1yCI01NeixWtRfbckSl1iat35Wd
	xzkbaJb8LLLl+pbrUflQdb+Ds0kV32sW2LdT4dGXJ+Vz3otvkJsi
X-Google-Smtp-Source: AGHT+IFlTE1TAIGJ7jQZn6Of9aSyW8eej73q05cpzIIbOcKFy+h7nv/o1+3+2HwdBeVpwYrTBE4w3g==
X-Received: by 2002:a17:90b:c12:b0:2d3:b49f:ace3 with SMTP id 98e67ed59e1d1-2d85638576dmr17939452a91.28.1725384624274;
        Tue, 03 Sep 2024 10:30:24 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8edadf788sm4086522a91.15.2024.09.03.10.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 10:30:23 -0700 (PDT)
Date: Tue, 3 Sep 2024 23:00:17 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, quic_jesszhan@quicinc.com,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
Message-ID: <ZtdHqXvwp/L9dZJ7@embed-PC.myguest.virtualbox.org>
References: <20240902170153.34512-1-abhishektamboli9@gmail.com>
 <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>

On Tue, Sep 03, 2024 at 11:17:37AM +0200, Javier Martinez Canillas wrote:
> Abhishek Tamboli <abhishektamboli9@gmail.com> writes:
> 
Hi Javier,
> 
> > Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
> > and hx83112a_disable function.

> IMO commit messages should explain why the change is needed and
> not just what the patch is changing (for this one can just look
> at the diffstat). 
Thanks for the feedback. I'll do the changes.

Regards,
Abhishek 
