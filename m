Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF5CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 10:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FAE60B65;
	Thu, 12 Oct 2023 10:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FAE60B65
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0s+vPKa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrgEou-3oPHF; Thu, 12 Oct 2023 10:55:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA2F2607F1;
	Thu, 12 Oct 2023 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA2F2607F1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF483C0039;
	Thu, 12 Oct 2023 10:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3899FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E79A60803
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E79A60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quWj0jQVKliG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:55:22 +0000 (UTC)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01C3F607F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C3F607F1
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c4b9e09528so526080a34.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 03:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697108121; x=1697712921;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x3KnRFbiMBM4MEwZD3vZNUeQUH1/byVeDQygOKbchgU=;
 b=V0s+vPKaIkCu8JlYila8Qle7uO+XvaMSA3DydzAWVGIi4PBGimvdKt5idQIlZD87fg
 FYxfmcFMgssdG6742XrMjqJItKavstirTUq6lrQ50BB4j6hro27H4lokFLdhK+qg6ATC
 N3dqDdLvq4WxhIHi3HKMIXWp8AMRTXtMY5OoYsj8Va6PSLTO9XRrvEWlpBdqpjEIvqco
 mRZr++7Zvrt4XNg74GsaLCQUjqTw8nW4s000S8aqA0ZX3Re3eSGYDRw1WFZ5dKAv4GA4
 8YmpJm6uoHNHmQshr9vk8tvn6MxX/WaG0ZFPrelpiy5DseKJ3GLpsLTf2k3UPWEWufDi
 onJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697108121; x=1697712921;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x3KnRFbiMBM4MEwZD3vZNUeQUH1/byVeDQygOKbchgU=;
 b=dSji5S7IOUwSp41LtCZ1HlN90yQZtK/LBCB64aasf9OCcDfvXcWVQM7ZTdAnP5uW3n
 BxeUp3h+VOSUvoYdGtOoO9HQzOeyqOMkisVlPY6wzZX2Tz8UUDF8ergTsXnr7Bsg6Lia
 yWkZYgSmyiEKzHW5GvAuSeS+Chco0rHCSyGZJ4HEOx/73Yhl+1L6/pxELA3aS9rSI7ec
 JzxCJRHxl7gmdmJjWpVLFbOLyVeUmq82jaLkxyNDDp0ipWMB52dv/tC2GDFvZc39MSMW
 pKa8SAqA74J+HT7lco3fzP2GEiVmHcM23C/1snY0PDw3hyffAFc2A2ZEfPOzpmThD4oG
 +5Ew==
X-Gm-Message-State: AOJu0YyaO44Wa/AG9H+CBLDPb6I7AV5Lk2tVV7ckN+ef8+Vv3UyhaVMz
 blsREiHBta9MJFzK8pX0c+M=
X-Google-Smtp-Source: AGHT+IHAoOJnsEI7SPBYfqlJ56NdhKD+FcQimx5Qlw3wyLT2TBtJDEUg0+ZXi811IaPilSrGm0fGZw==
X-Received: by 2002:a05:6870:671b:b0:1e9:8a35:863a with SMTP id
 gb27-20020a056870671b00b001e98a35863amr6155284oab.20.1697108120826; 
 Thu, 12 Oct 2023 03:55:20 -0700 (PDT)
Received: from [10.5.253.103] ([103.4.220.252])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a637148000000b00589b7a9ef01sm1456456pgn.36.2023.10.12.03.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 03:55:20 -0700 (PDT)
Message-ID: <27068b3a-50dd-4b24-8947-1329889efe89@gmail.com>
Date: Thu, 12 Oct 2023 16:24:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshul Dalal <anshulusr@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20231010184827.1213507-1-anshulusr@gmail.com>
 <7c570333-7334-435c-83cd-225817afc51c@linaro.org>
Content-Language: en-US
In-Reply-To: <7c570333-7334-435c-83cd-225817afc51c@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/12/23 14:09, Krzysztof Kozlowski wrote:
> On 10/10/2023 20:48, Anshul Dalal wrote:
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
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> ---
>>
>> Changes for v4:
>> - Fixed the URI for the id field
>> - Added `interrupts` property
>>
>> Changes for v3:
>> - Updated id field to reflect updated file name from previous version
>> - Added `reg` property
>>
>> Changes for v2:
>> - Renamed file to `adafruit,seesaw-gamepad.yaml`
>> - Removed quotes for `$id` and `$schema`
>> - Removed "Bindings for" from the description
>> - Changed node name to the generic name "joystick"
>> - Changed compatible to 'adafruit,seesaw-gamepad' instead of
>>   'adafruit,seesaw_gamepad'
>>
>>  .../input/adafruit,seesaw-gamepad.yaml        | 59 +++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>> new file mode 100644
>> index 000000000000..e8e676006d2f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/adafruit,seesaw-gamepad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Adafruit Mini I2C Gamepad with seesaw
>> +
>> +maintainers:
>> +  - Anshul Dalal <anshulusr@gmail.com>
>> +
>> +description: |
>> +  Adafruit Mini I2C Gamepad
>> +
>> +    +-----------------------------+
>> +    |   ___                       |
>> +    |  /   \               (X)    |
>> +    | |  S  |  __   __  (Y)   (A) |
>> +    |  \___/  |ST| |SE|    (B)    |
>> +    |                             |
>> +    +-----------------------------+
>> +
>> +  S -> 10-bit percision bidirectional analog joystick
>> +  ST -> Start
>> +  SE -> Select
>> +  X, A, B, Y -> Digital action buttons
>> +
>> +  Product page: https://www.adafruit.com/product/5743
>> +  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
>> +
>> +properties:
>> +  compatible:
>> +    const: adafruit,seesaw-gamepad
> 
> I thought seesaw is a name of a device, but it is not, thus it is  quite
> a generic compatible. Are you sure device does not have its name?
> Looking at product page, it indeed might not have.
> 

I chose the title from the datasheet:
https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
It lists the product name as "Adafruit Mini I2C STEMMA QT Gamepad with
seesaw" with STEMMA QT being the name of the 4-pin i2c connector that
Adafruit uses on their products. That's the most specific name for the
product I could find.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Anshul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
