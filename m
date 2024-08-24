Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278815E5B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724498517; cv=none; b=BmqCzhRPg9JrxCOz/nZT/CCK0wbrl413HwwjyYPgrI64qZyqRnlBZDeqoP/ZAikK7lb0xQYpDleXrEZi46N2/YUCW3ENLUlJSg9Li31ZFT56fR2KgmIWBnrA1l8HKXDVGXnfQOG3qBewcY6N/GdzQGnShiWcXdS0q1G4ePwbi7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724498517; c=relaxed/simple;
	bh=5zvM2KFJSLmf2j0o4lyODLjaUQNRb1ZGJX8epv/GGVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbUTEpo/ayYJbMFYD27C8tkwIv7X0zJ9s4VeDViLHkwXgxbuqwU1DzC3fiU01KHxM39f4vVV/z9UAMK5Ru3uCtdfzozdX1C3IF1wClASVbw/8ArXi0gCr9YmfAwZjdS5wnJwNBXBSBGdp7MJ6jpm1f/lRHlI+ATra6GbMQ49uFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxWXZaeA; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxWXZaeA"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7123281A6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8q4e0G2G4CoR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 11:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B74D81A65
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B74D81A65
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FxWXZaeA
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5B74D81A65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 11:21:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-533462b9428so4832689e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724498511; x=1725103311; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWtz5uoijD/6sdwyrDoZiDmd8tFNxLEA+zxzqd/1RmE=;
        b=FxWXZaeARdyeQ8nnS8k4F1APcmcPPlbF0s2S5r5IFySh5M5DS2dS8gctOgcK7tXbEB
         pdQakZgOu+JAS3lXk39wDT0pzPWbDuZWmFBBpGxYVuJqJb10kpupKAifsR4HvddYNUrF
         RYhbP+OIX6Ld4HHUySowMknLqEIfsYukWcBOifu9MQroiXS37u1wfnl8/UYiaYZwUpJh
         0fmqCxzKDBxtFXJ9FHvIE52J3xB6NxWjPcRlu/FnYZ8EdqBEsV3nn1PIyrJJRMoP7dOO
         YXSThwDDwaGNRRRrEN4Xme/2e3vzAVy4I1MwAZyGx/4VtUWh+tUszTsHjRVj098We1vV
         wUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724498511; x=1725103311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWtz5uoijD/6sdwyrDoZiDmd8tFNxLEA+zxzqd/1RmE=;
        b=KCaZfxaEb3nHthaxEor7T/T8yrAqO9TsP5AVI4BQsjpaOAySijDQ8VaUv9jN84wdrh
         +VVlqEe1SPpiNjhSgmAYAngMqbonHuCBsG91Qg7Z2XU/0WrytfH/y6D/rm/ndhaufSFb
         6L4ar85BfV1OqKR/0QDlaSxyXBCjOGWQ/DE5KN0Avt4D8LUYJlE7gup18HI5IQT5rGP/
         bKtZ1PzjvdJihVzVJOz2i7KeRkEdJlkEBHWJd0fIqebXg10yfND3y3rxRSbhv7u+9SOq
         dQDWNH5CjYiTb7y5I37VaZcDNz2Wsu5MvZtKMgzExFTwpdCGecj4YSH4znnG7XPGmgCR
         neig==
X-Forwarded-Encrypted: i=1; AJvYcCVdjNK4ccS8vR/Rdii14ZeKJVSBwW9u9/NddKQrBFVGgdwuAR6aL+g/Tml5oyibhtbMpDTTjB5BGTujyK3JaNNg3jweYw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzyGfFr6RmTTRs+hmxicvorYhJwiIoHIs4LPoiHC+bBpGg1Kbr9
	bHgSHQCDBduslvgmFusfP53OxFiHZRpB8ylkv2TdIaT7YxfxepG50RrHIPLA4h8=
X-Google-Smtp-Source: AGHT+IGtUfvB4kMQlCuoYKzAcwIUuuNFxDcBEeAyNnD4OTfW/GqzvO7likpmTQdheQWzjpKz07iUyw==
X-Received: by 2002:a05:6512:b86:b0:532:ec7d:9c67 with SMTP id 2adb3069b0e04-5343887e143mr4772670e87.47.1724498511343;
        Sat, 24 Aug 2024 04:21:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f48a9b6sm393560466b.179.2024.08.24.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:21:50 -0700 (PDT)
Date: Sat, 24 Aug 2024 14:21:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823153411.74142-1-abhishektamboli9@gmail.com>

On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..ec0c4c5bade7 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
>  };
> 
>  #define MAX_CUSTOM_LEN 64
> +#define MAX_PROTO_NAME_LEN 10
>  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  					   char *start, char *stop,
>  					   struct rtllib_network *network,
>  					   struct iw_request_info *info)
>  {
>  	char custom[MAX_CUSTOM_LEN];
> -	char proto_name[6];
> -	char *pname = proto_name;
> +	char proto_name[MAX_PROTO_NAME_LEN];

In the end I think we don't want to make this buffer larger.  But if we did
this define is really vague and slightly confusing.  I assumed it was something
else when I read it.  It hurts readability.  It would probably be better to just
leave it as 6 instead and add a comment.  /* Large enough to hold "N-24G" */

>  	char *p;
>  	struct iw_event iwe;
>  	int i, j;
> @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  	}
>  	/* Add the protocol name */
>  	iwe.cmd = SIOCGIWNAME;
> +	/* Initialise proto_name as an empty string*/

This comment doesn't add any information.  Every kernel developer knows what
memset() does.

> +	memset(proto_name, '\0', sizeof(proto_name));

Normally we would just say 0 instead of '\0'.  The other way to do this would
be to initialize it at the start:

	char proto_name[6] = "";

regards,
dan carpenter

