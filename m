Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB0125A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1a1MrJ9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9802960DC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9802960DC2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d1a1MrJ9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOH-bELDKJWc
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 19 Dec 2023 08:45:14 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4162D60A7E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4162D60A7E
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cdc159034eso37656a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702975513; x=1703580313; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX75w/xyd5E4hq9OpOdbbEfwOMXrJ9s2JNpMiA5zZgk=;
        b=d1a1MrJ9t8KgES+A9uHvK4nqH1j5QTqm7qTtKmCPysqZmrEYnbQEJ8W/ISgyi9EaKj
         +zNnB0DFfdCskAuyBj/1T7IA08gx+ioaSmeJt301FGn9bvr95flXrrm0WTBWo7gSnabi
         u/Wr95ayvKjqVFqz2gPwkLIoCYxAU7ap9AnxgzCP1zEsL1WsC5Z4LzMPSEPkPY15Mjj2
         IFG+NBJbNUjQfv4RF/YXlEz+KByDZ5Ufs0wxKTWnZO5CAberLI16u8bhCMAlSZ6IHcgl
         epNo06p6mr4BDI3F36wIvcAw9QcQAj9A4nOM+Z0gycEjbBTVkDJT8/81TgUOGM1oG3og
         YI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702975513; x=1703580313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OX75w/xyd5E4hq9OpOdbbEfwOMXrJ9s2JNpMiA5zZgk=;
        b=nZFw6OWJKfdUYr/L8neGW731AcELDnuP02sP4b0fJEDJ2qA4+I3tJXMdFGhQqwCpDU
         myCJ5zmhPjD9IE1IUvJJQf/5dRZgiEI1Sn4ivagupEK8uhqu7o1srgRKjZTReHw3PLqn
         ryTmd+TIwWrVdxeUItPYNjaOQ3i+KNZLyUSDPxURvRqHogyrcx5ve4DLh0JdtFBefrhD
         3oFyp9LwSrFTcsx7lZ+3RB7K8/UGLqshJssgpPp9ZTl155XDhjyCBfdvytN6m0VsOVqb
         qOcv0RvnPeg2gKAWpfIe2+rMfYtcgnY7UpkqXSOTdF/r1Ajkfc26qA2Q/8oaMQCTZsFa
         XQWQ==
X-Gm-Message-State: AOJu0YwkTJDWCaEPkrz3Gx3OsYrCfl3Nc93ErgFrtlfOg3bmvyF+WeEl
	oi0SBpsUgJ9gYKXdYAHGrAY=
X-Google-Smtp-Source: AGHT+IFK/thGv+qIApRNL9M8QxfHBu53kxqrBPtkirj1+0RUsdv/qlvD/RCdQERCJtVFdrSe1i3yHw==
X-Received: by 2002:a17:90a:f2d6:b0:28b:313b:7cba with SMTP id gt22-20020a17090af2d600b0028b313b7cbamr2379844pjb.20.1702975513360;
        Tue, 19 Dec 2023 00:45:13 -0800 (PST)
Received: from ?IPV6:2401:4900:581e:798e:871c:98db:5638:a4? ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a000300b00285cc7a867esm1057300pja.0.2023.12.19.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 00:45:13 -0800 (PST)
Message-ID: <6c1e13b3-28d2-42fc-b9c2-dcfc4793fc39@gmail.com>
Date: Tue, 19 Dec 2023 14:12:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: add MCP4821
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231218164735.787199-1-anshulusr@gmail.com>
 <f8aaf7b3-fa17-495f-9c1c-9ddf6fb41d8a@linaro.org>
Content-Language: en-US
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <f8aaf7b3-fa17-495f-9c1c-9ddf6fb41d8a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/19/23 13:29, Krzysztof Kozlowski wrote:
> On 18/12/2023 17:47, Anshul Dalal wrote:
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vdd-supply: true
>> +
>> +  ldac-gpios:
>> +    description: |
>> +      Active Low LDAC (Latch DAC Input) pin used to update the DAC output.
>> +    maxItems: 1
>> +
>> +  shdn-gpios:
> 
> Open gpio-consumer-common.yaml and look at entries there.
> 

Should I name the property `powerdown-gpios` instead of `shdn-gpios` as
specified in gpio-consumer-common.yaml?
Furthermore, do I need to add gpio-consumer-common.yaml as a ref?

Thanks for your time,
Anshul
