Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6390487A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6335581886
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 11:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6335581886
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.151
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0R7nS5cxLjv6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 11:37:32 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6FA52817A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 11:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA52817A3
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7a66aa8ebb7so215206139f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 03:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700566651; x=1701171451;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxdRsb+4u+iDRHXDxaazTznHq5QV0/4kpZbydWlBH4k=;
        b=IS2LwY1l2OeGHVRtLU6ozaiwEKto29RDbLLp9hRH/0YNyNeSOWxUnUgqfdaL2UCKtK
         zdy08+a9QW0XvNAzWnZYndmAOZ7ZNIfvevi+3Yy0zUbFDK9vx8kWT015cxzMzc47rv2L
         ydVRDMKbyrPR0DVUSYbpW23VFBa5KsLy/w0frd0dkhRFxTOah4Ebjsbh2vE57TdP36Mz
         +vddQm0XXTXSnru/2VGNBTnJ1Mce/TpLQLn+XJCkbbOSOAFK54BQIt4V08RgtQBud/6y
         2lNC2X+XJkVGi2u8kMwL9wnCwQWy2IBrdSgPkZH/eZODg4eqfb0ONT/EgKNWAh98TILy
         dsig==
X-Gm-Message-State: AOJu0YxNoFpo3ZfAzaPgCRwjUH42+WyuqP/+8dlWGje17uIK+GqWhAhc
	wRzNTnhYQ0z1viZcNBHH2g==
X-Google-Smtp-Source: AGHT+IF9RwR/tdwpnUsKSCPwqO9C9QV8Z9hofoZuMU2wzV56JcTooNqaq/juo/EIVhFfdZm0D55nKQ==
X-Received: by 2002:a6b:d316:0:b0:794:eaef:f43e with SMTP id s22-20020a6bd316000000b00794eaeff43emr10576258iob.1.1700566651419;
        Tue, 21 Nov 2023 03:37:31 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s8-20020a056602240800b0079ab2787139sm2853899ioa.7.2023.11.21.03.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 03:37:30 -0800 (PST)
Received: (nullmailer pid 1352673 invoked by uid 1000);
	Tue, 21 Nov 2023 11:37:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel-mentees@lists.linuxfoundation.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeff LaBundy <jeff@labundy.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231121101751.2189965-1-anshulusr@gmail.com>
References: <20231121101751.2189965-1-anshulusr@gmail.com>
Message-Id: <170056664884.1352637.4950371378934551272.robh@kernel.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: input: bindings for Adafruit
 Seesaw Gamepad
Date: Tue, 21 Nov 2023 04:37:28 -0700


On Tue, 21 Nov 2023 15:47:48 +0530, Anshul Dalal wrote:
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
> 
> ---
> 
> Changes for v9:
> - Added interrupt in example
> 
> v8: https://lore.kernel.org/lkml/20231108005337.45069-1-anshulusr@gmail.com/
> 
> Changes for v8:
> - no updates
> 
> v7: https://lore.kernel.org/lkml/20231106164134.114668-1-anshulusr@gmail.com/
> 
> Changes for v7:
> - no updates
> 
> v6: https://lore.kernel.org/lkml/20231027051819.81333-1-anshulusr@gmail.com/
> 
> Changes for v6:
> - no updates
> 
> v5: https://lore.kernel.org/lkml/20231017034356.1436677-1-anshulusr@gmail.com/
> 
> Changes for v5:
> - Added link to the datasheet
> 
> v4: https://lore.kernel.org/lkml/20231010184827.1213507-1-anshulusr@gmail.com/
> 
> Changes for v4:
> - Fixed the URI for the id field
> - Added `interrupts` property
> 
> v3: https://lore.kernel.org/linux-input/20231008185709.2448423-1-anshulusr@gmail.com/
> 
> Changes for v3:
> - Updated id field to reflect updated file name from previous version
> - Added `reg` property
> 
> v2: https://lore.kernel.org/linux-input/20231008172435.2391009-1-anshulusr@gmail.com/
> 
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of
>   'adafruit,seesaw_gamepad'
> 
> v1: https://lore.kernel.org/linux-input/20231007144052.1535417-1-anshulusr@gmail.com/
> ---
>  .../input/adafruit,seesaw-gamepad.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.example.dts:30.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231121101751.2189965-1-anshulusr@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

