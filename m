Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE20515B999
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 19:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724182196; cv=none; b=DVrLNaP6Fk3dyG2tlgutqPLbyNg3ucxd7w/8btgc3v1vYtp5maeRqunTECQ/T4m9Kj32XFl3ACaCjKye67Df2t1MF5rlgoLgy7+Ew5I2+HlBJgZZVmqJ82zY+JsOEtS9dccudmve1rDm9PhF13ZWv0rxdruupOD+aHe8Jkxz93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724182196; c=relaxed/simple;
	bh=0DLiLPd13njmu78yKPrzi8MMekeL0FF9I892fb51s+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5LfCEafIip5q4DU4LBRnUNn8C3eC3AMIxTRH9JpvQvzWMN2jEq29H4cpny6zJAl0RjGpm/sDHwSO2+vg+k6w+1OMwLtophmO+EJ9AhLzd/icmbpnxebLZQtOdzfQMn03TcDKG3UaGSav8BCJdfolIdRqh4pfQR+G5kA0e6F0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAiISaeD; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAiISaeD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5270A406D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-IwXQDdxh_S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Aug 2024 19:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CDBD406D2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CDBD406D2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TAiISaeD
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3CDBD406D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 19:29:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a7a94478a4eso5928866b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724182191; x=1724786991; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtG5Lka0HNtdGpA1EeQQSE6lBWCGpDbes0Ags1zb6dM=;
        b=TAiISaeDhRjwO8sYBO1FOMKH88o5Hp5GhGQ551xipd7WbeTBdvMRfb5u83lQZ+Lo+d
         kqrOL0Jlp0JdTUkr+8ZXogDntW5+FiLhi7aEyQOR6E9LAyoL5FsxuzHwrQ9VpL0FYIpV
         Ak3HjNRkl8qaEZyhWEC2GDGu1iEoneTgloYM3rduxbQx/+8ApPKCiV1WZHb7jp/cFqOw
         j/aPenknTPZRUoMVo0lM4y2VqUI68UPfiPmE/PjQpX54EwyK0p6uJjUrmz3i3tSEIrh/
         /FYYlFeKgQrVx3DRG0b6+y2s4GSjZ4EPdiprGtp4bKqwPrgrzCUWYVsW0sydQzcawzpA
         k+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724182191; x=1724786991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtG5Lka0HNtdGpA1EeQQSE6lBWCGpDbes0Ags1zb6dM=;
        b=BZeQ34vwcS9WdRD7OTJKhp8x7Fjq0HyiMRiavPyOpnxkdwO6bkN0ofk2GB/0fG5zkq
         QqHRzAInzR6dMrF2MOFCw/h6iFq7fSP/gVIT+sswEc7HF1NN2WITY3HAWA8n1ux4azhv
         LCTXJ7FbENHGN7aNB39fEFshPrIAqC9L3Z5C0S0TGra0UmumL62TFh2cKsmK32h+XmR0
         Tj06hsTFKT9KWzFOi4atjbJgxCUHTrpLbBubL6pNftn1/3ybuhqMeNz7J1ZERt/qXTg/
         MmOyhPAw0AYsVOjQRge7bux74SnfrQlCHATNSTHWwYVyZbpuVHWYDffuTHKRukezp/Sq
         /wSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWUol8VR5C9GRidbuA5IDZEX0LzcMs//1LNmfO7a3lkwM9t59eZeEtQV1/5bHWhuGI5E+fSULLh8wqQ3pqbNlNZ+aBKA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy3xtFwkUesIdRz4e0hYyozuaQwm9v/FiawwR7JN9MYqqzjVVKe
	hf5lc0FnyHrKAzfK2cowpBDn2FVMuC4J2MqgKIbvDImZh3m+YCMhemXeamcBY44=
X-Google-Smtp-Source: AGHT+IETXPjrBHvfjZmAs+zAO1dDalx5QNb/07TUykr+gTYgm5eDKM8K4jqdR+hbv+4h3jvEnLjvGg==
X-Received: by 2002:a17:907:3e8d:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a8643fd93a2mr445202966b.25.1724182191308;
        Tue, 20 Aug 2024 12:29:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c67d3sm798852766b.1.2024.08.20.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 12:29:50 -0700 (PDT)
Date: Tue, 20 Aug 2024 22:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820184216.45390-1-abhishektamboli9@gmail.com>

On Wed, Aug 21, 2024 at 12:12:16AM +0530, Abhishek Tamboli wrote:
> Replace strcpy() with strscpy() in rtl819x_translate_scan() 
> function to ensure buffer safety.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..970b7fcb3f7e 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  	iwe.cmd = SIOCGIWNAME;
>  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
>  		if (network->mode & BIT(i)) {
> -			strcpy(pname, rtllib_modes[i]);
> +			strscpy(pname, rtllib_modes[i], sizeof(pname));
                                                               ^^^^^
pname is a pointer, not an array, so this doesn't work.

>  			pname += strlen(rtllib_modes[i]);
                        ^^^^^^^^
pname is incremented here.

What this loop is doing is that it's going through all the network modes and
adding to the string.  You should look at the rtllib_modes[] array and ensure
that if we printed every string it would fit into pname.  (Currently that is not
the case.  Probably not all network modes are possible.  But I have looked at
this code and I'm saying that we should just ensure that we could handle it if
they were all possible).

Feel free to re-format the code how ever you want to make that happen.

regards,
dan carpenter

