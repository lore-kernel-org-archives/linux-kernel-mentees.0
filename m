Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510142FC35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eY2Zgu/M"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E427F81764
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 19:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E427F81764
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eY2Zgu/M
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ta1OqO3zZgey
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 19:37:47 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE618174D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 19:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE618174D
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so520468a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700941066; x=1701545866; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDIBxA9kD5zfBqSmoblE0Q36en0y2Rsc1kRyQf2RpvI=;
        b=eY2Zgu/MzwM2Web9QE5HkFzRZT5tKFqiIlPDgUIGhpI09nGI+0AhXnfUCMdTvcsbrj
         NGe/iij1ycWC4j+khczhOVxDrZCjd/EeCqrKWS2GuOWl9TKNDtkF/1bgde9VdCl1A319
         d+C6bxIn9xgmEr8lZ3Z2SfAcWxqe/FyzyyLpryFG5G3Y8l+609qx7vYDMzZWuFcb0deb
         HdfQsLXy5zeNPQswfbwuAIy1sCuQPq6nEIvZP2yT2ZRRLQrStw11bHsAjaWsdL0/dkSG
         YyTMgWBQt0Cspr5kjUdKipZvfwJT2KpPmGNJ+QLZjdFdnUOws74LbPc4QRi6ZeIy1/+/
         47kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700941066; x=1701545866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDIBxA9kD5zfBqSmoblE0Q36en0y2Rsc1kRyQf2RpvI=;
        b=woLHzmkJ2whJmu5eU66KOteRFHWW5tnLoTI7hikWUETIw1R2mTPe8kdICDpeiE1FT6
         ambqs1NS3CTcG83y+hc01XtvnPkfhvu0M//sza2X3rLiI5ZAzdAWpJMlBt6rDp4Tus/o
         oBIJo7rlpcx3W328offPQ1ZQMJgZjM9vG/33sbk8fqhlY0z+WWo2PhDME9o6/L+le+fs
         RGz6HM210N49hMIZ/EscQAwPROOcIf0luv/9YFiWNUe7P0iTCZ4uGEuy22efZ9Lc2vp5
         iiIUh5h8rhSC45/swdjfmGyGqsBD2N2E2S9AJK6s9Bhc0kjVZenFrkJR+NjEE4UxdCiK
         nQFw==
X-Gm-Message-State: AOJu0Yzw80FC15C2tEHtRUpVCEYZxu4NWwlE5FytOUvHzuZ4aFyye7Rx
	h3dBllmJbBL1o80MRRTF7Z1Q1+j1TbhrMA==
X-Google-Smtp-Source: AGHT+IENJDWPrj2AQtMqCZGty34ui9ZnqiqL7t6IzyBzgSeVGbG1NqW6Cf2dyMipIYQ2x4bWMQ504g==
X-Received: by 2002:a05:6a00:1514:b0:6cb:d24b:894c with SMTP id q20-20020a056a00151400b006cbd24b894cmr8555929pfu.2.1700941066463;
        Sat, 25 Nov 2023 11:37:46 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id x23-20020aa793b7000000b006cb638ba1aasm4610588pff.49.2023.11.25.11.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 11:37:46 -0800 (PST)
Message-ID: <af53864a-39df-4530-bf3f-5277be8f0d4d@gmail.com>
Date: Sun, 26 Nov 2023 01:07:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver : edac : Fix warning using plain integer as NULL
Content-Language: en-US
To: tony.luck@intel.com, qiuxu.zhuo@intel.com, bp@alien8.de,
 james.morse@arm.com, mchehab@kernel.org, rric@kernel.org
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 02:51, Abhinav Singh wrote:
> Sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to initialize  pointer to NULL using
> integer value 0.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   drivers/edac/i7core_edac.c |  2 +-
>   drivers/edac/sb_edac.c     | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
> index 23d25724bae4..08bf20c60111 100644
> --- a/drivers/edac/i7core_edac.c
> +++ b/drivers/edac/i7core_edac.c
> @@ -376,7 +376,7 @@ static const struct pci_id_table pci_dev_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_i7core_nehalem),
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_lynnfield),
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_i7core_westmere),
> -	{0,}			/* 0 terminated list. */
> +	{NULL,}			/* 0 terminated list. */
>   };
>   
>   /*
> diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
> index 0c779a0326b6..a3f50a66de33 100644
> --- a/drivers/edac/sb_edac.c
> +++ b/drivers/edac/sb_edac.c
> @@ -439,7 +439,7 @@ static const struct pci_id_descr pci_dev_descr_sbridge[] = {
>   
>   static const struct pci_id_table pci_dev_descr_sbridge_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_sbridge, ARRAY_SIZE(pci_dev_descr_sbridge), 1, SANDY_BRIDGE),
> -	{0,}			/* 0 terminated list. */
> +	{NULL,}			/* 0 terminated list. */
>   };
>   
>   /* This changes depending if 1HA or 2HA:
> @@ -505,7 +505,7 @@ static const struct pci_id_descr pci_dev_descr_ibridge[] = {
>   
>   static const struct pci_id_table pci_dev_descr_ibridge_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_ibridge, 12, 2, IVY_BRIDGE),
> -	{0,}			/* 0 terminated list. */
> +	{NULL,}			/* 0 terminated list. */
>   };
>   
>   /* Haswell support */
> @@ -576,7 +576,7 @@ static const struct pci_id_descr pci_dev_descr_haswell[] = {
>   
>   static const struct pci_id_table pci_dev_descr_haswell_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_haswell, 13, 2, HASWELL),
> -	{0,}			/* 0 terminated list. */
> +	{NULL,}			/* 0 terminated list. */
>   };
>   
>   /* Knight's Landing Support */
> @@ -620,7 +620,7 @@ static const struct pci_id_descr pci_dev_descr_knl[] = {
>   
>   static const struct pci_id_table pci_dev_descr_knl_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_knl, ARRAY_SIZE(pci_dev_descr_knl), 1, KNIGHTS_LANDING),
> -	{0,}
> +	{NULL,}
>   };
>   
>   /*
> @@ -686,7 +686,7 @@ static const struct pci_id_descr pci_dev_descr_broadwell[] = {
>   
>   static const struct pci_id_table pci_dev_descr_broadwell_table[] = {
>   	PCI_ID_TABLE_ENTRY(pci_dev_descr_broadwell, 10, 2, BROADWELL),
> -	{0,}			/* 0 terminated list. */
> +	{NULL,}			/* 0 terminated list. */
>   };
>   
>   
Hello maintainers, any reviews or comments

Thank You,
Abhinav Singh
