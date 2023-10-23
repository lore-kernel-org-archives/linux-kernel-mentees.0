Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD4AC00A8F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 11:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B599260D75;
	Mon, 23 Oct 2023 11:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B599260D75
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h4cRIQHA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJPhRkOe8QOB; Mon, 23 Oct 2023 11:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D98B260BBD;
	Mon, 23 Oct 2023 11:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D98B260BBD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C23D8C0039;
	Mon, 23 Oct 2023 11:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0273CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 11:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05254013F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 11:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05254013F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h4cRIQHA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmEgZef0z7LQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 11:59:21 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC8B54054E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 11:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC8B54054E
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso2364603a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698062360; x=1698667160;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E6JlAMQZhNgDG/MUNka90wVBdFQqbCnW3Dxoc9mKAi4=;
 b=h4cRIQHAu1LzDJtFekRfcnF3sRYZp+McoHakGUUb4WfoR9mWy2qeoRgyNOfkL2aQs/
 8AGtzkhQaoZ0MJOcGmUt14lq7oerCRhti/M6CLPZuXh1a5pnXKvsGpGYxLFcuuEyAKuO
 gMjVUlQPSxSQS1+niVXQ1Pxd8/AT1P6CSsgF/lYXjCc6yiSfmMpUNTicxkhTlTTJy/hB
 lHJxUlP8dKnhOe6YcJLZbPvd7fVLJidj2blMbbHWXx9ODhZv/esEBrsjshBe2ragU0PP
 1dSTjRRhvISvOR1Vl/qq9gGWWr/Mlsjjn0isfOtiGkVHJhluhbmtOkL9iQovsZHSeHPG
 j9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698062360; x=1698667160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6JlAMQZhNgDG/MUNka90wVBdFQqbCnW3Dxoc9mKAi4=;
 b=gKGXeoAsVrUUs+D+pqPlUfr+R0LDjtLFjAaVG89xfK/WWHa16eKcXefK+zMqafw4/r
 /C4T8mQrlFR7nFx/BKpO8j8iQqwUiU3+qU/jvz1OBQ6cOwChLwXABPO+M2OjSdoGMV5G
 /T4l7xel0W5zrZAfFrHsZM/NE+v/lh58gkz/lkAz/sLDqDqtab/7zLRL2srbbZZMN2+k
 7DEeoeyvfThd6Ul6VNYIqYsGJBaUCq7p7Hdv43Tx4AtlaKUz9qUtiLPNjTjbd6EJHq0g
 KU7lgyMehW2Lfr1dRA+ZRyLmxhdDD94jYBOyBU+FNX/yQ159mnESzoKAF0+iPLGxGT6E
 3Ygg==
X-Gm-Message-State: AOJu0YyHMFjs1xekvibAToRP041MHplZU4V/wo6IJklk1IjUPLjzef5O
 mz8QLokbv6lgSoY9B7DdXjk=
X-Google-Smtp-Source: AGHT+IEXJ4bYW554Y1USLSlgYR6+LmpLGEpNPq/9gCTVmsxM35BqeiE0pvIzf7Q85QwCH14a5kGcVA==
X-Received: by 2002:a05:6a21:7185:b0:154:3f13:1bb7 with SMTP id
 wq5-20020a056a21718500b001543f131bb7mr10609574pzb.49.1698062360162; 
 Mon, 23 Oct 2023 04:59:20 -0700 (PDT)
Received: from [10.3.171.174] ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 t63-20020a625f42000000b006bf84460e96sm2480162pfb.214.2023.10.23.04.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 04:59:19 -0700 (PDT)
Message-ID: <7ef752b4-915b-4f9d-8425-79df8195656b@gmail.com>
Date: Mon, 23 Oct 2023 17:28:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
To: Jeff LaBundy <jeff@labundy.com>
References: <20231017034356.1436677-1-anshulusr@gmail.com>
 <ZTW0p2WG3/m1Tx+Z@nixie71>
Content-Language: en-US
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <ZTW0p2WG3/m1Tx+Z@nixie71>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
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

Hello Jeff,

On 10/23/23 05:17, Jeff LaBundy wrote:
> Hi Anshul,
> 
> On Tue, Oct 17, 2023 at 09:13:44AM +0530, Anshul Dalal wrote:
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
> Perhaps this ship has sailed, but is there any reason this simple device
> cannot be added to Documentation/devicetree/bindings/trivial-devices.yaml
> as opposed to having its own binding?
> 
> It has no vendor-specific properties, and the only properties are the
> standard properties already understood by the I2C core. In case I have
> misunderstood, please let me know.
> 

The driver currently implements only a subset of the functionality in
the Adafruit Seesaw specification. I eventually plan on adding adding
full support for the Seesaw framework in the form of a driver for the
atsamd09 seesaw breakout board:
https://learn.adafruit.com/adafruit-seesaw-atsamd09-breakout

Then I think it would be better for this driver to use the newly exposed
seesaw APIs by the atsamd09 driver instead of relying on kernel's i2c APIs.

I would also like to add support for the provided interrupt pin later
down the line which is documented in the binding along with description
of the non-standard action button layout.

Above were my reasons for going for a standalone binding, please let me
know if you disagree.

>> ---
>>
>> Changes for v5:
>> - Added link to the datasheet
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
>>  .../input/adafruit,seesaw-gamepad.yaml        | 60 +++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>> new file mode 100644
>> index 000000000000..3f0d1c5a3b9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
>> @@ -0,0 +1,60 @@
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
>> +  Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
>> +  Product page: https://www.adafruit.com/product/5743
>> +  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
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
> 
> Kind regards,
> Jeff LaBundy

Thank you,
Anshul Dalal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
