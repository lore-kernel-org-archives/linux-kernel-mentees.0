Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F119E804
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Feb 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508264; cv=none; b=Q27mQNrokjhytZCWTWtEOJ+jw+udBrgUMMfO+WUlDnUZIIRciEr70QXyhRH40PdDJgfB1LP3D98v418Qfihk9q+z05m3KIdUuZyBQ6nRETGpkcze73r6oB7Pol7WAId7QqBuPi61xE2pXQnzmbRbquFTtvFpcPrgXqvNR2shmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508264; c=relaxed/simple;
	bh=nmjNE2/5IDHBVbgl4kdcWs687grdd6MfsW3lMGDz4lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnoVU4DA8GnnpWkqM2QwW5dhMRqfKW8BOr/DIFf0pegjRdAGtfioWYm7Pt5lBen4CbE6HncENO/+3t//x3MjnbOfMV0OQ22EiSP3DfUK1RBftJgsiimln1Xrdt/hhRPAaZvp0bKQTOD+itLswf0USdJtcCtXQZnyleY6j3s3u0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ2Ea8Wh; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ2Ea8Wh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68ED582030
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Feb 2025 18:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lgfQP_3t5gw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2025 18:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6E0981242
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E0981242
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fJ2Ea8Wh
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A6E0981242
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Feb 2025 18:31:01 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so9625699a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Feb 2025 10:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740508261; x=1741113061; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clbxucH2qa/HYexBlCEIH5MMYzU5Q2jGNyXDV7K5VTM=;
        b=fJ2Ea8WhuSC56RQKBmXf+Dq3TqzTpoWKzu00WYVBSy27NPE8E9955jnBZBLItXo7NK
         uDGRIKDf5Xk8m7+cN+VdN+NEkmM0iL1BxShgVm66a83iEZHuhMqkjHW24hfvZBoNBCx6
         kyAqLbRSePgt98nD/+OxdUNt0ttRWlzmE073rD3dR++Bn6de9Y0CmuNbMcbK6+pA/ltt
         yXBuhOTuUnee87tgfmBIT+Qn3xLV8ILql8H+sEW3b0OE+kjs4UZru25qYVaO3YNL0l79
         v+0m0Br2c1gCzFnt9bWE/0FiY5pHu5jZCcnrrO0ZlwD1rMYzS2oWKxROCIeIdMEOII8j
         l4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740508261; x=1741113061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clbxucH2qa/HYexBlCEIH5MMYzU5Q2jGNyXDV7K5VTM=;
        b=wb8GPHmKP+0iOz4hmSLqjlehmQUzdXtTGRHtVUu4ojZb53BC/qhW6bYBtVsC8BT8kA
         czKv2akmmwcQYbYIpmZ9e7WKF+zDdxEipZkoloEAoHISXbNzvdp24+NIZgsipAepOYey
         333tl59+AbedWWILExKa9vVQXWlgulPu59C8DSH2LKR+JNrwR0mzCRRloNKdkUOJFls2
         94mUBeUg8am6JshNb5jdMQKAiOVyKlIBb9UX+IvxkE/b8dtSTEEkJhej8qbuASSbwhKX
         lssQEd/lyCkqpNAOiEWlWCNHJ48kgRD7Njo30dDDf3Nwo9uFZ7f6WTLTOeHnQaZ8wlEv
         pDAg==
X-Forwarded-Encrypted: i=1; AJvYcCWIphP+Gfi+7d4D1iZ/EkYB3pgtenvCXO4ltbKLcxBuzU0QTgML13Fx/K3ax30GOfv5F54c8OGLvQd9+wr23AK6aUDVOg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyq26Qxwd7lUzGc49M1S/4iM/7+/CfoMNAdfZKIyz/ohTUtAlXo
	4nAuFr2p3WosZgBnB9tcDRQK28RL6nRsDFZBAGRiPWspZQkQjrZY
X-Gm-Gg: ASbGncu1YPpjeAMDJC2OsA5tQuzgiO1MHCyspx1gSsUda6vpET3cA7FPXVku2f8r1h2
	TlYP2G41LlnjrXVdypPXi7Yyq6iXh3aXq3RmqrmicQjhFmSNglIx55As9aEn9zXmWiyIeue3t6o
	F5rURC4Q6oWkKEmc79KXmze/gkof9ThpLoHGyv5rmK3P+OZqGKOUsfrSTfHRhDyUJnxmEiHm9Eg
	54XnRHlHZFrVG8y7TIbQzYNli5CoZdh6fdLyAUPYWdWDXWr6XFEZL48eTvN0Xf/F/zuOjSi2zeD
	nrM52cB+7H68nHKDE1Ws+IOvrtDw0iiPuyTbUArRxs2oR6kZCdTopSKtKHQG1Uq3hrzuMdEWhm4
	=
