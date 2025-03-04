Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C5273FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741051646; cv=none; b=WRWNhpV/vAuXbKSjjbOWk2a9xyFKO5xoqLo+s7rMWn0mFpwPA8RS8nloeK7Ryt4XW7z4WNJysqwPihzNBhs5s7GD/25+ixH84TQO/yom88EeMLt1QyF2u6Vmun+/izz3m5vqNNZ4/VPe6Z3RkICYOyDg3WxVog0D2sOLiuuuYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741051646; c=relaxed/simple;
	bh=YQeiOsS8sA5NXZ3BRFyUMePzRT1TRZE82gnAlYurqyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGQOsXwCsm3nXt8UlHdGciFgqUA+FsJCquo5YOzGxbzoqOo8FsT5f/B1OpiZoJNmoO6QHD3pnmJDd6jDR0wB2QqSo3H2kQtayMVw69lfQLCgxgtDh/1AyYLBKM7C/3TB53YJZI6L5+CpX3ughUUCRL9huX7I9KaONJpNSmLKK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln9/3Sbz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln9/3Sbz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56647812DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 01:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_7QFOQHo0cx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Mar 2025 01:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FC1D81123
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC1D81123
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ln9/3Sbz
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3FC1D81123
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 01:27:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2232aead377so98858815ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 03 Mar 2025 17:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741051642; x=1741656442; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBEXUn0LmSyIKU3EkgV+cVlF4cvjhGTO881KNfj3fOo=;
        b=Ln9/3SbziA40lXsJj0EtX4EFnCNQjfUvSnqUznInQy1lfEua6Ig5/7LHqndzqual4E
         wgEcb2Qge7yKA8QCXjrFRddkA41UoG6DrP5BiNis4w/pyGxBkggA3L/YSIOD+e1M+lKn
         k7M+sY7kByL+j1euVBIUIzsu7EzysAigyNne0U/PatVoNPKJriFWq0ane6GBzX75V++o
         dolL88juY/RtZ9WuDfWN4mZIqa631Hshhpp0lRpXOhCNM6TTpbISQXT0S/UEkQTAHkl6
         19fpJ67heKH+sAvANCgcNneMuvXKzysrYSMaHPP7tGwjmqtfw8txgkhQgox+dL4kaSbD
         d+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741051642; x=1741656442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBEXUn0LmSyIKU3EkgV+cVlF4cvjhGTO881KNfj3fOo=;
        b=YyGPyLV4fEc4tt2vEdXYkvogqN8t1Oa9SNLTX9MR3aiCEVazoXTVIFQKvOhWmfCVpi
         qXzkpkPlNuyFqx5y5Vsz0crYK7u5q2yKZwzQgyof+BoIlm7mCnE21KQMxf4UyJs62nhJ
         RrwEo8/jOmf1O8gV6YnOVqxYI3SUPxuZaUy67VqQwkscaXqXlawoQRjj9S+idAIRSN9N
         f2KrvDY2UjOZVo8h5r4uZCAktU534fXijzCsuoKuxLZOg4LmdBViKTNV7WyH2wlZIr0V
         EpFgoTaGmiQr9XVuywvBIc4FRlNyQ4e+mS3TjyQNjHcppTgn1TAz9HvCIwWJHh7bdYja
         1/8g==
X-Forwarded-Encrypted: i=1; AJvYcCXdwmH6P5kzaT2e+SOu5clvDdYo802v+iC4Z5tdqfJ1tY+IT0C1La+98rN1E3PVDBs7EVkz8OEomzrwh/UK16kmZ4FIXQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxIDimeksosK0MYgkB+s9UHuoJhd/PXglhvdpess8qMzmVOYS/9
	8cGfTcb2uEsTJyrh40OLf5clllo5NUiTskWgpssiB1IqlznUciWE
X-Gm-Gg: ASbGnctmJqR+5VnXlKl3XnlOGelz6K1Fwgdx+uJtsgCK1B57DQjXbvDHsz2svoNCD1g
	LccrdeH5KRBkq47UlbEAA2KjWezsxHXzHbFcxxtdPquOVrDQiDA0hNIJD5LJcI5HltWbu6PK5dR
	5AlewMe4fG0DrFcKgWJ4GsLT3VGEG4XbDTghl+n0F4NX/UsQyNwL7DH9NglnZmmQ6Q50R7kQpif
	mRmyiGDyuTBpv3D1FrVhF0z1CVFjvVKQP7dVdMVwxpMcLgRa5AOP4/Gyf/26YZyA5IJwSwq/Ifs
	8knkM7ZWr7d27JrdLVjuLzWbuexhlrKQ5aTdP/uYE4sVsgHtROqZ4Uk67o7d3w8pLmzps3FkshP
	lVObyyeMpigyZZnKcUg==
