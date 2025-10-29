Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D02F83C9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761721222; cv=none; b=jzAHNeTKSF5n4/rociqVeOgoNSfxRNXTHpY6uO/5SGwqGNkhS7+2uL1bBnuz0yID8WRTREsJIvpQLYilnEK8H4sZKLoste0jpUCVsPxEAcKDhvWT2z2jP7Ruqcv/2id3cFqWOTFEdgGLDiAmfVyUhtoK0U2qAZHjDOrDl098sIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761721222; c=relaxed/simple;
	bh=gkjQTtCLf0j42+7c4QiatRaAEiOfdoHMhDAaPnHUHTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8ObjYJvIMAIDEkdxXYHbQwCCBR01aPjZ6VBdZCUMwAZaAOpkns/WBO89C+BQnJNOK8abkz4n/iGn60eRBXSzf5KtS86kaCFRWOP+6UzGz9wlfKf32cJlN3ISvYLSM3+Q3b8CT3tLGTJBsa2E2Olt59aIevAJDOQTzyLa24Ccng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxOvN8+C; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxOvN8+C"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-782e93932ffso5172229b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761721220; x=1762326020; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KJXiYv+0JaCGm/J27+WUyeK7V+2nQTA8wgQaLCrqXU0=;
        b=NxOvN8+CDDuh+sQ5UncTj/V4LUiuYuQbsJl5XRWf0qrLlv7hoMTCh+Eeal35KQ3Th7
         22MlPw+6nA6ijZkQbA7Y7fKIXv57v81PAQRBiddwcRdIdWj1VgrsTvb1gMezQ11BE5sC
         kU92d1+PUFkLvLeu5M3B6+f6zD/w0ZX1lyIgJgW54kKKemb14kyFiFifRFpe+u+qQmu7
         r0TsP8vzag4Rd0Dv1czX6qCQ+xYU6CuE8Yln9lL75oAO4CMRa+VldkCeYeSQ/FRTSmfB
         4fvDR4USIW91vkH1XVIGjldm939ha1Y3sJ1Zy7C8e9PtIoCSyscX1IRJ14P4j0ZjLGvA
         ImIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761721220; x=1762326020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJXiYv+0JaCGm/J27+WUyeK7V+2nQTA8wgQaLCrqXU0=;
        b=v6g9Ky3Vs0eMPBLQ/wvaf9vYzbyTqaRxbY20+KkNW828A8C2xG+DmTkTFvwPiyy/KZ
         qaW0KLGxZIx3xRUoAa8A7CWp4mZXPC0UZmmMBv/QToK3okbvAIGguAmdY72JTWj0SgO2
         9zv/ly2nU4pjrZZDQ/ZyPTQTHQimEhpULuU7adnwdoMaf3qH6AAUdBKFBPE+jGPXhTyU
         hFUATVs531J95Izzu36qK0K/yuXzjzIlH0z5LqZ/b+rerXwYeYt+9OEqn8fZKXDYXuBc
         NFpUJY+3n5rkNp6BHdhEUVqV8RuEOSkpnzV2MBKz2lzo3fpBTchcgIYZNbe6pop7lQ2F
         Fi/g==
X-Forwarded-Encrypted: i=1; AJvYcCVNlSMD2WOchlpdgApkk5qZXyYHJNP2nm240qiKLKD4PQsiY8QmZhD7LD4VzEtA/MrxMUPQg5dVO25DPkeQeFxUq8vOYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjHFZwZSFVvmGyA1LmKrWDVgrHZWNG83U5H7VBH/HEFZINl880
	gRluNnjYmGXF+zYq6hRxdM02bDRrLG3e5KsuhtxRgvPhmctqUJJxw/XD
X-Gm-Gg: ASbGncvW0foCdjm5Hj2OsQJwAHOiG2HR4Qcnva6r11UR8Iai5PHbWhXi7R9w37LHATX
	qcjXg2TiGLKW1Dh/ggmh+2uWi7fHJfdsd3rwqmJVhn1hXJE1x7Fbxv7Vdam+UxBejCSiJGrljL4
	z/BmsGNZf4xnkHkoxdb1WohLgKZNWkn+ZU2SbBIWPuoK2orXn0WJlwjUbU/EPkwifSemCRDwA4k
	KLU8DgQ2L5i3UrTzJznnAbGwNleTuGV539pLKB8LnfpdrUCijRhTuWMGKa553y2yKyKhQRpE6Iy
	fCBaWQJeP1fffoF+zOfnJFtlLaGM0UkFLjUQ7vM2QVIewdjsPpnDzcIcE0RCHD5febGr/PTzTzG
	8gLXi3me2jm9BfOsZ6/E9loC9NocvleW2OE9rhkOLYaeniJS5yshf8YUfvUiwgppJ0JnJ3ZLFpE
	Z9Z10y612vB0iJFXwhAQu994cBf8IPncA7g/AN8ARo3NaXp6JhQFw=
X-Google-Smtp-Source: AGHT+IFPikg+hMI4IFqA6vaJO2l1s8acnlRUaJizqFH3e6TpbdLv1AcvrswIyXSpjFqa9G3n1MszZQ==
X-Received: by 2002:a05:6a00:1391:b0:7a2:7d09:cf40 with SMTP id d2e1a72fcca58-7a4e2cfc52emr2017185b3a.9.1761721219674;
        Wed, 29 Oct 2025 00:00:19 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140168f7sm13939567b3a.11.2025.10.29.00.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:00:19 -0700 (PDT)
Message-ID: <60657a94-8b91-41d5-9cf7-61ed5ceb2161@gmail.com>
Date: Wed, 29 Oct 2025 12:30:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] net: ethernet: emulex: benet: fix adapter->fw_on_flash
 truncation warning
To: Jakub Kicinski <kuba@kernel.org>
Cc: ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
 somnath.kotur@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev
References: <20251024181541.5532-1-spyjetfayed@gmail.com>
 <20251028184254.1d902b50@kernel.org>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251028184254.1d902b50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 7:12 AM, Jakub Kicinski wrote:
> On Fri, 24 Oct 2025 23:45:41 +0530 Ankan Biswas wrote:
>> The benet driver copies both fw_ver (32 bytes) and fw_on_flash (32 bytes)
>> into ethtool_drvinfo->fw_version (32 bytes), leading to a potential
>> string truncation warning when built with W=1.
>>
>> Store fw_on_flash in ethtool_drvinfo->erom_version instead, which some
>> drivers use to report secondary firmware information.
> 
> You are changing user-visible behavior to silence a W=1 warning.
> I can't stress enough how bad of an idea this is.
> Please find a better fix.. or leave this code be.

Hi Jakub,

Thanks for the feedback. I felt this would be better than the value 
appearing truncated to the user. However, yes this is not the ideal fix. 
Will avoid modifying user-visible behavior.

An ideal fix may require a lot more changes, which may not be worth the 
effort at this point, so I guess it is better to drop this patch.


Best Regards,
Ankan Biswas
