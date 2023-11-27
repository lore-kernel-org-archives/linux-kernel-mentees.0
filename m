Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69E45C0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIwIvsas"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5242B60F2D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 20:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5242B60F2D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GIwIvsas
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnorYyrORovv
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 20:19:12 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B0B4E60A99
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 20:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0B4E60A99
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cba45eeaf6so1280243b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 12:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701116352; x=1701721152; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MJbv7/yM8IoZp5rE2NxjWnnGMEZpgKADKLpNiN2nLo=;
        b=GIwIvsasfnvmPyq0gVy4gOG8Ge/OwFqGtZtf0p/6TJqUcEJVtLKbGM0BUehEJHx+Kt
         ieNDmeEP52pSKPXQL308nrgsVXr8pdgtlD7pVqI5jUiaKlFGDBQrqfAJHXJA4s9OWVT6
         L61IoUqVG0riSkTf1DhhLdOCjdu/ak3EqNxDNSwwHle1zr/EfDbtRccnmB7sf0NLdXq5
         baZIyQE5u+VWSrBObwgEiEgE3XUpglDPvikinxTBjWOptkJqmzqKtWmPjVMfKUxtUOtn
         xvZsYtTa6ESaa3vzzrEhbrO4ZrrAFq6QLTCUI8y3uZBaGxH+X+uDPnXhV9eLTkfJzwlz
         IzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701116352; x=1701721152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MJbv7/yM8IoZp5rE2NxjWnnGMEZpgKADKLpNiN2nLo=;
        b=B2lq6C+41tbJ3NmyvQv2ONySSSdYYFUtgSnrbh1ZjMFM1Rh7run6chVEGYOHeY97I9
         z0S2xGqA2NfQk/4kPetl38goSZx9f+ItqlyObqzYAwOCAdr/zJV77Eh1uNANKaUlevVn
         ZIllH9O6QMtfdBa8sDWQP1q1lzdPqy5+f+u+oFIzQOcdNpYBP5gv6dVdvoDwYyy1y1p4
         OpILAPdnMB2AhbtZgYf89kQqO+3/ls2rebVOcyurxzyigMU+Eix2VR19u7Iygcrzxr7C
         bk+l7LF1rO/CZPSq4kGiZ2HL5i03+mEiGWmw2tmX4mnMVw3lw8Z+viLDUBw/HyzL3N7q
         TekA==
X-Gm-Message-State: AOJu0YyHt0B7IP5C1hasPQC6ETxyXRZfb1gEG7BKWpg3KwhWVFoNqCY3
	QWnF0OSkjJaqQkyMpIGX4kY=
X-Google-Smtp-Source: AGHT+IGgAthcmJdLcAxnPF1mKTsZQwYQTddihmO/oR2hXQckOBKxsik/6r22n6oSt6f1b7tAAhta1g==
X-Received: by 2002:a05:6a00:3a19:b0:6cb:8347:c8b1 with SMTP id fj25-20020a056a003a1900b006cb8347c8b1mr16610584pfb.1.1701116352000;
        Mon, 27 Nov 2023 12:19:12 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b006c341cf08f9sm7780689pfi.140.2023.11.27.12.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 12:19:10 -0800 (PST)
Message-ID: <af489962-705f-4a72-943d-ba3b46d64597@gmail.com>
Date: Tue, 28 Nov 2023 01:49:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver : edac : Fix warning using plain integer as NULL
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, qiuxu.zhuo@intel.com, james.morse@arm.com,
 mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
 <20231127171435.GCZWTOe+DQSy4kkuKO@fat_crate.local>
 <dfb5b4cd-935c-445b-aaa7-bcce962a143d@gmail.com>
 <20231127183941.GGZWTibScFM4lgbqkG@fat_crate.local>
 <95fc95c8-dac6-4137-a9cd-29f27da64e41@gmail.com>
 <20231127200519.GHZWT2f2x76hMLR91V@fat_crate.local>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231127200519.GHZWT2f2x76hMLR91V@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 01:35, Borislav Petkov wrote:
> On Tue, Nov 28, 2023 at 12:23:54AM +0530, Abhinav Singh wrote:
>> Just to be correct this time, I need to put a reason why this needs to
>> be fixed, in the patch itself, right?
> 
> No, the commit message is perfectly fine for that.
> 

Okay, so I guess as of now there is no change needed, so I need not send 
a v2 patch, right?

Thank You,
Abhinav Singh