X-Google-Smtp-Source: AGHT+IEr30nFCYMOZeqRuWFTTayl8S2lFSGhI6eVrpSdWMcqpU3UpkD71EK2TZWiBnLaRqXGpuCfIw==
X-Received: by 2002:a05:6a21:4c85:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-1f32c559139mr7168245637.12.1741051642433;
        Mon, 03 Mar 2025 17:27:22 -0800 (PST)
Received: from ?IPV6:2804:14d:887:95a9:849b:933a:ba2a:b462? ([2804:14d:887:95a9:849b:933a:ba2a:b462])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf20b8sm8989367a12.7.2025.03.03.17.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 17:27:22 -0800 (PST)
Message-ID: <7ea9fb0f-f7bc-49bf-965f-631514abf9fe@gmail.com>
Date: Mon, 3 Mar 2025 22:27:17 -0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
To: Vladimir Zapolskiy <vz@mleia.com>, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250228034021.607135-1-leo.fthirata@gmail.com>
 <09acba97-70e1-448e-8453-c4e1f67a035c@mleia.com>
Content-Language: en-US
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
In-Reply-To: <09acba97-70e1-448e-8453-c4e1f67a035c@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vladimir.

On 03/03/2025 1:27 AM, Vladimir Zapolskiy wrote:
> Hello Leonardo.
> 
> On 2/28/25 05:39, Leonardo Felipe Takao Hirata wrote:
>> Convert NXP LPC3220-MIC to DT schema.
>>
>> Signed-off-by: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
>> ---
>> Changes in v3:
>>   - Add interrupts property description
>>   - Fix interrupts items descriptions
>>   - Remove else condition
>> ---
> 
> <snip>
> 
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ 
>> nxp,lpc3220-mic.yaml b/Documentation/devicetree/bindings/interrupt-controller/ 
>> nxp,lpc3220-mic.yaml
>> new file mode 100644
>> index 000000000000..59e8814a15b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interrupt-controller/nxp,lpc3220-mic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP LPC32xx MIC, SIC1 and SIC2 Interrupt Controllers
>> +
>> +maintainers:
>> +  - Vladimir Zapolskiy <vz@mleia.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,lpc3220-mic
>> +      - nxp,lpc3220-sic
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  interrupts:
> 
> Please put here
> 
>    minItems: 2
>    maxItems: 2
> 

I didn't add them in this patch because example-schema.yaml states that minItems 
and maxItems are already implied. The following code is taken from the 
example-schema.yaml.

items:
   - description: core registers
   - description: aux registers
   # minItems/maxItems equal to 2 is implied

Besides, adding minItems and maxItems triggers the respective warnings:

- "minItems" is only needed if less than the "items" list length
- "maxItems" is not needed with an "items" list

>> +    items:
>> +      - description: Regular interrupt request
>> +      - description: Fast interrupt request
>> +    description: IRQ and FIQ outputs of SIC1/SIC2 to the MIC.
> 
> Having both two descriptions under 'items:' and another description is
> excessive, please leave only one of two.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nxp,lpc3220-sic
>> +    then:
>> +      required:
>> +        - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    mic: interrupt-controller@40008000 {
>> +        compatible = "nxp,lpc3220-mic";
>> +        reg = <0x40008000 0x4000>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +    };
>> +
>> +    sic1: interrupt-controller@4000c000 {
> 
> Here sic1 label is not used, please remove.
> 
>> +        compatible = "nxp,lpc3220-sic";
>> +        reg = <0x4000c000 0x4000>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +        interrupt-parent = <&mic>;
>> +        interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
>> +                    <30 IRQ_TYPE_LEVEL_LOW>;
>> +    };
> 
> After the fixes please feel free to add the tag:
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> 
> -- 
> Best wishes,
> Vladimir

Rob,

Do you want these changes on top of what was applied or a complete patch?

Best regards,

Leonardo Hirata
