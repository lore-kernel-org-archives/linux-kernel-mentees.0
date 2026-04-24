Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1633F580
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009687; cv=none; b=YqoyR8UlDPoGLznNOfkvT+U4WW+5+HkedSwHvptizP5oHaS+WnxxGpM0veVvV+N/29TR+njOMfyiyzrNdMWzuv2Hu8h+oBtNPpIRDGdtY+4fHk1/1xdI0rrWUX+xs2UrCeDt3h1bxKg4ly4Ef6t5xukmvdz4shUeMj1i+IgPG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009687; c=relaxed/simple;
	bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0f6NvuaoD1z2LKs1/XIc5Ubi4N6aVT25kQY4izFBw+LOgQ8QONpsAdV8Qrc+YI2IeRjIlChyuO8105kfHPbiQG/jgemtDfKzW/vSWZ3nTBOQ/yZo1CJdoUPW7gMrB+Lvtg2VhzYZQntx37gtUVSY9TcwWyHqU5cq6oNVe6iepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KV0tgKz/; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KV0tgKz/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66FAF42206
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 05:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Tnsh7a4tizW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 05:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C442942205
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C442942205
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KV0tgKz/
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C442942205
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 05:48:05 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so3433503b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009685; x=1777614485; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=KV0tgKz/whP3mwPvQ8ygKDzpXe9ldwcDKSRF0E5xuBhZnzLVoIWiHqGf4z8HV5DG4M
         yN8VrdRcK6NXLLNJXN7FAZrZmhOeDLMR+mMhum5NXdnuxl8fKr6r/TopHO0WCVhFKtP+
         /87MVbxLvMFq5ymMXUQVlLjbi5Qfqe2aBKXsQ7GRUJfIpVZb58lY0kXM48IIfqspEzD6
         y4iVy/daXTxe89LYwtJfw8aOHuHMQ9HdWxv0JMeS8HQGPj/DKHTerznLUriCfY6yQLDB
         SmlTetHffTYLFqMxOvbyJ9yi9hCdoguMeY6vICD6eQS3iYdy/WZN2feBHdozX2CZB5pE
         NT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009685; x=1777614485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=oiV3IW7lGql9cF31AcUtV+bydSS2kxb0NC8emuFpiL0+2w36kEWDaBktNNkFgFBvqU
         u3OOzwlpy4DTGCPJJdvUk5+waunF3mmrN5q92RSvB3AVuhOpSSZNotlXF0bh5j3GtTvP
         eMgEhB/D7fqQPDVWKqbK5vaGD+S0ztV0J3+wSEC5sm8fbt/yDPiD0agx5NiHmasR3tJJ
         E0ws3jh9/ZKK42Jjg3XrQCp/gDhG+gHqtGRoHPaFslbkRWTRedSb3qIZNj7rY8B+3kj+
         kCPpRlk/6TD/1220SG3c8LFGiqzcMOAEQp+AbpOuTaboNMrE/oVRJJ1ta1pctmTB6Z7a
         V+Pw==
X-Forwarded-Encrypted: i=1; AFNElJ97n9ebc5pqX0T81qpz2BQMKYtVONiE/YTCHjswYmcLvgn3W5qRAsD4nfmXYhGGXXpRMbeN7zGVxZxxUNLcEJCyDg3LAw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyOzsbSbipvCA3kGszEhpkTtzqkrFKZcdOUzCsZZvNvL1O/IjK5
	x7sS4FLjmw5G5F5+fcx4d9GyUOGFoVB1iNZ3RkLglwB7+QXBMM4Roa8P
X-Gm-Gg: AeBDiet0Yvq51YtFi2n1SMbM9eaAosa1lnClkle51UyAXerQKPFwc9ZCL2TnuHwex2Y
	S7sDi50ShCUUcOsQxarB11YErIb21E43CodqPhf1nZ1wiCFklteYmkJ5cwYzI0/SfJTwxbX8ppk
	buCFohuqnAya3QAH6PCwXfqutUD2Lr/lBzn7Wo4TAXymLJRU70yl50nKuvyevQOwXbgno+Ez1bC
	m+GyiIDBgWLw7JdUCm2JSGLhDFHQ3C+iE+mcJi8unVuAGKYeSNkBl+x3UrYL11Di1Ov3GETAtgl
	ymsEseTqhLASslHBiJ8O/YE2mNW2Le2yurmg4YVFAde29faZ/GboWJq4+PkYjRYLs5EunIbqB7E
	qIu5x41zijoUMHiB+qR/ui7RThFBlJooRnaeKjOzdy89pG3dZ48eJ8m4xGL0Urub8S3bm3SXaV0
	AD2NTIXwrOvQ7QMtso5cCej3K7T7RFkQa+MFwm
X-Received: by 2002:a05:6a00:3cca:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f8c40ae88mr31344043b3a.0.1777009684887;
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm24070785b3a.17.2026.04.23.22.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:47:58 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aesEDiGBZiScCb0D@soyboi>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
 <aenHeWS4y8iLkMAn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aenHeWS4y8iLkMAn@stanley.mountain>

Hello Dan,

On Thu, Apr 23, 2026 at 10:17:13AM +0300, Dan Carpenter wrote:
> On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
> >
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> >
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
>
> You need a Fixes tag.

Oh I didn't know that we need to add Fixes tag too. Alright, I will add
Fixes tag in the next iteration of the patch.

Thank you for the feedback.

Best regards,
Robertus Diawan Chris
