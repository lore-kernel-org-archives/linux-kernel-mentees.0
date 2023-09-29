Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBBBE743EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 07:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F121611AB;
	Fri, 29 Sep 2023 07:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F121611AB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KrTtOPte
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5bOaEOoiS-v; Fri, 29 Sep 2023 07:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D0A4C61159;
	Fri, 29 Sep 2023 07:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A4C61159
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B54A3C0039;
	Fri, 29 Sep 2023 07:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA672C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C3341861
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C3341861
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=KrTtOPte
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yz_AL6iMRLrm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:14:57 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC5574155F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC5574155F
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so1838968366b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695971695; x=1696576495;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V2OkkCi3457fhrun/Ka7gKdk+nLLGHEIhC9CyvKi8oA=;
 b=KrTtOPteX9M0+20rDX080autHVxT3tsDOoZKvxLiYGKZ8TRUMNFANeekKd5Ig1+oOl
 aes9oFM1eWsMZE/nFRMxdx8KG88Iv4I1U7Iud6H/F/HOEmvQ4cmnISugSZIuUY4EdT7N
 Qg5q61NXlDWcnSEtrye5CDObV5+tZZFu7ducLbP94xCnNM86aExDOZWJR47Yox1rKSlS
 K+N63YGzL1pRhA41oHHTmmvlw1t9Pyrp7JtjhHrSQYB0rBwJAuhuEYg18QoU+O7lc9N/
 NcehYJdH/spkoV74lWAPjbHokgJmHFJb7SaapZQAMgTTcL2O6oKJEi9qhvmIqumKajT/
 kqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695971695; x=1696576495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2OkkCi3457fhrun/Ka7gKdk+nLLGHEIhC9CyvKi8oA=;
 b=tP3ujI1QBg+pZye0C49lYJSLXxVYrFAi1P5ykWFaV0pAb24bWgvlmbCnh6lEkdxU8E
 sE2XqEG2l9DPLDxwSD5DqRcfAjWKU62kCB52w0WassH1xPc9IkfW5ThdxelohAZ4c5RN
 PEjq19TvJUWsQyH2r2ve2WFn+YKBVIRDJAgez5vGIK6fIkrV2ukSUekPlkwPASoAV4It
 001uZGMUkcm1/3DceIYqpH2TlMnStlA14/x0uwl9KK9CNcuRh/0ycRvrWpE5Jxa1EvKV
 WHwkpe91RM6Zm629LuWqGlLKjT2ylFbXtBYfwtiBVNzmxJv2DFf0QLcF4AysKapp0bIy
 6dEQ==
X-Gm-Message-State: AOJu0YyuzNgVdlVWR+dXnJeRR0EnKM4bV8TaLM0Rz6x8kzmzvEugsRNZ
 cZZlrzdp/YtWxMEPt5jXQinw7w==
X-Google-Smtp-Source: AGHT+IGZ/E7+G4cnfaB8C0RTqz4HpzEQLdCBnqk+eAgNYK3UAcdw1uetqgquWBvnEbokDk1wX/u06w==
X-Received: by 2002:a17:906:28e:b0:9ae:552a:3d3f with SMTP id
 14-20020a170906028e00b009ae552a3d3fmr3026696ejf.28.1695971695031; 
 Fri, 29 Sep 2023 00:14:55 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b004065d67c3c9sm709048wmq.8.2023.09.29.00.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:14:54 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:14:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] gfs2: Set error on error path
Message-ID: <72de9c2e-7c60-4930-acfb-556a1f0fa4c4@kadam.mountain>
References: <ZRZrUMzweaJeEJuD@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRZrUMzweaJeEJuD@runicha.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, Bob Peterson <rpeterso@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <error27@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Sep 29, 2023 at 11:44:40AM +0530, Deepak R Varma wrote:
> Set the error variable inside the error path on failure. Saves
> unnecessary variable assignment during normal execution.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  fs/gfs2/bmap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index ef7017fb6951..93bd8ea34444 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -162,9 +162,10 @@ int gfs2_unstuff_dinode(struct gfs2_inode *ip)
>  
>  	down_write(&ip->i_rw_mutex);
>  	page = grab_cache_page(inode->i_mapping, 0);
> -	error = -ENOMEM;
> -	if (!page)
> +	if (!page) {
> +		error = -ENOMEM;
>  		goto out;
> +	}

It used to be that the other way was faster?  I'm pretty sure the
compiler can figure it out these days.  Please don't randomly start
changing people's prefered style unless it's drivers/staging/ code.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
