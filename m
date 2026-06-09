Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D003624C2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Jun 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018211; cv=none; b=A4dQtScP1cSHstFP8m5qmU6MvXvGjUhJ5yLF7/w4ubi9sVvAB4pxGI74w/DBubl57+HPkE/KLUz9jbURKA9RlLP9bDu0vEsEJKpYppb//eGevn3nv/lefTHsYnor3nuoMj2gbDuJ1V+RIYhbAMnhYRRNoEkS2ivoZzjhRi+cFqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018211; c=relaxed/simple;
	bh=A9tfClX8Q5B176EdrnPRG4VsIQcWv2vxdIc/A1y7sjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ej4Dj0PHGoQheQPgcvtSZG8HoVdqjZZeBhcEtk0Lj9jh3vka38VVi6wmcAajvxhZHszWzIJsr0tL9RApz2fDCsY1RWpfJA6Rx9FQ8UMP0nhPQEp76b11UWJ+t1UHa16lQWUT+uYKX+6gbPnIHoWrsdcd1sTZVarxNEp4M7QqRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5BBqLaA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5BBqLaA"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c858b5de728so3653950a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Jun 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018210; x=1781623010; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2OVhVGvDZE7tZDpbh1B90htiaNt432NF1Wdfrujw3Q=;
        b=i5BBqLaA+ctS70f+xBaRj5TH2Lt7PAgUEkWTSZ5ixLV6r92dGsiYTeMRXd8NcRMbky
         7Wgrt7NzsqgTlvh3f8tvMQWo9gGYF/38v4ekxedx9/2XNn+F2iFb63C3udRczIsSBdOJ
         dDtsBUlHCs6Nv7Shv3+CMu5Whwd5vKUsqhrPF59NP5QGL1L4O1WZC3mgqefONS32NYF3
         o0rMYCOmsAk6jJ2MArMKhSwxkuUO5syaQaDqqnjbxvWxzm9MSFsgdGeTrYx1yzz4W5qF
         D2wciPpee0T8HkqPAkNxnrR/7e5C3lOvX01AND/r0xcevSDqWc6a2q7m3msWuDNOM4ro
         y9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018210; x=1781623010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2OVhVGvDZE7tZDpbh1B90htiaNt432NF1Wdfrujw3Q=;
        b=aG7BweI2JcPEq6D0/xDBIktxFo1u/Oir3oSW+65G0A6XCmCbeqavRzzZjTOqpcnahd
         /EIWBpgGJa5YL58L5bJs5d+/qqq372YCuWmWKBeY8iwKQOnojEC+6JTQnJ0Rd6TaQ3rR
         FATu6KT1zi2mOeliOJQH4pGXIA7qVJ6MNBj5Kkmwt9N5jp+Iv8WRCOa5g13A344/TUC3
         O0V8Kj4AANYEz/npX9+jiEdQ/BArSv6oJ9KXoZapFZexc+JK3TXqkbEMCvORyA/bC44t
         MLvBhFFhQAgZmv1nKfmC7YPks/ClLC/3xCtTl8Yf2LjdSc84ZGvprGAjkYvDqjevSgIx
         j6oA==
X-Forwarded-Encrypted: i=1; AFNElJ9tR9JRNGQ1YkpW5/PJXgeqJ9wiCG9l+f+6Wc77YfDCUvXMG5PtU8bAJYJp96ejalw5el9FTHjQ6vDWtc3Wg7lUv8ib7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoXYeHzkSijqnrwlhF0opir6/I6SnGa/PG3w+jI/DhT3IhkOUR
	ci+d7Lo4ODhkte5gCHvhckvr85KwFnoAxkikk3toTAdj1/yDw5D0CFaA
X-Gm-Gg: Acq92OGN4SplMHZwl91L/nhuryF6nRxMORHGl+gts1EvItBtbhssmYa6dtJjM3r4c44
	OkZyxX2j2UedH4T61tZsLRFh+Bkfj8vaa9FwfhSxb+JV2IZatHlICujqZgYswreYUBXsEAVk0k/
	+oM5+h8of+OkAK7HrT3QwhuCsH6LirHFFbQRdC1egDX//euqNN/TGgMFgXUMZ0e+zmVP5QQchMN
	SdCR9g/Iz4oPexb0+A9uzodXDQ+SaRyRKS9HTeYSO9aXpi8gDq1U4Ip1XdIITJAmny09KOSkwmY
	CI0CWo55Ye2dcFEj/3ymc0q6QgDzAzblw0tcropldqHoUi2RA97WZctLAOBqqkPAYwvb4NThkP0
	QYgQ6nOK3HL0s2tr0v5tTfW9b+djnNGHbWIbta4H7HqUJMuTj7Bda00mpABuIp5vUNtpfbphToK
	OMgnWX5sbwbnddzsaraTJ6scGnV6K6IV69Pi7BPG0xIKvZwuVxTctnCLQwUn34anDcxHdjDwijn
	bfQUz3BiOE4nBi76FBYaJT6s3lvLl5xmIMHl48EMQi7bw==
X-Received: by 2002:a05:6300:67c7:b0:3b4:b30e:1b4d with SMTP id adf61e73a8af0-3b4cd04c26cmr28149436637.40.1781018209653;
        Tue, 09 Jun 2026 08:16:49 -0700 (PDT)
Received: from [192.168.0.100] ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03387asm20355865a12.4.2026.06.09.08.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:16:48 -0700 (PDT)
Message-ID: <c6cc71bc-7256-46a3-ad4a-a1ec4b38400b@gmail.com>
Date: Tue, 9 Jun 2026 20:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: dt-bindings: octeon: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20260607142356.2844008-1-ninadnaik07@gmail.com>
 <20260608143259.GA2569066-robh@kernel.org>
 <20260608150040.GA2675433-robh@kernel.org>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260608150040.GA2675433-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08/06/26 8:30 pm, Rob Herring wrote:
> On Mon, Jun 08, 2026 at 09:32:59AM -0500, Rob Herring wrote:
>> On Sun, Jun 07, 2026 at 07:53:56PM +0530, Ninad Naik wrote:
>>> Convert octeon-3010 to DT schema
>>>
>>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
>>> ---
>>>   .../bindings/spi/cavium,octeon-3010-spi.yaml  | 67 +++++++++++++++++++
>>>   .../devicetree/bindings/spi/spi-octeon.txt    | 33 ---------
>>>   2 files changed, 67 insertions(+), 33 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/spi/spi-octeon.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>> new file mode 100644
>>> index 000000000000..3dbbb4f3c104
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>> @@ -0,0 +1,67 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/spi/cavium,octeon-3010-spi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cavium, Inc. OCTEON SoC SPI master controller
>>> +
>>> +description:
>>> +  The Cavium OCTEON SPI controller is an SPI master controller found in
>>> +  OCTEON SoCs.
>>> +
>>> +maintainers:
>>> +  - Mark Brown <broonie@kernel.org>
>> This should be someone with this h/w. But there doesn't appear to be any
>> OCTEON maintainer. There isn't any .dts using the compatible either.
>> Perhaps this driver and binding can just be removed?
> Maybe not. Seems this is used on newer Octeon platforms like cn7130
> which aren't that old. Some Ubiquiti devices use it and run 5.4 kernel
> with OpenWRT:
>
> https://openwrt.org/toh/ubiquiti/edgerouter_4
>
> Rob
Hi Rob,

In this case, should I keep Mark as the maintainer?

Thanks,
Ninad Naik

