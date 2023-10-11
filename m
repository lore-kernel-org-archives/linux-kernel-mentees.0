Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45401CDB47C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 19:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A77418F2;
	Wed, 11 Oct 2023 19:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A77418F2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CYNaM0lU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8hqjSIODCVZ; Wed, 11 Oct 2023 19:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B60F341877;
	Wed, 11 Oct 2023 19:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B60F341877
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B300C0071;
	Wed, 11 Oct 2023 19:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48E3DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23E4860EE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E4860EE5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CYNaM0lU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIh9q20NSzkY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:00:55 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E061C60E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E061C60E97
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-690d8c05784so89698b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 12:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697050854; x=1697655654;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lgH80giGdocd0lWZvSZ+nxWXaTP5RcrQOuV73pIouaA=;
 b=CYNaM0lU5BCZVXR8IqHuFVMzQqegonq4zQGIxcBSAD6s72IgGPnO55C7gQOJaYDYvl
 xNydi8gAimLztktU21n7z1zmN+6TbZ5hME3884dvRzCWGE2/UyRt39j/MnZiMmj9hUam
 ut2FwYxdPLFO8casaynBkvv33plxcItW8rkI+rrePC/btvkyBF/w3BAcOgsvBMkQJYEp
 cgyk3vL71AF16KP2iV9tj+H1Te3atFJglaQfmp+QoZ2Jic4rJIso1alz4nLt0+MUgFOy
 pCjvMTmLt8NnpeBzMMiG761k7EmcM5V1noRAnl3egeL+hsLaIryPUhlTC5fRuXPMVHxM
 gThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697050854; x=1697655654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lgH80giGdocd0lWZvSZ+nxWXaTP5RcrQOuV73pIouaA=;
 b=W5ztcjbNm8MjNCWhGQZhQMlqFemlgVk0bslMuuKIQvi344J7mRiSqEKlKVcYOrseYq
 UF72BCWtJHCRwnLpmazsTK4vPwqnQDl/QdyX98+bQ3zttwyfqu+nZ5QN3XZZProkCz6G
 CvX8dES/vfg3x2Edbt7dh3f+A1jqBYe6K4XPW+BH2Jkfm4sDjAOyDG2hBxrNfYFyiQsz
 iN9Ha0cDd40fHbRxIuhZ30C8y04PDH51jZwQFvjvJXGgKf/j0daMVDm7D7feeH+/N4Bn
 erWCoXyj7Nv9guyqGPvwpfNiRk9evubtS8CVU/B+ung7MIHvaHcIgIeDrWx0vct8QcIx
 o5EA==
X-Gm-Message-State: AOJu0YwE1lORGgySwfQKP7OSGbB9JoMJORqVqqI0nuMMz2ZaqFpRUK0B
 7IPoRrtmlUZYf8X491vHr5w=
X-Google-Smtp-Source: AGHT+IHB87s15cez9sVKr6yfH1HSR+x0sakHHdwVAEYjQprXEksklIJbJPK0dnmo6MXrBEDLIsCFpQ==
X-Received: by 2002:a05:6a00:2e20:b0:68e:42c9:74e0 with SMTP id
 fc32-20020a056a002e2000b0068e42c974e0mr22999550pfb.3.1697050854108; 
 Wed, 11 Oct 2023 12:00:54 -0700 (PDT)
Received: from [10.3.171.174] ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a62e50e000000b0069319bfed42sm10344972pff.79.2023.10.11.12.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 12:00:53 -0700 (PDT)
Message-ID: <f1796d1a-bcd0-414d-b4e1-806e93eb202b@gmail.com>
Date: Thu, 12 Oct 2023 00:29:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231010184827.1213507-1-anshulusr@gmail.com>
 <20231011-powdering-recycled-71608e794eaa@spud>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <20231011-powdering-recycled-71608e794eaa@spud>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Hello,

On 10/11/23 21:45, Conor Dooley wrote:
> Hey,
> 
> On Wed, Oct 11, 2023 at 12:18:23AM +0530, Anshul Dalal wrote:
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
> 
> Binding mostly looks good to me. My main question is what is a seesaw?
> 

Seesaw is a universal framework that enables extending I/O capabilities
of the i2c master devices with a compatible breakout board. As it
relates to the binding, this gamepad uses an AVR ATtiny816
microcontroller that reads the data from the buttons and the joystick
and sends the data to the master over i2c using the Seesaw framework.

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
> 
> I'm not really sure what the arduino driver has to do with the binding.
> Why is a link to it more relevant than the freebsd driver, or the linux
> driver etc? Is there info about how the pad works in the arduino driver
> 
> Otherwise, this seems good to me.
> 
> Thanks,
> Conor.

The Arduino driver I linked was the only resource that had the
implementation of the seesaw framework as well as the example code
specific to this device:
https://github.com/adafruit/Adafruit_Seesaw/tree/master/examples/Mini_I2C_Gamepad_QT
On further thought, a link to the accompanying document from the
manufacturer (https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf)
might be more relevant for the binding which includes the hardware
description as well as links to the above-mentioned Arduino driver.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: adafruit,seesaw-gamepad
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      The gamepad's IRQ pin triggers a rising edge if interrupts are enabled.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        joystick@50 {
>> +            compatible = "adafruit,seesaw-gamepad";
>> +            reg = <0x50>;
>> +        };
>> +    };
>> -- 
>> 2.42.0
>>

Thanks for the review.

Best Regards,
Anshul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
