Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A0443C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QE8EOBN4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D49424168C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 19:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D49424168C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=QE8EOBN4
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qi-rIVXEIJ_x
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 14 Nov 2023 19:20:50 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4DA32400D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 19:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA32400D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1699989646;
	bh=k8+NOpdnACMH2/pF12mSk0Wious1DDALWoloICjmG0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE8EOBN4I3p8IzZ03CbVFBzTlpef8t8K/vqECz6a0xyhGHuWcvaIe3RXTWj1+6FvD
	 WCjzCS93QieLlU7ZuzY99vdsfwoLS4YggJZ7tutauTTgQ+a+M00kTtTGPvAQDXhKnB
	 X5wwz6xm2H4lwSpRw31mvJjg+sAEBJskGBYYaJnw=
Date: Tue, 14 Nov 2023 20:20:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <0defc0e3-dc15-459d-9e71-64f3c38a6931@t-8ch.de>
References: <20231108005337.45069-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108005337.45069-1-anshulusr@gmail.com>

On 2023-11-08 06:23:35+0530, Anshul Dalal wrote:
> Adds bindings for the Adafruit Seesaw Gamepad.
> 
> The gamepad functions as an i2c device with the default address of 0x50
> and has an IRQ pin that can be enabled in the driver to allow for a rising
> edge trigger on each button press or joystick movement.
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> 
> Changes for v8:
> - no updates
> 
> Changes for v7:
> - no updates
> 
> Changes for v6:
> - no updates
> 
> Changes for v5:
> - Added link to the datasheet
> 
> Changes for v4:
> - Fixed the URI for the id field
> - Added `interrupts` property
> 
> Changes for v3:
> - Updated id field to reflect updated file name from previous version
> - Added `reg` property
> 
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of
>   'adafruit,seesaw_gamepad'
> ---
>  .../input/adafruit,seesaw-gamepad.yaml        | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> new file mode 100644
> index 000000000000..3f0d1c5a3b9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/adafruit,seesaw-gamepad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Adafruit Mini I2C Gamepad with seesaw
> +
> +maintainers:
> +  - Anshul Dalal <anshulusr@gmail.com>
> +
> +description: |
> +  Adafruit Mini I2C Gamepad
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
> +  Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
> +  Product page: https://www.adafruit.com/product/5743
> +  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
> +
> +properties:
> +  compatible:
> +    const: adafruit,seesaw-gamepad

I don't really have any clue about devicetree, but shouldn't the actual
driver have an id-table for this "compatible"?

It had one up to v5 of the patchset.

Jeff had some comments about the OF aspect [0], but to me the state now
seems incorrect.
Maybe the DT can be dropped completely?

Jeff, could you advise?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The gamepad's IRQ pin triggers a rising edge if interrupts are enabled.

Interrupts are not supported yet by the driver.
Should the property be there already?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        joystick@50 {
> +            compatible = "adafruit,seesaw-gamepad";
> +            reg = <0x50>;
> +        };
> +    };
> -- 
> 2.42.0

[0] https://lore.kernel.org/lkml/ZTWza+S+t+UZKlwu@nixie71/
