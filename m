Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131F314B8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003430; cv=none; b=giCJayCtgJgTO2+Ojpg0sJoE/sFYR7ZDpBtlTM1Nz/NLc3rmn84RD28BdxRWbozILrbPSXMwQDmjW4qjI/OkuWcF2oNumHSHoTk8GCeOvhkOo6bXUcc9hHJTnlBvZvDET84nEh8tyMxNdyZ8y8Ou8i18KJbcuxnmzgF4jVTfiPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003430; c=relaxed/simple;
	bh=PfQ4/7NQzFSfsv0ka8gSJEka3ONlJOdaGwYNL1BLIPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3tavnzP/ROalwfpSPmh2XUh5YwdDENAdnLcF5kYqFgrgIFq6Ajvj91Zd4Kzcp3FYTR1O3f8w4i7z9Lnbv4K8FvrcEIiTrCVnkdw4MT+skG+K5BhWvUaYnwWgLmfB5jfFNzhEku1oIJB3o1Jl1HrvNkalOUAed4DGjJVKVKrhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+f/MeOF; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+f/MeOF"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7BE40F62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RkZKRpE9O_U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Nov 2025 16:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2668540F61
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2668540F61
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l+f/MeOF
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2668540F61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:57:08 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so5562532b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003427; x=1764608227; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUogX7WY7Vd//7PtUJR23B9zmXu2YytI3dxf/G/KQjw=;
        b=l+f/MeOFZ0HPumtbxxJdtf4s6QS0UqhFyzQRo0tn5zbtbRbntpVRLjFFOD+rupau65
         Z0wksc7bz6wD2DuXuOa4QfXkajBIJwKYHfs5uVnCgeKcv/trK6pCJdTZpx7sYAxUZJsW
         0qlq+oShzbOqmU4rxKH2bEZpJ9jGB72AZLg7UqcqeszOjSydtjZsmOczG4O+0DhNHzfx
         YP+C1uP3GVdhGZaF1Efgf4tjM5ny0JLdF7tpOnRE2VlNOV2nBvVtDN+Sa03bOge6T4IB
         GXuflDoU36DaN29Iqr49mGnMhNYhY1fjJOkXn6GEUevW467VBSigbqkMYJCVa5bulycu
         hvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003427; x=1764608227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUogX7WY7Vd//7PtUJR23B9zmXu2YytI3dxf/G/KQjw=;
        b=J7SSgNdTX2W5reHLmAg0IKdQQN6G+zZJv1yPYJU4j5yc896hGXh6i8zZywLHRDXbDv
         6fzwOxr3YnC7gJtwwhB1BykG4mqZJtcSzxqeVRW9Vl2iPFErYScJgp3j4rGfmJaTvmTZ
         i0qtDFA+RLPK1qrHpEJr8k8H9UqvhDewsxdDKFecjXbNXJTiW+UaNlt9CenXMV9CaU0N
         Gsod0EEa1SOwdgSD79lFcrACQzwkfcVg4DUAgbw1uyDiyqP9x9/FPV8OSjauni1ur2V+
         +yJ57d209boEtfI+jImFKLTKzl+y3AkEwllo8iSMW3LCJR+ER4DnVFRqpdAH7y7v56s5
         Y8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFHX/VQh4wHKaNeWogqUB4jmBKMARwh9692WGuJzB4uyCXAhc0FPBseDi6o3dBVnEAyXcwpeRUszr5n/fl0JGOqZpfVw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyt/EDCsNVf4MNRd5VuFAHw9wlQq/T8AmBQCE9e8T/SNpM6iJJy
	CdwTp+ZZGyYTEd0IRSHZztDyFqsEn95xgxAMRWTFGJEQqrT71dmOAQda
X-Gm-Gg: ASbGnculsp9oHh7SvQhxFhyOI0ejsMJBIUYARdLiGDXzZA/ofl6bJgYdeQpGngoQMYz
	KwUEDkMFcAM9FKsHiVagt3fOnFBRXVV90TsltUgLnTyLbO1Q7qfjfqIxn/1/+1tEJ2s0bd6avNB
	PZsB/Sd8LLvq2qlX3H7WUJv9QCgsN6MpdihVl1hPzkfcX33Jd2/SljEbP6icFrF2faloaIzbLJI
	1dJJKJ0S6PTifPR4Lis6/dM5kOtsEJyEYiABGxdytpOXm4xmxMX3EwLV4qMb1cEuqsfaZsdj+R3
	4u+9II6r9bZBLHn47el+YdoZ6Ep9/m1TIv5oxwr7fPwFecfujyz6H6XuAI4ArgAZ3Pt3YgzEd1S
	LeVhtzUzW7qqUbjA6q1UPVXolN+DviGw1cdbNz5mSaTDGIH2Qm6Q9UUrf3awHVXhYq6bHUNMeD8
	YeqdHK2x9KfzDztefNcWcFh6bLkCuCm4HWpJ0=
X-Google-Smtp-Source: AGHT+IH4bMrzvbSCDAu0Nr2SVYvmh9S6c4NfxteJlssoS6WoKkg6ffShHh1gjfGea3W559MOrwbA5w==
X-Received: by 2002:a05:6a20:12c2:b0:341:5d9f:8007 with SMTP id adf61e73a8af0-3614eea27aamr14043297637.57.1764003427338;
        Mon, 24 Nov 2025 08:57:07 -0800 (PST)
Received: from [10.0.2.15] ([152.57.124.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd760fafe57sm13738935a12.33.2025.11.24.08.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:57:06 -0800 (PST)
Message-ID: <2e697dfc-2575-469c-9ba2-4470db34b5d1@gmail.com>
Date: Mon, 24 Nov 2025 22:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: Prefer kmalloc_array over kmalloc involving
 dynamic size calculations
To: Don Brace <don.brace@microchip.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: storagedev@microchip.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, cassel@kernel.org
References: <20251007065345.8853-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251007065345.8853-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/25 12:23, Bhanu Seshu Kumar Valluri wrote:
> As a best practice use kmalloc_array to safely calculate dynamic object
> sizes without overflow.
> 
> Acked-by: Don Brace <don.brace@microchip.com>
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Note: The patch is tested for compilation.
>  Change log:
>  v1->v2:
>   Updated commit message to refelect correct intention of the patch to 
>   address James Bottomley review in v1.
>   v1 Link : https://lore.kernel.org/all/20251001113935.52596-1-bhanuseshukumar@gmail.com/
>  drivers/scsi/smartpqi/smartpqi_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
> index 03c97e60d36f..19b0075eb256 100644
> --- a/drivers/scsi/smartpqi/smartpqi_init.c
> +++ b/drivers/scsi/smartpqi/smartpqi_init.c
> @@ -8936,7 +8936,7 @@ static int pqi_host_alloc_mem(struct pqi_ctrl_info *ctrl_info,
>  	if (sg_count == 0 || sg_count > PQI_HOST_MAX_SG_DESCRIPTORS)
>  		goto out;
>  
> -	host_memory_descriptor->host_chunk_virt_address = kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
> +	host_memory_descriptor->host_chunk_virt_address = kmalloc_array(sg_count, sizeof(void *), GFP_KERNEL);
>  	if (!host_memory_descriptor->host_chunk_virt_address)
>  		goto out;
>  

Hi,

I just wanted to check if you had a chance to review it or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri
