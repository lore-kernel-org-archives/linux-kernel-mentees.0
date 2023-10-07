Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B99E95A67
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 14:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B09B41726;
	Sat,  7 Oct 2023 14:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B09B41726
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EWLncaBK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiCi5hG6hlMP; Sat,  7 Oct 2023 14:52:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 237E2408FC;
	Sat,  7 Oct 2023 14:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237E2408FC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDFE7C0071;
	Sat,  7 Oct 2023 14:52:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E613C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0599682E22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0599682E22
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=EWLncaBK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAPN6esG4fNl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:52:30 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D0C282D2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0C282D2F
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso3026123f8f.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696690348; x=1697295148;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rr4KS+RdHXPaOwUEhGq6eyCLiCWzkyfb2ZUzhpz1DEU=;
 b=EWLncaBKdkAhrAFx9b2of4Qja+JxueCoJ52RKrsXBKnCFhxsOHxTg0yue0DIf566+s
 R4nsdw++vr1twSpDy5HZeWYWUY6iTHMvPejQ7ztgA1k69l4nmtc29oNSBzQgTNDjjm7C
 Y5DL+mx3X6lG0wm1W6D/GBz6ENAyCCl4dt4dwhsGzZNx/zrKFTGRxxWImO8jeHHpDuM0
 h2+A+bL/NwK34Yw3JS3Vt5CXOu+wOgd02okCaI7Wt+nghvzv3h43GdDoEh6bwmP2gKYW
 77vbDb88OMRz+I3OUaZiRK0zf4Qkt5H0fv6OSRKE86Riiy4FJ5dzsTM5xDV6woGfLBi/
 hORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696690348; x=1697295148;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rr4KS+RdHXPaOwUEhGq6eyCLiCWzkyfb2ZUzhpz1DEU=;
 b=p9djWr4pkzjwMQ5u4qiGi98zmKWj0L4Wjq6taXqUgvnz78T62e8YYQ9XIgeEYE35SU
 bIOKsfKrkcI75BWsbiTchkT9Kz3Lsx3n8PYvUt0lbbbmDUMSm1n0nBr09wNGNKav7M6x
 LRlr7bhcn57uQ0ZBpVnaPWubf55UNp4RLB6miDdOsl1rbOLvuhypmabKOBrX1iOD7YwD
 xB00W62/EuDsgBAScX45zOhVA9t4xpeqP+0vemV08ocmfTQJMqWfXTZoZO95YJOWI/kO
 YrtLM9o0X584qP8sRvrDrvt30sacWghyUXpp3xVzvHn9NrX+Kps5IJA5rwBkdqr/zRWS
 nhHg==
X-Gm-Message-State: AOJu0YxlUBqvdzuA7lCsqIz1hnHhDJUnMplgNN2x4rjUqHcZ+3XbGDwa
 2oX0/xJuF6UoFZ8P5x6u+fPDSw==
X-Google-Smtp-Source: AGHT+IGpxqpdeRFi0ygvuw0BeQessI8LTB38Hfohl4c6vDz4e4I/ahf4vqHBvHUebSJR1/VVlmWPLQ==
X-Received: by 2002:a5d:6909:0:b0:314:dc0:2fca with SMTP id
 t9-20020a5d6909000000b003140dc02fcamr10005226wru.29.1696690348277; 
 Sat, 07 Oct 2023 07:52:28 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0031f8a59dbeasm4414768wro.62.2023.10.07.07.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 07:52:27 -0700 (PDT)
Message-ID: <a84ab922-cf44-423c-bf63-a7623a90270e@linaro.org>
Date: Sat, 7 Oct 2023 16:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add bindings for Adafruit Seesaw Gamepad
Content-Language: en-US
To: Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231007144052.1535417-1-anshulusr@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231007144052.1535417-1-anshulusr@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On 07/10/2023 16:40, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.

Thank you for your patch. There is something to discuss/improve.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> 
> Steps in reading the gamepad state over i2c:
>   1. Reset the registers
>   2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
>       `BUTTON_MASK`: A bit-map for the six digital pins internally
>        connected to the joystick buttons.
>   3. Enable internal pullup resistors for the `BUTTON_MASK`
>   4. Bulk set the pin state HIGH for `BUTTON_MASK`
>   5. Poll the device for button and joystick state done by:
>       `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`


This describes driver, not bindings or hardware Please instead describe
hardware.

> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> Tested on RPi Zero 2W

How can you test bindings on RPi Zero 2W? Somehow I don't believe you,
see below.

> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
>  .../bindings/input/adafruit_seesaw.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml b/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
> new file mode 100644
> index 000000000000..1d00d9da637a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml

Use compatible syntax, so vendor-prefix,device-name.yaml

> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/adafruit_seesaw.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +
> +title: Adafruit Mini I2C Gamepad with seesaw
> +
> +maintainers:
> +  - Anshul Dalal <anshulusr@gmail.com>
> +
> +description: |
> +  Bindings for Adafruit Mini I2C Gamepad

Drop "Bindings for"

> +
> +    +-----------------------------+
> +    |   ___                       |
> +    |  /   \               (X)    |
> +    | |  S  |  __   __  (Y)   (A) |
> +    |  \___/  |ST| |SE|    (B)    |
> +    |                             |
> +    +-----------------------------+
> +
> +  S -> 10-bit percision bidirectional analog joystick
> +  ST -> Start
> +  SE -> Select
> +  X, A, B, Y -> Digital action buttons
> +
> +  Product page: https://www.adafruit.com/product/5743
> +  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
> +
> +properties:
> +  compatible:
> +    const: adafruit,seesaw_gamepad
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    seesaw_gamepad@50 {

No underscores, generic node names.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "adafruit,seesaw_gamepad";
> +        reg = <0x50>;

Second hint that you did not test it...

> +    };

Best regards,
Krzysztof

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
