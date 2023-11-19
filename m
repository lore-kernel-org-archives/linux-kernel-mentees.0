Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829851118E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pz/2EA2/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9BAD60A5B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9BAD60A5B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pz/2EA2/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jr3mCfOxu5BO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 19 Nov 2023 13:47:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB1EB60A5A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1EB60A5A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BDF360C6E;
	Sun, 19 Nov 2023 13:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61880C433C7;
	Sun, 19 Nov 2023 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700401658;
	bh=U1/crVe3cQalV1pEqgbYT0Du0EuyIuAjyAUdOqkkcSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pz/2EA2/Cop43Hoq7PHwPpLlcgrslPh04hOYxhAs11kufyTELWKXFkMo8AvH4cDDH
	 WJPOcsDP7hbVp4OtC8fs4M8W/VC1lw1zEj8pqiaFnn/QCSbX7Fd0rAsAHffXiOMJWN
	 q6AL8FuU3Wr7MacoKEjDIAhVy1ApfwiGvQkcVfImxgRzc4kV8wizDRSypZt1KiAaVh
	 gnb5KZQYrcZkVrHfKvq4Y0BLy6xJcpfO9MnvZo2jtP+a59UHuQEls3MPECpfglat48
	 tlY+BY0v05tiaEn5gvVfdajQWnPuVtMQ0liBXYHezZMJB9QfRQNbI6JC5C44Cd7B0G
	 T7ay90OQDJVmw==
Date: Sun, 19 Nov 2023 13:47:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add MCP4821
Message-ID: <20231119-surpass-cheer-9dc3838b766f@spud>
References: <20231117073040.685860-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xr+UPjWgGaRG4h0+"
Content-Disposition: inline
In-Reply-To: <20231117073040.685860-1-anshulusr@gmail.com>


--Xr+UPjWgGaRG4h0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 01:00:37PM +0530, Anshul Dalal wrote:
> Adds support for MCP48xx series of DACs.
>=20
> Datasheet:
>   [MCP48x1] https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
>   [MCP48x2] https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf
>=20
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/iio/dac/microchip,mcp4821.yaml   | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,m=
cp4821.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.=
yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
> new file mode 100644
> index 000000000000..904de15300bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/dac/microchip,mcp4821.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MCP4821 and similar DACs
> +
> +description: |
> +  Supports MCP48x1 (single channel) and MCP48x2 (dual channel) series of=
 DACs.
> +  Device supports simplex communication over SPI in Mode 0,1 and Mode 1,=
1.
> +
> +  +---------+--------------+-------------+
> +  | Device  |  Resolution  |   Channels  |
> +  |---------|--------------|-------------|
> +  | MCP4801 |     8-bit    |      1      |
> +  | MCP4811 |    10-bit    |      1      |
> +  | MCP4821 |    12-bit    |      1      |
> +  | MCP4802 |     8-bit    |      2      |
> +  | MCP4812 |    10-bit    |      2      |
> +  | MCP4822 |    12-bit    |      2      |
> +  +---------+--------------+-------------+
> +
> +  Datasheet:
> +    MCP48x1: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
> +    MCP48x2: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.=
pdf
> +
> +maintainers:
> +  - Anshul Dalal <anshulusr@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mcp4801
> +      - microchip,mcp4811
> +      - microchip,mcp4821
> +      - microchip,mcp4802
> +      - microchip,mcp4812
> +      - microchip,mcp4822
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dac@0 {
> +            compatible =3D "microchip,mcp4821";
> +            reg =3D <0>;
> +            vdd-supply =3D <&vdd_regulator>;
> +        };
> +    };
> --=20
> 2.42.1
>=20

--Xr+UPjWgGaRG4h0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoR9QAKCRB4tDGHoIJi
0p8QAQC38yhdhXb1PcvkIA/pVY7NY6OGkiJqdumywpDJyqsDRgD/XP0qyWMwaURl
9zBPIfcRCjAD7KXqB6d6YTYsZ5L1Jg8=
=VZnd
-----END PGP SIGNATURE-----

--Xr+UPjWgGaRG4h0+--
