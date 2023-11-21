Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111103E47A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpmCqB0w"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8835061050
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8835061050
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpmCqB0w
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xpk7Ds7z6RC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 12:54:54 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 54D966104F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D966104F
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cb7951d713so1727288b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700571294; x=1701176094; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APDg0JFczp621Nji+tuh/Qlng7+/H1U7mmX2HOaGoF0=;
        b=FpmCqB0w7Gk8K+QfpzkD2Og+1AC8qsry+jb68lu6VnFfg+NQjvF2hk+qlQFzMnieb6
         cujHaSppyAlEADOFa0u+At5EKJ9VmUk3oy3gucOHfofln5eXeBu4U7ZCaSU73EJiVSib
         4LdPtNN6opgWTtP+ViOVlCaUvLNaCdbvqpEnw0EsSLwgO+woGQCAL2clDPPYeT25qnrk
         DHEfYG9qWEa1k6HUXxxpij9olyZ8axn3vaGhx+R9i64YBbpP1fpeuVcsOxyfdj925x49
         duQvobzcNOV4eqgaq/hsJkgn7imvoQuv3BB4RsFMEepqTkYrzx3FR1tUfLIEDhpTo4Yc
         rE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700571294; x=1701176094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APDg0JFczp621Nji+tuh/Qlng7+/H1U7mmX2HOaGoF0=;
        b=ZDvC1TExaV+otArIPcRd6jNkE18z481n0rDKWHmaP/pfKr38Mz/oKXLAtCxS4hsb7p
         c8yai0qhP1QHH2bbXAndE8qT19hNnbCTxANm5U2SMnZZVEshadzOmDBzc8/3X/g145ru
         LeNcK4obM4rpFMId6pQcubTSh5j4M3LDeltgFP12ET0toElZEDO/moRr3FGVFLg6IRkq
         pW2/5ZmFfgXJ54QhWfNJy0kiK/naobOFg29TjMlFU7osWuAmLQKbu8odvZ2bdM54kgYH
         8hQR/uS5LOZ4+PpL8HczNs3nV+pJb6KHM8RwoYOlajhQVEP4LSHGa1IyYf0E9pT/AkW6
         +hRQ==
X-Gm-Message-State: AOJu0YxfiOHhHWuBYDPpj5KpGseaNMnAmzED44iJ3RpGeSf81XVZJf+P
	qC+JGQD/Poreiw3Pl1tJsyU=
X-Google-Smtp-Source: AGHT+IEngvPw3d1IsOspFoHzqgu/DzbyLuPYIK3Y1V0BGB6MjVoi327NxD54joKaxDn6U5QAvanzfA==
X-Received: by 2002:a05:6a00:1486:b0:6cb:440c:1f60 with SMTP id v6-20020a056a00148600b006cb440c1f60mr3775560pfu.13.1700571293618;
        Tue, 21 Nov 2023 04:54:53 -0800 (PST)
Received: from [10.3.171.174] ([103.4.221.252])
        by smtp.gmail.com with ESMTPSA id u9-20020a62ed09000000b006b8ffc49ba5sm7828157pfh.38.2023.11.21.04.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 04:54:52 -0800 (PST)
Message-ID: <bb6d239d-0fb9-4353-b262-92810861b8e8@gmail.com>
Date: Tue, 21 Nov 2023 18:23:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeff LaBundy <jeff@labundy.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231121123409.2231115-1-anshulusr@gmail.com>
 <1bd2a6cc-aa01-4370-be19-88ffa524086e@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <1bd2a6cc-aa01-4370-be19-88ffa524086e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/23 18:22, Krzysztof Kozlowski wrote:
> On 21/11/2023 13:34, Anshul Dalal wrote:
>> Adds bindings for the Adafruit Seesaw Gamepad.
>>
>> The gamepad functions as an i2c device with the default address of 0x50
>> and has an IRQ pin that can be enabled in the driver to allow for a rising
>> edge trigger on each button press or joystick movement.
>>
>> Product page:
>>   https://www.adafruit.com/product/5743
>> Arduino driver:
>>   https://github.com/adafruit/Adafruit_Seesaw
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 
> Previously you sent untested patch. Did you test this one?

Yes, I have tested this one.

Regards,
Anshul
