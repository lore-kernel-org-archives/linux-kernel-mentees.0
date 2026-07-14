Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCDD3F7A95
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 22:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069096; cv=none; b=WmTkCNFGtxzHYjIUUTMl0d/qbiznPMf+PRT2Mutl96ySHyCvZqPPNY12FrYIQ+qplBqBljMsx4gmx0DtamJMWwFk9OE2Mgj63wO5zUJYL6EKJ0lczfi/VfFZf/Jzy6tJPW5sudLBLuM2oSzoZfTFuPoj9utJGyF0b6dfKX0x1ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069096; c=relaxed/simple;
	bh=IWg7h/nT9ksI40PAZL2tVSUITPB/X+Xz/LaQbTYLczY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xovwsl6lRJsNDSxQhWnKsQjBe0dTPG5QGNTY9TKdXp9BYdo7u8GC116N/knE6FGzF4rb2NhBd6nkzYEYjLuNpKcGXuC/4RJUsb3/YBqkiEAoWjN+DRWPEGgzStBTA4vrt8js4NZoMwz05FsBRMyNJgHpEr8khKyEJw7M/xb57RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H7adP/Uu; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H7adP/Uu"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a38e41d0b5so37162eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 15:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784069088; x=1784673888; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwb2dneFZMtuZJko5tDWoxwvXN4zsuxJo4rgCNZwx1w=;
        b=H7adP/Uuy109/+cz6CkbqA172CzLxH5gm7kC9LFWlAGeDyxIKTA16xsKJtH9a5eCM1
         DlJ24uc3eUVkla6KRt5aEusPXjZ+23ymb+3uPa8XQcOh83tW4dVMmTTb1cKY8qXciCR4
         rgB8+Xz1j594LUGo9ytEhw4/VQOUal5wDwVtb0dlsSncU/oGS0l6os45yqCfVIs1qDjW
         z0qIORddjel1C5tzheODm5RA3246ohSxRFSeWjtd1JaYEtFAGEEMcRb49YIahT3myYIr
         XR9+VD/zlcpZHATm6Ix2RbkpEFRqvoP/UkjqB+zmmtJfYWLWtxSdWWva1ZtP/yI+v/7j
         PtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069088; x=1784673888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwb2dneFZMtuZJko5tDWoxwvXN4zsuxJo4rgCNZwx1w=;
        b=RNEqctP6L9gBRfwyX9Futjp06yFyafQm+R9FabyD4QUK2uX9DS0XgwheBW+hZuBCjs
         Me8+exOn6pm0Y5Nsumx6jyBiER7wOZ2WERE61Zukxz4Eml6qsaJrt5QuK/hINC3mtPLt
         nb7HZFa7q/GFHWsBcgD1t03i54bdKc/GcdpCGLOeZ2IdrlYG35xx4XiO7dNocarosdrM
         Bc4bO+EfRNFRRfY/7/ITi88RlIW/f2mbWSrPjbmA3U85jRZ43Z3V0oXnehf7tLEXXY4a
         a+DpCYqVw7v2MVFfdg+Pwl/20qNs5FRzbhoQYC5B5Rwws9X1vHqaHRjpxhQCDQT6c4nZ
         Itnw==
X-Forwarded-Encrypted: i=1; AFNElJ/hD1EqDyeOoWR8/4sYEhPGuXUTTSgZBW4MU98UO7eTvwta/VyqMwBKWqXT/VPyXa402uFDgJ8H8ynnO/uiuohstiNXNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwjr400IjmRYJWas3Uh1vW2rMi6S4R6Bb0g3X2V1IrT0YWegUd
	2aln48RTivqO6MbPe/5EKxq/NKKhsfy9OFZ31wIrINY+VIxKa3RWlpwG5ysTkPCNHbg=
X-Gm-Gg: AfdE7cmXREc7rGuD/JsEsjBlbGw/tYWwXn8eEnsIHb7NJ/mQfXXSNXYDmdTeSbbeU/Y
	DY1KUDuzrSXkRUh1WteUjYsDDVLBHPp5OMW7aA3+RRxBvZpJfc8MJCqslofZaPJHKBvrhOv930O
	KGaU3QcwDykxVUDDqVy8+tRfd69qBjSgYsLwKcPXd++YDNUEj3cFERN+K9KPEFmChjHYgDfAZZj
	sGJhoEDJJsANsS18wBzarN/QZJ9c73fWelfYTjlF0QPyFBKfGwnufNvXnoYhHEffqF72jbcowB3
	so8qXd6T8R13fNKnURAWnfIVcCjD4HvWkLzFssJ629Uop2yDkbX7BPUKzCADThxsQQXDMBpqP2R
	CFlz0iDRuSMMT7aQR5L6WTU4+nVDjN6jm5/CXkkjecA/VXCmgK7fimUoggPYUIc6DtkKb+lMjL4
	3yn/5fTFDOABMkfkkMrEcrLQC6IuNdSrMYKOUKT6Ri8xSGnGNDxexo3FQ9E6g7kZo=
