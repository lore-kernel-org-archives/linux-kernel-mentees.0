Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE221109
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711369740; cv=none; b=Q11MJwfRGcx981uGwulFCjhkhGZOZXQRwZPJAAiQnZl0nsC77nOVJjK5KJQ1bQrdkbTvGTNag50ckcqO74X3sAEmLIYRD5djH41iHbrX6HRP1/f38zdEhwQ0LAfNeQU6vOZ8KYu53ZCSvSZOhBCt5K6zAFrmdWpC5Q4geGkpj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711369740; c=relaxed/simple;
	bh=4aRjekFogW63NJ/saTB+Ui/q79quDnGwh6aOvA8UlGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGmgQ/a/xkTK5970R4jz19X94pTDQ1jjS3QzTTIsVCWwRXKskmPWlMv3mK4i4uBNFbV62v5Mfrqkm65v4wbovUByzu5AbkQAUl/VfkbVoZtStVUjJBcVTIqA6uyfKb39XL2Eb+DHbmwHzdBNEL0cYILWYsk+rh646ISznz/ZIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwx/5GKj; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwx/5GKj"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9086381272
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 12:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9FklCbejln6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Mar 2024 12:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 951808126D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951808126D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pwx/5GKj
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 951808126D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 12:28:57 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a4749eecff7so176719066b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 25 Mar 2024 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711369735; x=1711974535; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5iWcf+JZDsLUFR0I0zIhJdqU2WN9xV+AKxo3kNhvLA=;
        b=pwx/5GKjmYVc1R7ov1L35cTpY31Km5cYVv0IyO1cqhJ4RwxwXJtqvu5tiNfSlUDXyR
         VGgQfQULwlyD6IuMwzVBqbaxBNM6PiSmCSPM3ew0DOPC17zYzpeYZ4kuX6TfRdi8CC6g
         jKr+pNzG7pKlyeD35bwWWv92pUZCuSguqPKjpSk++6W8ysBRk3PHpM5YDgiUMfdEPHyC
         LOyWIWZFnHRloSRgsqLJXRr3lKG161j2XklhxCOHw6cCiHJGmBMFY0uENJ2vQfgX8lRJ
         l5Mj0mWSDGwN0+ssLFfdR4zmLJcFOi97g6ilmx6jDzE8WCO8qjpb78TqD/yKY0kTaJIy
         U2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711369735; x=1711974535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5iWcf+JZDsLUFR0I0zIhJdqU2WN9xV+AKxo3kNhvLA=;
        b=Xh1URh+kuVPTCvjfo5TyruI/BG8MjLsSLHPXXIGLexnO56KrMENfC2K7aQNiW3T2Im
         0Wp2xFuq+R559yU+XfmneSHj4fHPI2mxDgvdScR3+hU5jqmhppzVbQYgoGm/LaRUOPDG
         XN2Fmr4t/N7uZrlTUdgGoFx1Oi42RpE6a2iyTucnxbkwlKna/CT6eLLYl1CNZW9ldpDB
         1lNdeP5a/X08ktBj3EXu6RBQEdcsYNW3q/FBUDbn+/yxGljNphAu9CKXLLMADM/yYewA
         ZLPpbCKc/M9QfZ/3pihtdDcB/EBbeoymtM7SflGPT6ovNgbVlKLO5EK8kxVulAHoXY2N
         Bu/g==
X-Forwarded-Encrypted: i=1; AJvYcCXLFHGTwaWEqstC8P+AHNW+azDoNBrB5pGG7w9w1fzzwB3OniDpWW7/Lp8IkRxK7VZp+yeUR0cOQyA32S2CqWsJnZCnsH63LH5/ZPdZJu9aGFDkr5Vd6MLMcUiCinKJ
X-Gm-Message-State: AOJu0YwQuVmm3YqvuHlN3X1SbjCOJQOPvuWYtM6Kiz0HBxWuDfi5q2MU
	iGV5qGqUBfkYWEp3cjUnBMu/2UC0FS7j17bUbw41S54W5u/OxoTcCS75CpZVtgY=
X-Google-Smtp-Source: AGHT+IFkj0j2GhlW2pPV439N3QcOLRTQjACpF7mNQ6hJa8q6n1DRrMckbturzaEhq4tBC0AGpYFO0w==
X-Received: by 2002:a17:907:6d0b:b0:a49:7078:582a with SMTP id sa11-20020a1709076d0b00b00a497078582amr2657317ejc.35.1711369735408;
        Mon, 25 Mar 2024 05:28:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906504a00b00a4735e440e1sm2994822ejk.97.2024.03.25.05.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 05:28:54 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:28:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: coolrrsh@gmail.com
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] staging: media: remove duplicates
Message-ID: <f11e0f7d-3521-4f6b-b38f-2e6f3cc59674@moroto.mountain>
References: <20240325033427.4708-1-coolrrsh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325033427.4708-1-coolrrsh@gmail.com>

On Mon, Mar 25, 2024 at 09:04:27AM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> The kernel configuration VIDEO_DEV is defined twice in Kconfig.
> Thus, the redundant code is removed.
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> ---
> v1->v2
> modified the subject and commit message
           ^^^^^^^^^^^
You forgot to modify the subject.

regards,
dan carpenter

