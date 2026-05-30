Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445F29D291
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170703; cv=none; b=rO1qnky1HRx30jYumWvvodgGkAXDfd+u6v5ufAqxt6b1hFfGY9FZFuQh65t1J56MJb+Kh7ELQalaB5xaWLJoHzjkNNw9wzqBuqxavYwZU7BKDWh68ydpXnAlrc3kHxT/yV/vcPqlFlzaiF2rX8DUX2meMNaP7yDdrOHcDN5Xys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170703; c=relaxed/simple;
	bh=afSC4jVwoq9wJZAIow45WnW1XZnhKA6USnmIw+3RvJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIVaMy6EQC3NTkt+p5vQUkTQfcJgs1TYxvB42NjUUetH27aSTCfdn+jylYzS3R9T26jeGKiz23dfrMlPWrLQiwcGA37e+yB15GRHVs6czD3+opA15MAIPfTw57riXXBU39ujoZrTsGvmtbxQoSklSNov7sw/qE/MhrvOIA3/2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxDW/mtB; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxDW/mtB"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1692018a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170702; x=1780775502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUPVDO4TuLnw66Ni1+lzz4Gz256nyEweInp7TugqCsg=;
        b=qxDW/mtBIeqtqS/wAi2nBgQ9Eis0NJpFaVg/tY5OoatzsZJnTLvgljdMx5mgkrpFCS
         46MGF7MQf3632l6E1ZIEB+GfCc1VjwZP0xhVPLCUEZWnPrNLOU/EaXeHIq7iZd2tbw9Z
         r6DTCOWr6sKyPDM39FWe3FBT3+9CJmcoX4zfs2tLwSPPB/osS6CnL8jEjSDPgKbhDvRC
         +tgPwpHGYb9ZQnMjn90svNtKct8cRMTJkFkeA3cknLxDoBrOWwkFInX/KArhuUhW1upT
         v+vLN8n0iYe6ixx9mjB/xJ4CeSXFdMTM+e+707hqFA3/DbM9bB4bDuKXlabFZYDbKkP0
         RTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170702; x=1780775502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUPVDO4TuLnw66Ni1+lzz4Gz256nyEweInp7TugqCsg=;
        b=dRwYz+cvDEMQ10NGU0MyIY3uxDdlC9yCMgmXmt/VMAuoFJggLZ6pcJW4JecgGaa8iJ
         PCmdCEIdLjW6hDVAKt92YviHeeNQxF2O8XVHdbmAAKUAE3op8tVZkHkE/83jD8cWBodz
         Z22yNDjL5Dgb1VN8aWU2g1cSYyF0vWpFFUzZzKJh9tLXpeiO4Fa/gP/dwRaisP93ny0p
         D7Emc4YJIPVLv+IVjSOwUQhbhBHyyJe7yKKHFaqgr4Y649HzUShW/9ZUXfl6lUHy/BzW
         M5Vr7mXBaGI8m+0I+KWnfq24YI6JoxNkTSDWY69yjt1dZF3Vgpmpm6GbfNoBmLSn6shW
         it+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/zk3Wj/jqJTQchBdPuJgwYVxHXonudNG5533GkecDk/z6a7sgrW7rbrl/8lxFbcKQBN5fmgbFUBiTGus0tJqy2m9wC/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXFpe0KJ2bS/4rzWBJd6DHf74izeVenQmYERMdTxOF/2Ob79uN
	3RYo8o6Gj33mvYYJAdYoivv+KKFK7t/HU7okjMxKCBa/jxVXOrHxMx9D
X-Gm-Gg: Acq92OFYLfKDUDNrDs5wnhqZkVvBc2bzwehOUBjery5zAoK797W+yhp8F1cM95VvO0B
	zRAzSsE+z9g0HzpwwbWtYgQpkM7BRCGXz0bw2unXaXqujvSYdd8zRA0ScGNJhtW75FIFXOt1ciy
	QmiV6fcMPe9LRLMn9QQSyXVYVU2ZYlCEXYc7qdY6NROIqlTkpAT5svfVpp5oHMfAYwU2jCCAig+
	DVy/nXCkSyNWiDz+lkty+m6qBBRctDtzl7w5Ca6IveaAk81ZNZoOa9ZLt0hDedJGDAxBOiipD/P
	ARCfDax36MrSC6+JzqEa3bfjPXeFzCPTyCl/6mIMTyHIgmyHqxPzVXm8D2y8KRhK3L59ntfCOEL
	RAwwRRcDI7jaVL1T2eUHUI2DjgFk9UG4RFYkK0hz/e7LP22508QccT0s9pIseHK76H8SgaP/iQC
	LL7IcPr0jGgqKR/2keuttRmn+FcztYFGR6m1VBic05VWIAepmFqGj/zI/2OsfJlves8KRiXVhmr
	nszgLL0szBTi4/6RX4XuozW59MrJLRdmtvjxwgR0Kuw8g==
X-Received: by 2002:a17:90b:1ccb:b0:36b:ad81:c134 with SMTP id 98e67ed59e1d1-36c4ff410b9mr4361367a91.10.1780170701892;
        Sat, 30 May 2026 12:51:41 -0700 (PDT)
Received: from [192.168.0.101] ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdb5c91bsm3439199a91.1.2026.05.30.12.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 12:51:41 -0700 (PDT)
Message-ID: <be560e03-ece5-4dc9-ad8a-907e454e9a1f@gmail.com>
Date: Sun, 31 May 2026 01:17:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
To: Conor Dooley <conor@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonas.gorski@gmail.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
 <20260525-wreckage-gap-9d857408445a@spud>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260525-wreckage-gap-9d857408445a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +patternProperties:
>> +  "^led@(0|1?[0-9a-f])$":
>> +    type: object
>> +    $ref: common.yaml#
>> +    description: Each LED is represented as a sub-node of
>> +      this device.
>> +
>> +    properties:
>> +      reg:
>> +        description: LED pin number.
>> +        minimum: 0
>> +        maximum: 31
> Is this missing a maxItems: 1?
Thanks Conor for pointing this out. I will include it in v2.
>
>> +
>> +    required:
>> +      - reg
>> +
>> +    unevaluatedProperties: false
> I wonder if this should be additionalProperties: false instead, and list
> the three properties mentioned by the text binding explicitly?
>
>
> Cheers,
> Conor.
I added unevaluatedProperties: false because my understanding was
that explicitly listing the properties inherited from common.yaml would
be redundant.
I'd be interested to hear the maintainers' preference here, and can
adjust this in v2 if needed.

Thanks,
Ninad Naik