X-Received: by 2002:a4a:e90c:0:b0:6a1:60cd:9860 with SMTP id 006d021491bc7-6a39bc3ec33mr7163339eaf.10.1784069088561;
        Tue, 14 Jul 2026 15:44:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:280e:69fd:7612:d5a9? ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bc0d0sm16137864a34.19.2026.07.14.15.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 15:44:48 -0700 (PDT)
Message-ID: <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
Date: Tue, 14 Jul 2026 17:44:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 4:30 PM, Rodrigo Gobbi wrote:
> The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
> but it is not one: besides the I2C interface it exposes a power-enable pin
> and a mode-control pin (the latter also used for the PWM distance output).

IIRC, we are not adding the mode-control pin to the DT bindings because
it would be an alternative to the I2C bus and not likely to be used (would
require something like a PWM controller with a non-cyclic, bidirectional
channel).

We should explain that in the commit message.

> 
> Move it to a dedicated binding file.

And add we are adding the missing properties, so should mention that too.


> While at it, document the LIDAR-Lite
> v3: it is sold by Garmin, which acquired PulsedLight, and is
> pin-compatible with the v2, so add it with "pulsedlight,lidar-lite-v2"
> as a fallback compatible.

This is a separate change, so deserves a separate patch.

The complaint in v3 was just that the removing .txt and adding .yaml should
be in the same patch.

> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> This was on my plate and I didn't have a chance to send this before.
> 
> The vendor change is not a typo: see the discussion at [1].
> Tks and regards.

Ideally, this would be explained well enough in the commit message that
we don't need the link.

> 
> [1] https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmail.com/
> 
> Changelog:
> v4: unify patches rather than using a series to keep the tree bisectable;
>     rewrite the commit msg, naming the devices explicitly;

We lost the IIO driver patch though. The change adding a new compatible
won't be accepted without it.

> v3: https://lore.kernel.org/all/20251102221643.9966-1-rodrigo.gobbi.7@gmail.com/
> v2: https://lore.kernel.org/all/20250801224112.135918-1-rodrigo.gobbi.7@gmail.com/
> v1: https://lore.kernel.org/all/20250701223341.36835-1-rodrigo.gobbi.7@gmail.com/
> ---
>  .../proximity/pulsedlight,lidar-lite-v2.yaml  | 54 +++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |  2 -
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
> new file mode 100644
> index 000000000000..60e60b7769ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pulsedlight LIDAR-Lite v2 range-finding sensor

Could make the title more general:

	Pulsedlight/Garmin LIDAR-Lite range-finding sensors

> +
> +maintainers:
> +  - Matt Ranostay <mranostay@gmail.com>
> +
> +description: |

> +  Support for LIDAR-Lite v2 and v3 laser rangefinders. These devices

The title already says this.

> +  can use a simple I2C communication bus or can operate in a PWM mode using a
> +  mode control pin to trigger acquisitions and return the measured distance.

Probably worth mentioning the bindings are just for I2C usage for now.

Links to datasheets are also useful.

> +  They also have a power enable pin, which can be used to shut off the device.

We can see this in the properties, so don't need to say it here.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - grmn,lidar-lite-v3
> +          - const: pulsedlight,lidar-lite-v2
> +      - const: pulsedlight,lidar-lite-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: GPIO that can be driven low to shut off power to the device.
> +    maxItems: 1
> +
> +  vdd-supply: true
> +

interrupts:
  description: 
    Mode control pin can be used as a status output to provide interrupt.
  maxItems: 1

Mode control pin can also be clock output, so we could add:

'#clock-cells':
  const: 0

if:
  required:
    interrupts
then:
  '#clock-cells': false

I only checked Lidar Lite v3 docs, so we should see if these are available
on v2 as well.

> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        lidar@62 {
> +            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
> +            reg = <0x62>;
> +            vdd-supply = <&vdd_5v0>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 435c4baab436..74b640c48598 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -396,8 +396,6 @@ properties:
>            - onnn,adt7462
>              # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
>            - plx,pex8648
> -            # Pulsedlight LIDAR range-finding sensor
> -          - pulsedlight,lidar-lite-v2
>              # Renesas HS3001 Temperature and Relative Humidity Sensors
>            - renesas,hs3001
>              # Renesas ISL29501 time-of-flight sensor

