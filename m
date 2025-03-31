Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC211E5B8A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 31 Mar 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424471; cv=none; b=Ny2KeSAvlhXDMuCBd4FMfiiCKnOSwARInkUALKojoqqT10DQh62VtXGKQ+riCO7EsM9OKuMjTXk8UeANtuExmDTxT1Ugu4kJpanHtCswfzvxhlzifAs2YLM9AYiIF0at1SWgzoq02RygfYDOS+LZQvrwyjiIsootMZVwzNJiFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424471; c=relaxed/simple;
	bh=hgubZ8v5IYMlWlWz7IWc4ZP/Fpz45adatWKCfG7bouM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKJaauVwht/7AcMGhJjz1cCqq2WpwCm7KYCO/7OZ/XE1Du52Sk9pb2P7yi+/DWGt3QM5dlmnf3wtfh23VK+79B5B3QX08F/zYa0HETmWXVZU7zAvg+FaWrnhbvGh0IoEYIqNsz28vA8WS7sconNFN3M3H77MHP/Dtw/UFop5cu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1y2SuqH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1y2SuqH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2191138f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 31 Mar 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743424467; x=1744029267; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
        b=P1y2SuqHxOmMiXJvdoYUcukWReR2/PzOhtvuDcbIGcKgGMCGoHDvb8ts1NJXteMH2A
         N8ovm/i6LfP/MV7IqGIjOMuVIMJCSulyaO2L7Thg+wFgjHltaV3hpEyN071IUfNTvyWw
         RXm2X1CnvTOv3AqoDinPVnMqIk5kIUpvK2ctMBDXXqtilB3RG29PDqvuRZOvh97y25dP
         HNS8MFQxmXmRclcb0BAZfiPMS12lpJNm/3lC+6C0wsknGIO68xOJHCt6Isc0iCj5clKG
         ZSHu2KSYqi9+KCdOeh2qQ6p1SOHHQ8xVncrU3lCq0XnPhZhwWeLnpWoJrLOuYMA1ozbN
         3MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424467; x=1744029267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
        b=afIjtkVxNB7H++hrNFF+ULQUttRiaNWX12KOMc+ftU8yOKpD1PkjHENcBW5pcpawyi
         1JCdSltYIsK0Mn2PcVwy9ToEsAMNZNQrlRR20ocp8DuYcamd+nOa9pVwA5yLclmo4NNV
         igLXdJrdGPYQYlrc0jADZDWuiih8F30zj2snDtLZepHZSO6oFjkau+a44totp99zUuLK
         alH+8PthuHABY1mO/7Cyy8Tn1YXfLkkMoa5ecM2Y4WXzO0+Qn2Nk5MHzOOrorMI5Jftz
         UOyZB7uV1RkyRjdZQ+Id4TGEez60veiqY1HDTv91IqHGZsKpNBfnbMLrDxX+j7lHMpLl
         +3kw==
X-Forwarded-Encrypted: i=1; AJvYcCXQzLT/c1n1neWGL/YPi7UULrlBY5S83/YN7CEuTzeYqdP0+dxVkkNR/prJ+9bIk0gevhFM93S+um70G588pxX+pmNJAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2VAxU88ypg7sYrwn2a8e+aJJ9UTOLfsZJwmuHSUQdOcgJwzji
	lzBncncFlAqbhVSc1Fm1B/dHMRtX52BUnHi/s9B9o1YelTRou0Gc
X-Gm-Gg: ASbGncvQuoeK8iutUfP/2IiAewYR2OFDdCk41DdY571me7GVLETiZgwkkJuu1yGAvnv
	a8/bkNxMcUAERGE3RRuibO0G969zhwhnB5cfTmfHayLoFtyK14dplahgOKQWVFlzofpVEmSo8ql
	656ffWSbuoGqljRokkCyo6HKkk2H0ELuxvxRtgXaLjCKybZUuuIFKNNxqqCMZLSJ8/Ph2jDW6sU
	sXW/Qq9gveUSLNIqUYY1CW/cBRrcoiF9Ak8haDSYY3Syqh8ZY9C4i4eLwHNBT2nXhpezze7KNwD
	ye/M6Bhu3MLySyyNVjhp+e12uRAigHH8Am3ExVmW4lAWFTBigXdUg0/G73xncJz0hb8GCjmoOCC
	aq/NGUaDw
X-Google-Smtp-Source: AGHT+IEfunH6HBm1Y7PMm/0AssIfHy3J3Wc1+rqe+wHnYUK4e/iGLilXY3nFa6l/MWKO2U0EbJxUpw==
X-Received: by 2002:a5d:59ae:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39c1211d013mr7275853f8f.52.1743424467274;
        Mon, 31 Mar 2025 05:34:27 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e393sm11326406f8f.72.2025.03.31.05.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:34:26 -0700 (PDT)
Message-ID: <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
Date: Mon, 31 Mar 2025 14:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 26.03.25 um 08:00 schrieb James Flowers:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Our display team has to decide but I don't think that this patch is justified.

The time given to msleep is just the minimum time necessary for some HW action to take place. Waiting longer than that is usually not harmful except when you want to optimize total operation time.

Regards,
Christian.

>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>  		if (rc_cmd == cmd)
>  			// active is 0
>  			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>  	}
>  
>  	// read rc result

