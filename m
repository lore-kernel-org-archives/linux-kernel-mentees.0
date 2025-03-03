Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F413C9D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Mar 2025 04:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740976071; cv=none; b=Bl4Wup4HT4VdHiZAxNi5pVHNI8dUs13qbmP1prg3LTPerfF4zSRI8nyfvt00C+AHXDmLX/8BFWMKjT9u1sW6zJQ0iJAOMn8e+jIBYctc9rt74tSCSbnaWFC6VfbodmBW2fPnDA0w6c4Tm+0y+ziGoVxToATJ2pYASrTzc6975Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740976071; c=relaxed/simple;
	bh=HNnaj8o2a9E4BdcLiTNMcgTKpVot/6Pzc4Y5SZw5i+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmUlqk2xUvv8oKPl/y/cKPOoGYn1++LYATjWghr3uZ3Xs4xHt5iYEsSscRgRfZOMwaXDnPz2JRGYgYCrlT0XFMW9JGHE4Lu4K5dd6FJkyJxROtvCKTDakvZAHJ6r9uCZ25/SIM+aVqyvNFQagTTSiJw5P8EAcZgxKvMsqCYFusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=f58rg0mU; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=f58rg0mU; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="f58rg0mU";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="f58rg0mU"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9984740146
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Mar 2025 04:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.789
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_lfRBRY9I5w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Mar 2025 04:27:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=178.79.152.223; helo=mail.mleia.com; envelope-from=vz@mleia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B49040136
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=mleia.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B49040136
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=f58rg0mU;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=f58rg0mU
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1B49040136
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Mar 2025 04:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1740976064; bh=HNnaj8o2a9E4BdcLiTNMcgTKpVot/6Pzc4Y5SZw5i+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f58rg0mUSJFkiF2jKMIj4qql/VpoAyyk2nXAiakanyYdo8VsxK/clVewI7yYdgPGL
	 6FFFrqkVc68kX3g2TLDLG6iZUOLguuhahEKtCKcMOij2k+tbdhRw2XABSc2epNDFHr
	 wggn5ZLW4bElEdFmBib62x5CgD72TiIAw/ZEBY6yK+x+0l8WDj6KAxqN+3L1911FGB
	 5VfQEOeZOiuzFJmXSPTPaJgjKVTiHYuCcr+UwuGvaEDoZLjsYay4pG573+HOw/RQja
	 F7sdqWyXokSgxeRnybAdxnebEu3gjfqth76/n53hWFhJR9S26reJhZTtxZ2S5+l0dp
	 iGsdFJq2lNlSw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C6A653A627F;
	Mon,  3 Mar 2025 04:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1740976064; bh=HNnaj8o2a9E4BdcLiTNMcgTKpVot/6Pzc4Y5SZw5i+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f58rg0mUSJFkiF2jKMIj4qql/VpoAyyk2nXAiakanyYdo8VsxK/clVewI7yYdgPGL
	 6FFFrqkVc68kX3g2TLDLG6iZUOLguuhahEKtCKcMOij2k+tbdhRw2XABSc2epNDFHr
	 wggn5ZLW4bElEdFmBib62x5CgD72TiIAw/ZEBY6yK+x+0l8WDj6KAxqN+3L1911FGB
	 5VfQEOeZOiuzFJmXSPTPaJgjKVTiHYuCcr+UwuGvaEDoZLjsYay4pG573+HOw/RQja
	 F7sdqWyXokSgxeRnybAdxnebEu3gjfqth76/n53hWFhJR9S26reJhZTtxZ2S5+l0dp
	 iGsdFJq2lNlSw==
Message-ID: <09acba97-70e1-448e-8453-c4e1f67a035c@mleia.com>
Date: Mon, 3 Mar 2025 06:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
Content-Language: ru-RU
To: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250228034021.607135-1-leo.fthirata@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250228034021.607135-1-leo.fthirata@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250303_042744_836100_F3D90AA7 
X-CRM114-Status: GOOD (  11.71  )

Hello Leonardo.

On 2/28/25 05:39, Leonardo Felipe Takao Hirata wrote:
> Convert NXP LPC3220-MIC to DT schema.
> 
> Signed-off-by: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
> ---
> Changes in v3:
>   - Add interrupts property description
>   - Fix interrupts items descriptions
>   - Remove else condition
> ---

<snip>

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
> new file mode 100644
> index 000000000000..59e8814a15b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/nxp,lpc3220-mic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx MIC, SIC1 and SIC2 Interrupt Controllers
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@mleia.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,lpc3220-mic
> +      - nxp,lpc3220-sic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:

Please put here

   minItems: 2
   maxItems: 2

> +    items:
> +      - description: Regular interrupt request
> +      - description: Fast interrupt request
> +    description: IRQ and FIQ outputs of SIC1/SIC2 to the MIC.

Having both two descriptions under 'items:' and another description is
excessive, please leave only one of two.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,lpc3220-sic
> +    then:
> +      required:
> +        - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mic: interrupt-controller@40008000 {
> +        compatible = "nxp,lpc3220-mic";
> +        reg = <0x40008000 0x4000>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };
> +
> +    sic1: interrupt-controller@4000c000 {

Here sic1 label is not used, please remove.

> +        compatible = "nxp,lpc3220-sic";
> +        reg = <0x4000c000 0x4000>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
> +                    <30 IRQ_TYPE_LEVEL_LOW>;
> +    };

After the fixes please feel free to add the tag:

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
