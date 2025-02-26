Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BA21D3F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576489; cv=none; b=IozNYbnX7F1mU55yWQnIzLRAoOnQtm3jctLI/Ul6FfiumA2GYy8DLyVgE6slDcmGDb1dKa+uB7OcFyRCSIqiZHPPcMbnTYoznOIDCf+ZnFH9knrh/cl422ZPMfI9pkzAMx+Rf08ymifIgHbu7SbW/1zE/bneMWpAMop8sKic1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576489; c=relaxed/simple;
	bh=4SMErx1uI0VODG0W9bmD7QqNKwqgawcXT2PQw8koxuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBGFdJQ/aWtNXeH2VJoe/b5/Wn5eGoDCvccWmpWpzMEzOqb6eUUje2EPRisnVCVtomdN49bJ+eQCZEk5SvYV7YQqhWnoC+5mjPyYJA7dMBKD3owMp5MzpAvPf87N/HnsSwmq4uQ4yKPK3VUmEyBY/4aFoYurQA17xglC/jtG0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdLsEmRl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdLsEmRl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B5A40EBE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKWxXTJvO75P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Feb 2025 13:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36E8040DF1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E8040DF1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FdLsEmRl
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 36E8040DF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:28:06 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220bfdfb3f4so36890405ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 05:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740576485; x=1741181285; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMjnClbcooN3I5ewM0eirgAPMoJHCUEMpPh0j1XhfpA=;
        b=FdLsEmRlacWLhmlsbKJqPFFhC//eExcHpmO64TD41ncbxUwEvoLj/XR4BwpCldyO78
         lCImOkIVPa/2xjdXa3IDUDED/OPkG/uYQNNB4S+w1y/UkeiL1qgkKhi7f8pAVJIOJuej
         zAA/m+zmtaJURGX6dTEJXO374ztmXRmD0QhqrUyLMoMg1wll+SpYTAuiVeP3PvnAiJ3g
         wAbOkhh5Scw96MXg7wO3PEBRoME1H8sTUhzJdxvDSfgysIoy6MmjvyJ21f+uGhQoK2co
         dccwg6NZnfypfSrh3DSiRLYawFWr6lzZ+43iWcYH5LiLN6lRYdOSxE5LwRFTGEXOyoqd
         jIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740576485; x=1741181285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMjnClbcooN3I5ewM0eirgAPMoJHCUEMpPh0j1XhfpA=;
        b=JqKHyupJ4z0YByrlxFf5YP03CSgqied+IIh1o9llGILN1fsiEaCJBEBPSYu/6zKytp
         k7u6SMsUHS5VPSaF/Y0d+WIO/uJWS9jOCzXXLVl+WtD7rQMHYl2wrQujY8gHzBugYBDf
         qwO38wYhmt2hEUngCUL29YwLk+cllJmKLn7nIhDhuNJHE+EE43JuACg7fL58jh1TOhnK
         I3Pr/UpP0ESB1n0ro8Cs4GLS3cCpDY6Pa6JFfmBu6ELkxBekrtHYx8ZQvt/Jez1Ck1Tt
         NoT017BU7cmrIw09tKJBB/ulOLjH9SmhrRdtwcPBIjLbdHMlpr95SKKFbPeS6gPyIXF6
         2ewg==
X-Forwarded-Encrypted: i=1; AJvYcCXOjtWsNbfTx+bUtEUXBzvygj36t+RCny2qN48TSjX1lQ7z3wXtqhKk2vWu1FUETq1PgO2Ya9ZXAwuXBvspOOG/QRZKvQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw8Eff9IJS9oR+mFjF+vWVLccStrrDZl+5xzvxpNYBbnFCg9ryp
	rtWN0fBytyPwDyPTlylpKG3HPVeqtTH5Og0o6enJTraRuBbXaP+c
X-Gm-Gg: ASbGncv9E7ZaiJeAAmRZ54Ymhq9iK1wu6kwYPwggMUwpuWZhX95BZ4h7/td/3qC2ozY
	XBpk325oGpWuTI2+07UP7posEchGbQQGRmmlLYmOD17+Dcex3VLYUb8qAVzYgoKLtSSA3FssZLn
	bIPTfhuNk/uItYSZRq3VkoQsfHWRN5ktCehsgD34DO3hKhINJqUWsf82d8Fz2ghwIXq+Mfh6o5c
	20Zp/nxd0ZzzTGlnPT5nUhdcJOkg08kaycQF67wv/89of9izu1jh0t3GatuvW8VoAv3oukm6VwH
	NBOXNJODcFhXN1dCN/K0YnHYazPe6pnaYsy9ut6yZtxgZy+fXiadpixW5kZpIGpbwmELQbkj
X-Google-Smtp-Source: AGHT+IGXCwstq/KHZvkH2IYKiTn+Do+Nf4hSI/Dsu8V1QhkCFotD8b+ZNhay2Dfwe1oDMqpqIpuKlw==
X-Received: by 2002:a05:6a21:348b:b0:1ee:6d23:20ab with SMTP id adf61e73a8af0-1f10ad33426mr5136409637.10.1740576485322;
        Wed, 26 Feb 2025 05:28:05 -0800 (PST)
Received: from ?IPV6:2804:14d:887:95a9:987e:93bb:37f9:580? ([2804:14d:887:95a9:987e:93bb:37f9:580])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9b7fsm3464473b3a.100.2025.02.26.05.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:28:04 -0800 (PST)
Message-ID: <0138cf8b-7458-466f-8d0c-55c9ccd0a932@gmail.com>
Date: Wed, 26 Feb 2025 10:28:00 -0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250226010956.50566-1-leo.fthirata@gmail.com>
 <29ce9b9b-3993-4b88-a201-5d67050d53ae@mleia.com>
 <7ba7cf93-e40d-433d-bba5-c43ce8510ae9@kernel.org>
Content-Language: en-US
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
In-Reply-To: <7ba7cf93-e40d-433d-bba5-c43ce8510ae9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Krzysztof and Vladimir,

Thanks a lot for your time. I really appreciate your feedbacks.

On 26/02/2025 7:14 AM, Krzysztof Kozlowski wrote:
> On 26/02/2025 10:41, Vladimir Zapolskiy wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - nxp,lpc3220-mic
>>> +      - nxp,lpc3220-sic
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  '#interrupt-cells':
>>> +    const: 2
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description:
>>> +          IRQ number.
>>
>> For sake of better understanding SIC1 and SIC2 interrupt controllers
>> are chained to MIC, that's why there is 'interrupts' property present,
>> and here 0/1 interrupt values are for regular IRQ, 30/31 are for fast IRQ.
>>
>> Also please add here
>>
>>     minItems: 2
>>     maxItems: 2
>>
>> I believe that the 'interrupts' property can be just left without any
>> given description, or just give a simple description like
>>
>>     IRQ and FIQ outputs of sub interrupt controllers to the main interrupt controller
> If they are obvious, e.g. maxItems: 2 would be enough, but I understand
> that these are distinctive interrupts from dedicated blocks - 1 and 2 -
> so they should be listed.
> - description: IRQ/FIO of SIC1 (or whatever name is here better)
> - description: IRQ/FIO of SIC2
> 
> Best regards,
> Krzysztof

If I understood correctly, the first item of interrupts is dedicated to IRQ type 
and the second to FIQ type. Then, I was thinking about listing them like:

  - description: Regular interrupt request
  - description: Fast interrupt request

What do you guys think?

Best regards,
Leonardo Hirata
