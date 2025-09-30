Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19331D8A10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759231482; cv=none; b=eTRohsP5QwXF+ucbOsxTrDmf7Kd7bMvwbHMsssrAlXcTJeJ3EZHIjxvYlfu5tkVxKqLnMem9mOGIC4M+TQGuLZITPrxu7jZxAU+AUVuNdoxy5407bQGQityAd4OFo77aQtFfHB1JGK50QfcXD7ZTlxYz6AaoYpgc8KCvYklcGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759231482; c=relaxed/simple;
	bh=McLKKmpBa2TKKlnDvojdUwo58ODZrtPh9Y4eo3Mbm4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvXMO7SRjK1rh7+giaHargv3ZXCmIGLLojYCIFSeF4ZfiTfy/0a0XRB1p3nv4ZflH2pYjnWfNyw/lG8kkWNX87VXI01FBtjCm6qfvsDZS2iYzmG6sLLZULUtwGssA/UkP+yDYdlFGOh5ZzaiSjPDHc5nrqWMGkTJyJVpHkhy3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu9zvXGS; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu9zvXGS"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8FF140554
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3F5GmYh2FMq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 11:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com; envelope-from=chandna.linuxkernel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B79CE40C6A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B79CE40C6A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tu9zvXGS
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B79CE40C6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:24:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-78100be28easo4278112b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759231479; x=1759836279; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcGQuEUQnVdF/22RJlSlt+esgnrR0a5zmnNfxStpUJQ=;
        b=Tu9zvXGSy+xxEI2LKHfA08ZXri15V+vaOPsrJ0kr0oTAC+2OeTc00Eq4o6MPsHhv9/
         B9CdJcMvYsqbNEZa+PPWpWu4ULFihHcGBEQknMRzP8MIzSB2CC9ElIFIRT9/WZvVljSk
         lSmQ1613teJ/slSD8fEIMpoArTFv8kJWDrprsc+boQQ0/0XlxlyG/PN1kFEDW6oYKy3D
         wagLptjXdu353io8fZgwXTxBfL8mkJ4KZ6VMdoaiX7WFLzOU/FtvXP6WKRHGeS6HCV3a
         YjhxKdg+zVMtkY6xOO5DpGY+hbdkskwcjeNYwnXGxxWR8qL04A+xfQ/4wVAOQEpk6DH7
         PI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759231479; x=1759836279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcGQuEUQnVdF/22RJlSlt+esgnrR0a5zmnNfxStpUJQ=;
        b=faeJkS6ue1ZMpLgbjXZztin8abFqdXZ/mLTaWkJE1t42HIfUk5FsMzwEARMHE0KX2W
         0H0D8t0ze2whXMUtVY69Ank1UZUmD5pY1Kvy7kdeCPRwOD2LCRMgIgeCNUdRYKadoASK
         0ussWNV5+5AvuOFrxy+/gRIzF7ZsAvVkpV8G1Qcr0hYsiyCDdyvcvqZd1z8301jJ58Jn
         I6Ur372wl//z517zxKhQt3sMdj12K3j/STucy+4WVMiU67/X4X56Ff+vmPAPo46xyst+
         rTSg36TQ4O9aiVPe3ZPqJT5JO7VOHT9HAmJWt8A05470mSu9a4ZSfb3qJOAwXu7+yGeX
         Lkcg==
X-Gm-Message-State: AOJu0YwibvycmKIz7lBGarKTKs8olkc2KGB9m51Yjy6LYSKsGVCK/KsT
	qFmo/hw/WwPiw0/t/1ycrtTi5elnqVLj6Spli3jPm2rpSsiOFCpCmXGn
X-Gm-Gg: ASbGnctJAhWgZoNlK2BA76qA1qY4/0ErMSfdmvo295+mb/cUjCX7o0jJrx0gYF2xtQN
	otya4VE9vmV7wzgQCJ3vSMRu5a57qwNSX3n8Xi6zPDT8P1dlJkslXO8oyrIFmif/+wusfW1fMk3
	/lvXZ+mX2FtpUrhwIv1bA0xOcca5yhcFqAEEkUoj4KasqpgDDPpu6RHg1Ps0mCX+zbx80N18Sn9
	X81+GHPtAQhfMvt+FapbSm5hQ6T9qUGTx7mhE9UPBUTCXc58SWNK4FwswPyfcLemLgLwt9gjUxT
	PyLEqsRUDr1aTHamVymM2dIz5Vq4VhyzAmesUCLtsuTfHhYDrDSSoDwmNl+dL7D8XBoBZOaAoZ3
	cKD0Hukpyij50Cz2AjgZPQiz5Ptcy0uN+rCfYnDzzhw8kqZ3+PznLMUYpDX2iRaOVn4SX7ZW5fS
	xCCGfuol29JX7FXSnECJnrqjAYUNtIFncj1p4tjIEGmrlQ97OYWbdeOk2Fh5B2KcAx0VxZ+a9kB
	mm80VYFRROKIhVG2EI=
X-Google-Smtp-Source: AGHT+IFDqnPa/1zDTD6Wd+s2onG39x7Rk4u8i0it6qX3DzbGdKbLGOV8gOjzjnbNj3vW72aEThf7qA==
X-Received: by 2002:a17:902:c409:b0:269:96db:939 with SMTP id d9443c01a7336-27ed4af3882mr243651845ad.58.1759231479002;
        Tue, 30 Sep 2025 04:24:39 -0700 (PDT)
Received: from ?IPV6:2405:201:5800:f002:bde4:9849:9e90:7db1? ([2405:201:5800:f002:bde4:9849:9e90:7db1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387372e9sm4122546a91.24.2025.09.30.04.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 04:24:38 -0700 (PDT)
Message-ID: <b0cdffc2-7db2-4aee-aca7-ddb068d5022a@gmail.com>
Date: Tue, 30 Sep 2025 16:54:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: atlantic: Use kmalloc_array to prevent overflow of
 dynamic size calculation
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 epomozov@marvell.com, irusskikh@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Sahil Chandna <chandna.linuxkernel@gmail.com>
In-Reply-To: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2025 16:49, Bhanu Seshu Kumar Valluri wrote:
> Use kmalloc_array to avoid potential overflow during dynamic size calculation
> inside kmalloc.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>   Note: Patch is tested for compilation.
>   drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
> index 5acb3e16b567..f445d449f80f 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
> @@ -182,7 +182,7 @@ static unsigned int aq_ptp_skb_buf_len(struct ptp_skb_ring *ring)
>   
>   static int aq_ptp_skb_ring_init(struct ptp_skb_ring *ring, unsigned int size)
>   {
> -	struct sk_buff **buff = kmalloc(sizeof(*buff) * size, GFP_KERNEL);
> +	struct sk_buff **buff = kmalloc_array(sizeof(*buff), size, GFP_KERNEL);
>   
Shouldn't this be kmalloc_array(size, sizeof(*buff), GFP_KERNEL); ?

>   	if (!buff)
>   		return -ENOMEM;