X-Google-Smtp-Source: AGHT+IHs98MecKlAIN7pAThXOrkUh7E3AIRt/vYcixB4+zqZvpAdTtK8So0vPkRa7+Wpv2+CNmw02w==
X-Received: by 2002:a17:90b:538f:b0:2f6:d266:f467 with SMTP id 98e67ed59e1d1-2fe68d061d4mr5465187a91.34.1740508260846;
        Tue, 25 Feb 2025 10:31:00 -0800 (PST)
Received: from ?IPV6:2804:14d:887:95a9:e1a5:e9d5:ba9a:df82? ([2804:14d:887:95a9:e1a5:e9d5:ba9a:df82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6cf86486sm1952600a91.0.2025.02.25.10.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 10:31:00 -0800 (PST)
Message-ID: <c3407b84-7698-4102-b600-c1a6701fe67f@gmail.com>
Date: Tue, 25 Feb 2025 15:30:55 -0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vz@mleia.com,
 Leonardo Felipe Takao Hirata <leofthirata@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250224210432.94851-1-leofthirata@gmail.com>
 <20250225-lean-bronze-millipede-03edd9@krzk-bin>
Content-Language: en-US
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
In-Reply-To: <20250225-lean-bronze-millipede-03edd9@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Krzysztof,

On 25/02/2025 9:06 AM, Krzysztof Kozlowski wrote:
> On Mon, Feb 24, 2025 at 06:04:30PM -0300, Leonardo Felipe Takao Hirata wrote:
>> Convert NXP LPC3220-MIC to DT schema.
>>
>> Signed-off-by: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
> SoB mismatch.
>
> Run checkpatch.
>
>> ---
>>   .../interrupt-controller/nxp,lpc3220-mic.txt  | 58 -------------
>>   .../interrupt-controller/nxp,lpc3220-mic.yaml | 86 +++++++++++++++++++
>>   2 files changed, 86 insertions(+), 58 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
> ...
>
>> +title: NXP LPC32xx MIC, SIC1 and SIC2 Interrupt Controllers
>> +
>> +maintainers:
>> +  - Vladimir Zapolskiy <vz@mleia.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,lpc3220-mic
>> +      - nxp,lpc3220-sic
>> +
>> +  reg:
>> +    description:
>> +      Should contain IC registers location and length.
> Drop description
>
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +    description:
>> +      The number of cells to define an interrupt, should be 2.
> Don't repeat constraints in free form text. Drop.
>
>> +      The first cell is the IRQ number, the second cell is used to specify
>> +      one of the supported IRQ types.
>> +          IRQ_TYPE_EDGE_RISING = low-to-high edge triggered,
>> +          IRQ_TYPE_EDGE_FALLING = high-to-low edge triggered,
>> +          IRQ_TYPE_LEVEL_HIGH = active high level-sensitive,
>> +          IRQ_TYPE_LEVEL_LOW = active low level-sensitive.
>> +      Reset value is IRQ_TYPE_LEVEL_LOW.
>> +
>> +  interrupts:
> Need to list and describe the items.
>
>> +    description:
>> +      Empty for MIC interrupt controller, cascaded MIC hardware interrupts for
>> +      SIC1 and SIC2
> And then allOf:if:then restricting it per variant (interrupts: false).
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    mic: interrupt-controller@40008000 {
>> +      compatible = "nxp,lpc3220-mic";
>> +      reg = <0x40008000 0x4000>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +    };
>> +
>> +    sic1: interrupt-controller@4000c000 {
>> +      compatible = "nxp,lpc3220-sic";
>> +      reg = <0x4000c000 0x4000>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupt-parent = <&mic>;
>> +      interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
>> +                  <30 IRQ_TYPE_LEVEL_LOW>;
>> +    };
>> +
>> +    sic2: interrupt-controller@40010000 {
> Drop, two examples are enough.
>
>> +      compatible = "nxp,lpc3220-sic";
>> +      reg = <0x40010000 0x4000>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupt-parent = <&mic>;
>> +      interrupts = <1 IRQ_TYPE_LEVEL_LOW>,
>> +                  <31 IRQ_TYPE_LEVEL_LOW>;
>> +    };
>> +
>> +    adc@40048000 {
>> +      compatible = "nxp,lpc3220-adc";
> Drop, not relevant.
>
> Best regards,
> Krzysztof
>
Thanks for the feedback. The fixes will be in v2.

Best regards,
Leonardo Hirata

