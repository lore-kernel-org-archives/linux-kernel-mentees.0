Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01AEAD4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZxw/pfQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B49882169
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 11:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B49882169
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZxw/pfQ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDtzkivAk8Vd
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 11:36:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5464882158
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 11:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5464882158
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EEA7603E0;
	Sat, 25 Nov 2023 11:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4989AC433C7;
	Sat, 25 Nov 2023 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912183;
	bh=aCwCQvlfp9RlSvy/8J0HTVolXv3WTuhEcuknlDUIbko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pZxw/pfQvVAlZYNi2K0gVG5mHhMKiATOenG9idjwmEqla54ee+Dajv1wLTV7OlNup
	 /KkLSouuwAwxp2jQljbURTM2EDN5gqsZ1Ixi6ewNOF3nogJQZ7mb/IJ3J3aJORex6D
	 /b4Rpg9P6n/FECD4vMXelSwFffToD1cFcqh17e5oMgGGk2uIDNobxnAgBIDWlr32EE
	 EJcGDxM1LHdx6JKOrDJPNqatQaTiOAsspLKCwa6v/9g0SjglExjMgMEa2AMFviF3+F
	 2O4f+3jeTMkRgdyACtsaCJWll3p7rKUXpmKWX2B+hhNittRpNuZdlaq5HKs9hbon6x
	 C0eidqIl4PGow==
Date: Sat, 25 Nov 2023 11:36:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add MCP4821
Message-ID: <20231125113617.4d626bb2@jic23-huawei>
In-Reply-To: <20231117073040.685860-1-anshulusr@gmail.com>
References: <20231117073040.685860-1-anshulusr@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Nov 2023 13:00:37 +0530
Anshul Dalal <anshulusr@gmail.com> wrote:

> Adds support for MCP48xx series of DACs.
> 
> Datasheet:
>   [MCP48x1] https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
>   [MCP48x2] https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
Hi Anshul,

Usually we mark vdd-supply as required given I guess device doesn't work
without a supply. Obviously we don't actually have to provide it in a binding
if the supply is always on and we are fine with a stub regulator being
provided by the regulator subsystem.

There was some discussion about this a while back and conclusion was
mark them required in bindings anyway.  We haven't yet updated this in all
the older IIO bindings and it's a minor thing, but given the build warning
on patch 2 you are going around again so might as well tidy that up!

Jonathan


> ---
>  .../bindings/iio/dac/microchip,mcp4821.yaml   | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
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
> +  Supports MCP48x1 (single channel) and MCP48x2 (dual channel) series of DACs.
> +  Device supports simplex communication over SPI in Mode 0,1 and Mode 1,1.
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
> +    MCP48x2: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf
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

Whilst I understand the reasoning of keeping these grouped by number of channels,
I'd still rather see them in numeric order here and probably also in the table above.
Given that grouping by resolution rather than channels would also be a valid choice,
I don't see a strong reason to keep them out of order.

Also, manufacturers often get creative with numbering (when they run of out of digits
for example - maybe they'll do a 16 channel variant one day and then be stuck) so
trying to group things is often a loosing game long term!

Jonathan


>
