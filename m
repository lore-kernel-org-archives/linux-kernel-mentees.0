Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6634889E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761329880; cv=none; b=tT9vr40Z27TGCxjmpzMik/eBkGH7wcxhxxIDAQ1QcIVcLVgaNjybdUemvEjqnaku0D/wB9B8Q0x151/NKb51RcHVjtDUyndY7rgOPp1euKAwVeM5wwVoI66yoAJf56Op3vzNQA/L5Rw92AOQnSW40MsDNzssQ/Dq8925XVbfdSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761329880; c=relaxed/simple;
	bh=f9EWuUddQuX6YNL9LEZegSrVPjIgkYAeTAs+Ik6L294=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=um7qXbcYd1G6faZBZR7hmIcjO1t4Kiy/Rn4Y+w2roTg68MMxMWuKhHwY476n2Q9GDW03xzT7dQIuL2sZHZ2qrXn8kc6MqM1dLXehHLguCn+CnqdZGjqo5eupcvB97JnfDbKDp6ZBdwMs6nL9+efjCVYvpVoaIT9+P82eDmjnfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wd5W0O0z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wd5W0O0z"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a27053843bso3356389b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761329878; x=1761934678; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f9EWuUddQuX6YNL9LEZegSrVPjIgkYAeTAs+Ik6L294=;
        b=Wd5W0O0z41mfqbqTL9NbyKfchIt7JcKfMTMgQxx55nN0rUWL2O1YkkWXCtVXTCJPR6
         xBWAiDkxkAFTR46R8CXz4Ol59ib/xs0MNAvra4xZl2JhbFdTv/mM5UmkVOS5MTVw0y+t
         4i+wvvU9BEUsOBEVmfV7R8PVIDPIaxxG1jHXifVAvsge9xyBOsTh+PeF3TMBLrfEF1QN
         8A53cM3SBCuhgQhRXt2kCmgX+Ar3bif1kFgn6VRvAcHAIt9y6rUMyMZ35ngSJVQJtgII
         W+5Up/m9GLg/rzwXZ5PVUn8vSXEcEXnduiQYVZjxec6L9Z2iAZalm26VqYD3ik0Qkl6y
         E+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329878; x=1761934678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9EWuUddQuX6YNL9LEZegSrVPjIgkYAeTAs+Ik6L294=;
        b=q75WO6SU23ZZt99PJ0IyFUPaNMC17vhYE+pz2KGFBGnHG+onIY1io45lDz5edPp2yg
         Av5qRz2i2F1QiYPjXmfuWH11187DX5Q+EBzxLNpssZ/zUY3O0HufOPI+hWnF7szS0y0Y
         +chN7Lizu8jF4cGc9EahRVIRDq9/ofuFmnsvEdCK2mCuMuHIgtKN8xeLJP+o/r8wzxWE
         KBCX0CqHNloZoSRtd12Xnk6qTsiluggTRQyJpB82742KyRefvLFnpN6R/tx4k4VHyA4C
         wYVQUucqY8Kid3LPthvavTuh6eaXFJwVtnHWd0cAJ0ea/jDQtqpLZMh7xQEN7xwGApjh
         N0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLCg/A38msXkfWkebxMUiRunY0EMwdf1pmiN+9AFCK46qGfIcU1dnAp0LOeXW8itZuPD2IrqGGwUDWri7FDail+CXazw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhr02hn0Lteur3kYajXBGfxE07OZJ00gGp33i4aRo6a9LdQm+V
	mHbRNO2EtyS01ORSQ3lYvbAubUmfyD1oIDBX86HC9tvwzLoJbw437v6y
X-Gm-Gg: ASbGnctPgxILeEv90TyytJqtYP4m8YOjcvSeh5BupfbEpVWXkcYpIIbmaLDbRbrtMCm
	jvn+i+Su4VbAlV+jHmNqaYLXXOPMTVe0LE+7uKwRPy+aa5ZshxeUDl2x/vSU8I5RcwRFHm4lfRp
	1stvWq9lHr8L9n7Xv1KIBabkzbEL/JJXE8EcNzOTkMTOSAwRu6tgp1y+AS9HX+KHysDNGaERIat
	QcdF15tEvEP/kMACCawa+Kn6AYTK6/xOBCk66cX5uj1NDtXo2FKe5byzhleF6PEWKm/75DW19Ya
	oLD2Zyi7a5ElQRigZrpHaZl23xjbkWgakk73UzydGj5NuTET8zNmrm4PGo0iOrf3OgWAuwCUBr3
	r7mwWfXVyf5kuahlZ/xvNiCHc+3l4FWilA/ogscxiLiEvZpc0OEt09zYD0mc4cGhNGbY4PoQsEt
	o9k7uX6hjSuWrLBCn1O61oACI582++CFZlDAl5/NVU8WUY23VEZ1g+hckoAWBeyl0oT5Vcuuos
X-Google-Smtp-Source: AGHT+IHeiJK3KGe+VnGjHXLRnMJUwHVfOIfp/7GkKJJk9bi79iBVomfSlmVEYSTiEzsfJqqDkJvbHQ==
X-Received: by 2002:a05:6a20:4311:b0:334:8002:740f with SMTP id adf61e73a8af0-33dec72d38cmr3947493637.41.1761329878500;
        Fri, 24 Oct 2025 11:17:58 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8adc8sm6527877b3a.39.2025.10.24.11.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 11:17:58 -0700 (PDT)
Message-ID: <b262deee-de5e-48ba-9c16-88238fac37fb@gmail.com>
Date: Fri, 24 Oct 2025 23:47:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: emulex: benet: fix adapter->fw_on_flash
 truncation warning
To: ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
 somnath.kotur@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linux.dev
References: <20251024180342.1908-1-spyjetfayed@gmail.com>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251024180342.1908-1-spyjetfayed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Please ignore [PATCH] and [PATCH v2].

I have send [PATCH v3].

Best Regards,
Ankan Biswas
