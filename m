Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5DAE95A82
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 18:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE8C40C28;
	Sun,  8 Oct 2023 18:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE8C40C28
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SkZlKBa2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8vfGDnMC4d4; Sun,  8 Oct 2023 18:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63B1F40C0C;
	Sun,  8 Oct 2023 18:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B1F40C0C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CFE5C0039;
	Sun,  8 Oct 2023 18:12:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA50CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FCE60B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FCE60B6E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=SkZlKBa2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vldkkIqywTqq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:12:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D56060B68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D56060B68
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D328F60B8F;
 Sun,  8 Oct 2023 18:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AFEC433C7;
 Sun,  8 Oct 2023 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696788774;
 bh=E5/HWNcNVn0Vk+HqTyeYnqun/DSdOEEm7BiBOhqFxjM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SkZlKBa2y8K766KbibYjcG0/p9UvOys1E4g9EJg8lvUR0oDqV620U8uRuEaPM5DA+
 l4zsZCD2EtAEc+WomzmI85obiUvE5YvjSmBr770mhVIqJlG6bJ0mAgpIkpm3Yf0Lmw
 Wu4IN1TdbKCdeGGjmoV2p3H+6z1GJ/ObaACp4jt61WHal7Ow7p3Nz/VJJolhO3DLHq
 AtsaDdELFins+0fCPf2OgEWFXieOiEe2cgnbyxPOE6ziQrpWUqQO9tx19ptKoulnZD
 eqAXvvf/Srkw938FP8rIFBJVQqamlwHqwTnN7rvrL6aH9MaiDE/JLH5+fvkr48g/bw
 RWNdsBgUfdPng==
Received: (nullmailer pid 52836 invoked by uid 1000);
 Sun, 08 Oct 2023 18:12:52 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <20231008172435.2391009-1-anshulusr@gmail.com>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
Message-Id: <169678877266.52804.3494265677857240747.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit
 Seesaw Gamepad
Date: Sun, 08 Oct 2023 13:12:52 -0500
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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


On Sun, 08 Oct 2023 22:54:33 +0530, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
> 
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> For testing on a RPi Zero 2W, I utilized the following devicetree overlay:
> 
> /dts-v1/;
> /plugin/;
> / {
> 	compatible = "brcm,bcm2835";
> 	fragment@0 {
> 		target = <&i2c1>;
> 		__overlay__ {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			joystick@50 {
> 				compatible = "adafruit,seesaw-gamepad";
> 				reg = <0x50>;
> 			};
> 		};
> 	};
> };
> 
> I used the above overlay as reference for writing this binding. Though the
> gamepad also has an interrupt pin that needs to be enabled explicitly (not
> currently implemented in driver). The pin triggers a rising edge when a
> button is pressed or joystick is moved which can be detected on a GPIO
> of the Microcontroller.
> 
> I wasn't sure how to represent that functionality in the binding so I have
> left it out for now.
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> 
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'
> 
>  .../input/adafruit,seesaw-gamepad.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.example.dtb: joystick@50: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231008172435.2391009-1-anshulusr@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
