Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7F141C85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E650441762
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 17:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E650441762
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.148
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMMicRpPSo1t
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 17:56:02 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 37E0F41761
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 17:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E0F41761
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58d564b98c9so2084021eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 09:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701194161; x=1701798961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs6R+1ViXv8isxXJHVhn7+t7Vqy/2+C/xsvsAMtl13I=;
        b=RyDZhlRDaPGfpnDdD8KsUrTmHD/NEyufETI/KKNVt6aHPJ8fEdVej9HSt2P01g4kNH
         Q5yfknQ10x+hh+4k56MWtUA6pTFb+6oq2Qc2m1OCQsl99bSfzxnOzVxIH5Qe+kXmP6o4
         3xJI+kpc7gDWnK9C1BWYtmCp3JQ/DOebZBhLI0QQMcFv6ssSn1Kh49Rq4h9hXNYv0dfR
         T4HQ8H0yJTIL9VRKY52vKAVWQDLBEc7dAWA1UUl20jGXvEw6xKVHri7cexkoIO07KgYQ
         PbMlyXxUWuzTVYyRP6Cbcqabk8j51+RE+O9SkMnpm4qdKL9LVwfD+iy181rNwfmTjSdz
         K5hA==
X-Gm-Message-State: AOJu0YwJiMOlspBOGFVat5494fuKkCl64/NpBcfWfJyrxXgyA4NIH5V1
	dSY5WJ6ItDmBRvZUAxyCWQ==
X-Google-Smtp-Source: AGHT+IGeg4re/q79qKMf1UiFl5udVI93xS3FHFxcA69DyiZXx7kQI5xJS90+UM5KshM+NJalD6QD5w==
X-Received: by 2002:a05:6820:22a9:b0:581:ed38:5506 with SMTP id ck41-20020a05682022a900b00581ed385506mr17626203oob.4.1701194161096;
        Tue, 28 Nov 2023 09:56:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a1782000000b0058d304dfc45sm1838862ooe.20.2023.11.28.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:56:00 -0800 (PST)
Received: (nullmailer pid 3563944 invoked by uid 1000);
	Tue, 28 Nov 2023 17:55:59 -0000
Date: Tue, 28 Nov 2023 11:55:59 -0600
From: Rob Herring <robh@kernel.org>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel-mentees@lists.linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Message-ID: <20231128175559.GA3560351-robh@kernel.org>
References: <20231128124042.22744-1-petre.rodan@subdimension.ro>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128124042.22744-1-petre.rodan@subdimension.ro>

