Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106A14F82
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMqojyAT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBDD542137
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBDD542137
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PMqojyAT
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiZorcoCcgdr
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Dec 2023 10:35:13 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED444418CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED444418CA
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c69ecda229so1407334a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Dec 2023 02:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702031712; x=1702636512; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkstX3w9e/qo2fPuZVECh8CFuxP6tqluCbnekESxGuA=;
        b=PMqojyATvj+fWfFFpzAM6h1Dmf8MJPI/xUlMigkieeupkSpewbJJyW0rPWbuRVeavl
         er019K1ZhgbsR9qXbNkUXwFwb6rF+XutuTcrnDN8xuzAUyhGMes/EZOkueRzDpvADUjg
         QqwgLZCipS/nakTvD3XuSoPQhme1ZCkhUFPva2ekJeB6AuFJI1MUwd71k4B4N7+lpT01
         8HUSm/YDz5Tta3AuF8MP+GXhwsQmGVdhOeMp++dZlEpQPmOrPA7P8aGYY+iV1kZqvuTC
         3bmfgwDipt+F1pwfASwkkxguglStIkckococ4V2SId8XlTliQNP6xHUupxdiEv6R6er2
         m3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031712; x=1702636512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkstX3w9e/qo2fPuZVECh8CFuxP6tqluCbnekESxGuA=;
        b=c+mOBLcIsGs3G/grmdQpHSNkq1mY/oDO7LDKwROXwcjTprfO6kbWJGd/O/XpJhUyPe
         +Wo4pJD7GZuNfH/4tq+ShqfmO+mKBFTsAa2i1pgT7Ra7vzYeLD5H+JXx/S2J1gM9tKlo
         Zar8HbpNYauqjO2in+K9EQt/a34t14tyzUg4Ytg2vGemRyOtYO2vN2MMenk1vghpIg0T
         KzinR6sXKOfy1KpXq3vo0LQdbne0ATVrxoaXR6VlQq+ozpJX6Nhu0Htroebz5QAf4D7H
         rKHE2/HHvKBBHoQvjguBpwVOxqvrudgvAqkZhOJDBrxdH+ttN8azTtIjC4oR4zOBb4ln
         YITA==
X-Gm-Message-State: AOJu0Yws17AVsreSgKC8kYgw7mGCvmpsa5ZX4UAQ9LAoc3G8TJcwwjk7
	qgGIZrYBVqq11WARajRa9R0=
X-Google-Smtp-Source: AGHT+IEhpNDojxW+0Ttl1fp4tHVdUq1V52TPsbSHLo5etmkQs5V52RtMAzIj20+8QJ93iT2CGJKy0w==
X-Received: by 2002:a05:6a20:e11c:b0:187:c662:9b7e with SMTP id kr28-20020a056a20e11c00b00187c6629b7emr4544880pzb.25.1702031712168;
        Fri, 08 Dec 2023 02:35:12 -0800 (PST)
Received: from ?IPV6:2401:4900:6277:8af4:45bc:8bc9:c94a:54d2? ([2401:4900:6277:8af4:45bc:8bc9:c94a:54d2])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902aa4a00b001b86dd825e7sm1351866plr.108.2023.12.08.02.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 02:35:11 -0800 (PST)
Message-ID: <61053bca-6a6c-4eed-90f8-df43f7c804cb@gmail.com>
Date: Fri, 8 Dec 2023 16:03:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231208075037.114598-1-anshulusr@gmail.com>
 <c8e4d495-1d4e-40cb-b599-5a01f75f9257@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <c8e4d495-1d4e-40cb-b599-5a01f75f9257@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/23 15:57, Krzysztof Kozlowski wrote:
> On 08/12/2023 08:50, Anshul Dalal wrote:
>> Convert device tree binding documentation for GPIO attached mouse to
>> json-schema.
>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You cannot have v1 being already reviewed. This is some newer version.
> 
>> ---
> 
> Missing changelog.

This is a copy of an earlier patch[1]. Since the patch had been sitting
idle for past 10 days, I reposed it with the Reviewed-by tags added in.
Please let me know if this is the right way or if there is need for a
changelog.

[1]:
https://lore.kernel.org/lkml/20231126103029.851742-1-anshulusr@gmail.com/

Best regards,
Anshul
