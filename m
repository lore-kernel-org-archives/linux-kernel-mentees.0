Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3D539F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjJVHMw5"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31E860B0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 12:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31E860B0B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tjJVHMw5
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AB_NnSi42clf
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 12:12:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5C9DF60AE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 12:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9DF60AE1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97B7C60BD6;
	Sat, 25 Nov 2023 12:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0756C433C7;
	Sat, 25 Nov 2023 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700914374;
	bh=HaPs6rO9d02viq7dWMbdaoM03RBF1QX65JlhKX2KKcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tjJVHMw53dN8MvofGbFCvqRLyBp8d4KD3v9p3MR2ir5f2sqPK/Yi2pCsrlUXUqEU1
	 PZsoI54sw3oatvY01aMh71m2kgvNQ/tSD64kB3wt2ShKlQIaIrMzY3bFNnShrs5M1A
	 br965+pL9uE44PkwUOr1gFvNbrHDJXR7lXdKAgK4+sZxZGZ4vBl48tPHGkL/JMzgmP
	 rtom8SJ1Af1Cs9BedYeDJubTAB6jQFpp+HkKpEM479SNzc8JsMH2gr/dDCeAfECyMI
	 ZyhsXzMePWmUzIipB7kJ23N5gbryxnE6h2VagHBIa0Ox5bNdowsWeUl1bMwmIoY51E
	 JNf5JYCYE8N0w==
Date: Sat, 25 Nov 2023 12:12:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: chemical: add aosong,ags02ma
Message-ID: <20231125121245.6664470d@jic23-huawei>
In-Reply-To: <20231125100139.193584-2-anshulusr@gmail.com>
References: <20231125100139.193584-1-anshulusr@gmail.com>
	<20231125100139.193584-2-anshulusr@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Nov 2023 15:31:37 +0530
Anshul Dalal <anshulusr@gmail.com> wrote:

> Add bindings for Aosong AGS02MA TVOC sensor.
> 
> The sensor communicates over i2c with the default address 0x1a.
> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
> 
> Datasheet:
>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
> Product-Page:
>   http://www.aosong.com/m/en/products-33.html
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> 
> Changes for v4:
> - Changed node name from 'light-sensor' to 'voc-sensor'
> 
> v3: https://lore.kernel.org/lkml/20231121095800.2180870-2-anshulusr@gmail.com/
> 
> Changes for v3:
> - Fixed commit message
> - Removed "asair,ags02ma" compatible
> 
> v2: https://lore.kernel.org/lkml/20231115125810.1394854-2-anshulusr@gmail.com/
> 
> Changes for v2:
> - Removed device from trivial-devices
> - Added standalone binding with vdd-supply property
> 
> v1: https://lore.kernel.org/lkml/20231107173100.62715-2-anshulusr@gmail.com/
> ---
>  .../bindings/iio/chemical/aosong,ags02ma.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
> new file mode 100644
> index 000000000000..c176a6e102ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/chemical/aosong,ags02ma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aosong AGS02MA VOC Sensor
> +
> +description: |
> +  AGS02MA is an TVOC (Total Volatile Organic Compounds) i2c sensor with default
> +  address of 0x1a.
> +
> +  Datasheet:
> +    https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
> +
> +maintainers:
> +  - Anshul Dalal <anshulusr@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aosong,ags02ma
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true

Similar to other review (I put more background there)
Convention these days at least is to always require powersupplies
that the device cannot work with out (even if you can use a fixed
supply and rely on the regulator framework papering over that).
We want to distinguish generally optional supplies from ones we might
not specify in a given DT.

Jonathan

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
> +        voc-sensor@1a {
> +            compatible = "aosong,ags02ma";
> +            reg = <0x1a>;
> +            vdd-supply = <&vdd_regulator>;
> +        };
> +    };

