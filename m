Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB661B87CE
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Mar 2025 22:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743201966; cv=none; b=HKSXdcQjlJfKQtkgNg/wqlmJOIDuoFD22LN12aJ4MlfOl3Y0cVgbi1ySunz2r4w3zEqhwNRqBprse5aOtF0HY85l3j8Z5hnHmByaVkSyl4rd9AdahfevBSXm16DFG06AWiZN7xV7pm/8qZ+89qqUEjHL6BL1l+9LZH1BF5ncgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743201966; c=relaxed/simple;
	bh=O9HcZ7QQF97Jl5Qs2jvOUMdMYn/JEbrhWafdueIC0U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHft52xYccW/T0f7p4TVWqtYDMP3WKlXmC0Ed4UobDdu3DK2loQwSampDCy7xt7wX2KpHLycd5CUjZyyhKQZwOmnPvXK0OVzAJs+sBNcfJPhYaMEOovP90FDIqt/EWvjn8F6MbmEwodnE4Z8/ojQ+nE8lNaKv2n4cf2l8JduvAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OKlPvIM+; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OKlPvIM+"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b58d26336so215491739f.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Mar 2025 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743201962; x=1743806762; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
        b=OKlPvIM+UVKS6O5grTdfQ4Mxl0MQaxGIZTvMOUZNl/kt37PNNcohEE9nikuGTqFOQy
         fVEsHzvWaqFEDc1H+s5ZDIMWARShToJXpd/jPqDXeoEH0rxaPqbJ03cWTLCwSkxTALdQ
         eKGrp1iVcJFl0/nXV/ed6cNXvEtxwbTdpIuAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743201962; x=1743806762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
        b=jEku/DLJm9Dd+h9KVumdab7R9ZY7kSgMONsmKBS5ANxZv5FD919LycMhKCc8dG2zYu
         9Umq87j3xdRb3jpcQugcFsTnsXZepaiP+IoFskvi16cX6Efx5P3Cg6q/hlUsO7j2/mmd
         q5x416HpQuna4g0TOMaztepZujZCZT2BRkrYKWmJrzl3IXL6ip90AzCLXBKvQ2shLqQo
         K7+hX5/QxvIwKBbpiDSV9gSqRHU3Bd/8eBne94woxEMW/45w713TlsKp1QqaVd1vIzxn
         Cqd3bwtRf+SZTMH2S7bnqmRD8f99jfMueMhjhvLRIxdlK04Kmt26fFqu0ZpQW+q6uE4P
         AuXg==
X-Forwarded-Encrypted: i=1; AJvYcCVXwCebzWT3E0jT27ZaAxal4WGBr4/B3UykSmt2VE2o1wzuY5EPxfH0rz1OALCD0Mf3PTODTrd1IdeLamNj3/lyHtxVsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV+XbHiaUYD33m3NQ8rRu6du/2OjcR4j/Evh65/DC0pYypDniO
	gs0Kf+Rov7+GTGRGxLXWzYhpTxEsIA29oHrR5nO/RA4IHW1G1/MCOqLmkBwFvcw=
X-Gm-Gg: ASbGncsGIvUVv68QhcWheOeBaB8ADQ7Vek9sPfea/CBdXekCBhGgaDidU1ntwMpM+ol
	56pARyalj+3OM1ZeCt8G3nbjy7Sk6dWdLIuRyhPTW0Rq6AYA4sDQK4BZoImuFJbjAY+VKfptVS+
	WD2zSxw7CS2UAn5YzH+TO2V90H5T07qrQShrobk6RQPwGoV0RvBqPolmtwUK10MfO4IV3IWEqdm
	sR6mz4TomXzMbCziiX7T91aVqjXcB5pwCR77KaNcOapOueJS7dvl2bYELLDjvU04a3wf0ZxsE2h
	mgIhBdp248f2AKaxhcW+8V3pTLksb8AJsm6LdxBmaJrOioO8srM1ecY=
X-Google-Smtp-Source: AGHT+IE8B0Y4+x7cusSExDaFtRYAJ4UtV2GfOT2Knpe2lYH3tt4pvG6kA/VEZg8rg2BDCxRFPuU0xw==
X-Received: by 2002:a05:6e02:1707:b0:3d2:b4ea:5f42 with SMTP id e9e14a558f8ab-3d5e0905e33mr16223855ab.6.1743201962227;
        Fri, 28 Mar 2025 15:46:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a6ce5fsm6852735ab.27.2025.03.28.15.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:46:01 -0700 (PDT)
Message-ID: <476c5bb9-79c5-40b7-bba8-b52fb244e90e@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:46:00 -0600
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
 aurabindo.pillai@amd.com, alex.hung@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 01:00, James Flowers wrote:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Can you elaborate and explain why this change is necessary?

> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>   		if (rc_cmd == cmd)
>   			// active is 0
>   			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>   	}
>   
>   	// read rc result

thanks,
-- Shuah