On Tue, Nov 28, 2023 at 02:40:37PM +0200, Petre Rodan wrote:
> Adds binding for digital Honeywell TruStability HSC and SSC series
> pressure and temperature sensors. 
> Communication is one way. The sensor only requires 4 bytes worth of
> clock pulses on both i2c and spi in order to push the data out.
> The i2c address is hardcoded and depends on the part number.
> There is no additional GPIO control.
> 
> Datasheet:
> https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-hsc-series/documents/sps-siot-trustability-hsc-series-high-accuracy-board-mount-pressure-sensors-50099148-a-en-ciid-151133.pdf [HSC]
> Datasheet:
> https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-ssc-series/documents/sps-siot-trustability-ssc-series-standard-accuracy-board-mount-pressure-sensors-50099533-a-en-ciid-151134.pdf [SSC]
> Signed-off-by: Petre Rodan <petre.rodan@subdimension.ro>
> ---
> V2: - fix yaml struct
>     - cleanup based on Krzysztof's review
> V3: - rename range_str -> honeywell,pressure-triplet to define the string
>        containing the pressure range, measurement unit and type
>     - honeywell,pmax-pascal becomes uint32
> V4: - added enum to honeywell,transfer-function
> ---
>  .../iio/pressure/honeywell,hsc030pa.yaml      | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
> new file mode 100644
> index 000000000000..418fb1d2eefd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/pressure/honeywell,hsc030pa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Honeywell TruStability HSC and SSC pressure sensor series
> +
> +description: |
> +  support for Honeywell TruStability HSC and SSC digital pressure sensor
> +  series.
> +
> +  These sensors have either an I2C, an SPI or an analog interface. Only the
> +  digital versions are supported by this driver.
> +
> +  There are 118 models with different pressure ranges available in each family.
> +  The vendor calls them "HSC series" and "SSC series". All of them have an
> +  identical programming model but differ in pressure range, unit and transfer
> +  function.
> +
> +  To support different models one needs to specify the pressure range as well
> +  as the transfer function. Pressure range can either be provided via
> +  pressure-triplet (directly extracted from the part number) or in case it's
> +  a custom chip via numerical range limits converted to pascals.
> +
> +  The transfer function defines the ranges of raw conversion values delivered
> +  by the sensor. pmin-pascal and pmax-pascal corespond to the minimum and
> +  maximum pressure that can be measured.
> +
> +  Please note that in case of an SPI-based sensor, the clock signal should not
> +  exceed 800kHz and the MOSI signal is not required.
> +
> +  Specifications about the devices can be found at:
> +  https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-hsc-series/documents/sps-siot-trustability-hsc-series-high-accuracy-board-mount-pressure-sensors-50099148-a-en-ciid-151133.pdf
> +  https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-ssc-series/documents/sps-siot-trustability-ssc-series-standard-accuracy-board-mount-pressure-sensors-50099533-a-en-ciid-151134.pdf
> +
> +maintainers:
> +  - Petre Rodan <petre.rodan@subdimension.ro>
> +
> +properties:
> +  compatible:
> +    const: honeywell,hsc030pa
> +
> +  reg:
> +    maxItems: 1
> +
> +  honeywell,transfer-function:
> +    description: |
> +      Transfer function which defines the range of valid values delivered by
> +      the sensor.
> +      0 - A, 10% to 90% of 2^14
> +      1 - B, 5% to 95% of 2^14
> +      2 - C, 5% to 85% of 2^14
> +      3 - F, 4% to 94% of 2^14
> +    enum: [0, 1, 2, 3]
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  honeywell,pressure-triplet:
> +    description: |
> +      Case-sensitive five character string that defines pressure range, unit
> +      and type as part of the device nomenclature. In the unlikely case of a
> +      custom chip, set to "NA" and provide pmin-pascal and pmax-pascal.
> +    enum: [001BA, 1.6BA, 2.5BA, 004BA, 006BA, 010BA, 1.6MD, 2.5MD, 004MD,
> +           006MD, 010MD, 016MD, 025MD, 040MD, 060MD, 100MD, 160MD, 250MD,
> +           400MD, 600MD, 001BD, 1.6BD, 2.5BD, 004BD, 2.5MG, 004MG, 006MG,
> +           010MG, 016MG, 025MG, 040MG, 060MG, 100MG, 160MG, 250MG, 400MG,
> +           600MG, 001BG, 1.6BG, 2.5BG, 004BG, 006BG, 010BG, 100KA, 160KA,
> +           250KA, 400KA, 600KA, 001GA, 160LD, 250LD, 400LD, 600LD, 001KD,
> +           1.6KD, 2.5KD, 004KD, 006KD, 010KD, 016KD, 025KD, 040KD, 060KD,
> +           100KD, 160KD, 250KD, 400KD, 250LG, 400LG, 600LG, 001KG, 1.6KG,
> +           2.5KG, 004KG, 006KG, 010KG, 016KG, 025KG, 040KG, 060KG, 100KG,
> +           160KG, 250KG, 400KG, 600KG, 001GG, 015PA, 030PA, 060PA, 100PA,
> +           150PA, 0.5ND, 001ND, 002ND, 004ND, 005ND, 010ND, 020ND, 030ND,
> +           001PD, 005PD, 015PD, 030PD, 060PD, 001NG, 002NG, 004NG, 005NG,
> +           010NG, 020NG, 030NG, 001PG, 005PG, 015PG, 030PG, 060PG, 100PG,
> +           150PG, NA]
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  honeywell,pmin-pascal:
> +    description: |
> +      Minimum pressure value the sensor can measure in pascal.
> +      To be specified only if honeywell,pressure-triplet is set to "NA".

This constraint can be expressed as:

dependentSchemas:
  honeywell,pmin-pascal:
    properties:
      honeywell,pressure-triplet:
        const: NA

And similar for honeywell,pmax-pascal

> +    $ref: /schemas/types.yaml#/definitions/int32
> +
> +  honeywell,pmax-pascal:
> +    description: |
> +      Maximum pressure value the sensor can measure in pascal.
> +      To be specified only if honeywell,pressure-triplet is set to "NA".
> +    $ref: /schemas/types.yaml#/definitions/uint32
