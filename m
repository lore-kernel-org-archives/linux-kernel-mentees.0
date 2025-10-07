Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2761DFE0B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 23:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759878992; cv=none; b=QbwqQX0fhwR8aD2fFD+CFSyGIVyT5qWBwPD4FreAgGPB4Ko1nOV0Y0uwqmi9JX8osX6Xh9RuIctJebvdzjpOQGqXhEskaHAsyAY6FUwH26ExSm5LqsI45CmzMHzlyZPG1AZcIRQQcDo0IpPVbc0Yb3AnO7MVKSdp/UoQAGAab54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759878992; c=relaxed/simple;
	bh=eIfWtUHSviSKN1zw89KrShxCLlPX2dyN+NvsS50rAhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDMFAfDJjGKWG92g4dUjBaSoyGwV+EmPp2U5OsxIEWTfIqtm1b6CFNZBhM1qYbx3AJ4fwnLXNVm8bAUkmZWSDInkw7xiImuqkOYTFXBLCpx5y+SpRu5CAT8/Yy3HIvnncNQCu2ogCyzZxh9R2Rev2vhZRIAfwxRFJJuFd+Anj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M9xMs1Hr; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M9xMs1Hr"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-917be46c59bso615972139f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759878989; x=1760483789; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SD5yIh7mchDzfy+pmfKeaAbFqsdOLLaDl138ZLpTy7s=;
        b=M9xMs1HrGrm6S0UMGAx4oY2eKuZtanDnVFGj9uaXXRN357Byz8qvuYmTunSTz0M3fR
         /qzCAzwsHoqOrzIdHWMo00e3tULsCioDDWURvS7cCeu+OqEfya361gge4jnct6OHjkj/
         6xGzmmdGbbT07v6B2EgJCIbsbXqi5pSfb11Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759878989; x=1760483789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SD5yIh7mchDzfy+pmfKeaAbFqsdOLLaDl138ZLpTy7s=;
        b=e/AVQHrbnXr8azkC0/FUpPCoUzZZ/cyxPzMW9IQol9Ra+PIhqW57gtWKTMfL+cApto
         VMlOQwzhlc/zl4yRqsLIYZkClhzkVX5aTJMahLUi0flaoBq5I2S/g5wpnCwgqXbPxO7V
         oS0s59UJ4fpzIQia3tC0+D/mt/7HsZjlkBVsu4eLizh8d0x59p0L3wpOoa+ThouchWZ+
         /uA2ro4J/Uu6YoqPLlcGDFHeVLNn7VF68szERJ5uc7LPMeYvOQcSsna0mPS+4RbmF+ok
         dysKKnd6VGgi1YgNQFVwxAX0RypbUsWd/V0DYZfDVoYucRlbAC6wEu+w+QcR7kZOC97E
         7CuA==
X-Forwarded-Encrypted: i=1; AJvYcCU33t+41wvEwAltOngcSWSvgYP1HNojrqL/PPLIkRqkKtBg8ZNpU1j/tMYan3f7CRYW3/96dGt6J4VfdhdfGA+fenSFZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfhJ/XZfsnlBCXuon296axQhkedS3QN6JOnqHzNE8JH/+DefmO
	MnRDj/raWHAYIxl+Z6ge62WjHPWeL+IGG3SmWd5gDPIEjCn7Tm367xkRMN9ZiHEic7M=
X-Gm-Gg: ASbGncuCuQywB7AuCljfKyXUr4GE3vQVJCPeGT7YxIRc0ahkmmVPpttNjPZi/TPLlvl
	7S0eZiRjQLAAe45kTRt7M9gpVolHbCz5IjYPVNVH3Xmc+CIdldURZlvkmlE2a7iwA04zI/o5ZIg
	R6FcIjMenumYLvbvNDY7G9iXBKpxPiuDsSXQgMwc67BPwrMz+wEViS/tsV3tafU+7aeAx90YnQE
	mKA/M6xDa+1G6CeHApoQ0JdgncN57BhfsvYceJF04vaoIajI0yms4+5prqzlz8/u4A3baFrpFQz
	zM4+ye6wG2czAQN+rRJCNP6M4kuZx71/zjsKahU10e1uUjbZciKEzTu90/eDLSatLAvJ1DKdyxG
	nWT6e7IBDlDZhvgiHtJzgoXk/CHBJYJCTPhGqDL/2L7rtApXPJNm+HhVVHKc=
X-Google-Smtp-Source: AGHT+IFtnjgHVUKlgejgjQmfrY8NhWm0K4ECYfhZKgNrEOhgOUSbX5KisBkAd+fZ7CYn0EsvLjgWXg==
X-Received: by 2002:a05:6e02:2581:b0:428:7f76:4ec4 with SMTP id e9e14a558f8ab-42f873d2956mr11775395ab.16.1759878989058;
        Tue, 07 Oct 2025 16:16:29 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42e7bd2f139sm58970215ab.8.2025.10.07.16.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 16:16:28 -0700 (PDT)
Message-ID: <f774da25-ab98-4731-b78d-394d8e3a4c3a@linuxfoundation.org>
Date: Tue, 7 Oct 2025 17:16:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Rahul Kumar <rk0006818@gmail.com>, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250926093008.1949131-1-rk0006818@gmail.com>
 <CAKY2RybMM5jcOzO_mknsdH+m9-T+Qe3yMhRrdpV_VE4paUrAKw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKY2RybMM5jcOzO_mknsdH+m9-T+Qe3yMhRrdpV_VE4paUrAKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/25 11:51, Rahul Kumar wrote:
> Hi Liviu,
> 
> Just following up to ask if anything more is needed from my side for
> this patch, or if you plan to pick it up in this merge window.
> 
> Thanks,
> Rahul
> 

Rahul, no top posting. Please give people time to respond before
sending a second email asking for feedback. I see two messages
back to back from you - perhaps an error during send.

> On Fri, Sep 26, 2025 at 3:00 PM Rahul Kumar <rk0006818@gmail.com> wrote:
>>
>> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
>> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
>> corresponding drm_err(), drm_warn(), and drm_info() helpers.
>>
>> The new drm_*() logging functions take a struct drm_device * as the
>> first argument. This allows the DRM core to prefix log messages with
>> the specific DRM device name and instance, which is essential for
>> distinguishing logs when multiple GPUs or display controllers are present.
>>
>> This change aligns komeda with the DRM TODO item: "Convert logging to
>> drm_* functions with drm_device parameter".
>>
>> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>> Changes since v2:
>> - Added Reviewed-by tag from Liviu Dudau
>>

thanks,
-- Shuah
