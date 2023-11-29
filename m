Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E942125A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=subdimension.ro header.i=@subdimension.ro header.b="ltFKlGOM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D83F8438A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 08:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D83F8438A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=subdimension.ro header.i=@subdimension.ro header.a=rsa-sha256 header.s=skycaves header.b=ltFKlGOM
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.307
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mh3JWXSVCkfR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 08:44:43 +0000 (UTC)
Received: from mail.subdimension.ro (unknown [IPv6:2a01:7e01:e001:1d1::2])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 39AE08196E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 08:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39AE08196E
Received: from sunspire (unknown [188.24.94.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.subdimension.ro (Postfix) with ESMTPSA id 91A8328EE6F;
	Wed, 29 Nov 2023 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=subdimension.ro;
	s=skycaves; t=1701247479;
	bh=8dG6wXZ7YD/GD8RPYXq9Rwlv5prQ9VGMtUd8zQki0VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltFKlGOMTS2z7yJpkWIalxYIAoonpPcij+FCZFtsabdKeeymjkqMejYPKGYgHnKjY
	 PpcJjqxw3o4RAFxy1G0b6UrABEIc4D95+rpyVnbO0cEz8pOdPI939lSKiiipudbWW/
	 Eaxw4nHqwbHMv3/ivqAnR1KRC4N/CF3MyT/1pOo0=
Date: Wed, 29 Nov 2023 10:44:38 +0200
From: Petre Rodan <petre.rodan@subdimension.ro>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Message-ID: <ZWb59iEftxX6mQdJ@sunspire>
References: <20231129070432.1437-1-petre.rodan@subdimension.ro>
 <adf1e932-a201-475e-a562-4e35954159ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adf1e932-a201-475e-a562-4e35954159ee@linaro.org>


hi,

On Wed, Nov 29, 2023 at 09:04:17AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2023 08:04, Petre Rodan wrote:
> > Adds binding for digital Honeywell TruStability HSC and SSC series
> > pressure and temperature sensors.
> > Communication is one way. The sensor only requires 4 bytes worth of
> > clock pulses on both i2c and spi in order to push the data out.
> > The i2c address is hardcoded and depends on the part number.
> > There is no additional GPIO control.
> 
> Your threading is broken (not existing) since v4, making it difficult to
> apply the patchset. Please fix it when sending v6.

I'm confused.

you mean the lack of 'In-Reply-To' and 'References' headers in the emails
`git send-email` is generating?
I've added them for v2, but was told that was a mistake [1]

[1] https://lore.kernel.org/lkml/20231125191915.7f1f2dc4@jic23-huawei/

I'm probably misunderstanding something.
also, I hope v5 is flawless enough.

best regards,
peter

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

-- 
petre rodan
