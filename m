Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A41187336
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278095; cv=none; b=fKUFV+lirHqFti2YliuwI2z/ZyLA5a0xompm5fiMLnHSIsCRSsNsue7/UI4DAxrucZTV8CDHQJry/r68JDS8DF1dhHcbuAogeof6MH6vT6wLoqR2k5GPi6Ytvx5g69uCcpmvc2JntX8XBDrstT/0rEGFmjAZhxA3dCPSom13XDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278095; c=relaxed/simple;
	bh=c/mwNpz4IjBPv3QCDjMFypfQNm0qufjOWYAErXQm1sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moci7c8l3CbiVmp60m1D+kiimUV0oty3j6/Z7uDnx0nzHMEd0FuvjmBMjr/R+gTbIwRm63RnYAZ/c5v9JEyHrcspfUO9g1tZXbEVzvxqpkNfKX8Bfmj5CanSUalezXEZQ+rI3HKhFTIZURqWyzZEslTsBmpiDzj5oKD7tgqBFeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JbUvLXkC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JbUvLXkC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAAE4017C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwBX2phdIY1P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 18:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09ADE4015D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09ADE4015D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=JbUvLXkC
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 09ADE4015D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:34:51 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5d5f398a955so667904eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722278091; x=1722882891; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imNjbcelp3B6lXsHYN7XqqAWMw2+xVAXpWIJw514jNs=;
        b=JbUvLXkCxp/cNkoZr6Mo1vMwCfygIs46vVgcYvILILPAu1zBNlUH3phA0vcwiuwSVx
         5YEjOuIPFSxzJ4kZD3uHjmvie/1Kho8ydL/aia5DT5dyCZdva/VLjFuFxqjDzrrhaojG
         cVLHuYfjDqVLqSlLAduf8/sZpPSkZDspGacdvllJDC/sUL5nTwnQ7FG5prbbyKWcOS8n
         dfSIAvJVRMEzvD3rwXmCgk6KyLDzZtxn5065unpM/3H566EiwbqzrOt9ba+VFXCo5S19
         IBKWYcQG2AIWU2NNQHHMT3+HQItn5/5N9PsfKAOjhf764Ks7+bI185mpb1RbEKxprfBA
         8XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278091; x=1722882891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imNjbcelp3B6lXsHYN7XqqAWMw2+xVAXpWIJw514jNs=;
        b=NZc0tYLvFlI8VjVOC9a4+8ZqCG2lXbrzVLaiVVD2iCzdlHYImVySWdo8vXSht2G+XO
         S1NHpRXnnk6qo5SRfMcwhzdFxvDpXYJs9Sjg5TcJSDXR0JFWs4sWKJ6iYwQHnR6ZtLK2
         K/hs8CtR8ZJzkb6d0QZBClF5k/FEVfgw8KqWx+pdl411vRXJjYenDUGJrlxuLe9lzzRu
         BEVYnrK+usYaxKVJhhLI/oDAA8grJP74+8x0I45oY6EGGL8bN1qNHKG4PdPE734eFGir
         koNBZa+wHqAaBKUs4a1xQV9sis4d8cXOTcCYl+eL/vcPR5IrOTHKBHtjPai9RKbOstgw
         VWNg==
X-Forwarded-Encrypted: i=1; AJvYcCXK+yf9e1198xZV1qYaTk8GnQPdkYLLalt8Q1TqIWANzhxYW6VqOgak8RF9Pd1l9F6Ojzru3c6eCAmvzBNIhSFfS10ArZrt7zDN0Hx22g6n8HxfYxg5F3r8dI2yNpbk
X-Gm-Message-State: AOJu0YwmTE1gQDFlahow2K8U/7qqqdSR3avURb93x8EcS7sxskrikww6
	KDbFMeKCOz3Plx/E8deiCiOl1yz7CKYmdtQAYcKMWqsOoE8wH/v0E89eJCgdig==
X-Google-Smtp-Source: AGHT+IHDvNtdaAkP2OQ2xtY4UQLx6a1DPFIKYg0qRReFTzv6WHCfzOj611JnSF7iRNyfCz8VicFWDQ==
X-Received: by 2002:a05:6358:e924:b0:19e:fa9c:5ec9 with SMTP id e5c5f4694b2df-1adc0665bfdmr914934655d.9.1722278090607;
        Mon, 29 Jul 2024 11:34:50 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f8fb75esm55530016d6.37.2024.07.29.11.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:34:50 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:34:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <040f84a0-f299-4165-b261-636f8c9c2060@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729182348.451436-1-abhishektamboli9@gmail.com>

On Mon, Jul 29, 2024 at 11:53:48PM +0530, Abhishek Tamboli wrote:
> Change bl_len from u16 to u32 to accommodate the necessary bit shifts.
> 
> Fix the following smatch warnings:
> 
> drivers/usb/storage/ene_ub6250.c:1509 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 24
> drivers/usb/storage/ene_ub6250.c:1510 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 16
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/usb/storage/ene_ub6250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index 97c66c0d91f4..ab6718dc874f 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -1484,7 +1484,7 @@ static int ms_scsi_mode_sense(struct us_data *us, struct scsi_cmnd *srb)
>  static int ms_scsi_read_capacity(struct us_data *us, struct scsi_cmnd *srb)
>  {
>  	u32   bl_num;
> -	u16    bl_len;
> +	u32    bl_len;
>  	unsigned int offset = 0;
>  	unsigned char    buf[8];
>  	struct scatterlist *sg = NULL;

Acked-by: Alan Stern <stern@rowland.harvard.edu>
